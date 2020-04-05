package pers.qingyu.home.web.socket;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import net.sf.json.JSONObject;

@ServerEndpoint("/webSocket/{username}")
public class WebSocket {
	private static int onlineCount = 0;
	private static Map<String, WebSocket> clients = new ConcurrentHashMap<String, WebSocket>();
	private Session session;
	private String userId;

	@OnOpen
	public void onOpen(@PathParam("username") String username, Session session) throws IOException {

		this.userId = username;
		this.session = session;

		addOnlineCount();
		clients.put(username, this);
	}

	@OnClose
	public void onClose() throws IOException {
		clients.remove(userId);
		subOnlineCount();
	}

	@OnMessage
	public void onMessage(String message) throws IOException {
		JSONObject jsonTo = JSONObject.fromObject(message);
		String type = (String) jsonTo.get("dataType");
		String content = (String) jsonTo.get("content");
		if (type.equals("text")) {
			sendMessageTo(content, (String) jsonTo.get("receiveId"));
		}
	}

	@OnError
	public void onError(Session session, Throwable error) {
//		 error.printStackTrace();
	}

	public void sendMessageTo(String message, String receiveId) throws IOException {
		for (WebSocket item : clients.values()) {
			if (item.userId.equals(receiveId)) {
				item.session.getAsyncRemote().sendText(message);
			}
		}
	}

	public static synchronized int getOnlineCount() {
		return onlineCount;
	}

	public static synchronized void addOnlineCount() {
		WebSocket.onlineCount++;
	}

	public static synchronized void subOnlineCount() {
		WebSocket.onlineCount--;
	}

	public static synchronized Map<String, WebSocket> getClients() {
		return clients;
	}
}