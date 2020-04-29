import java.io.IOException;

import org.junit.Test;
import org.wangtingzheng.remotehome.Api.PhotoApi;
import org.wangtingzheng.remotehome.Api.ScanApi;
import org.wangtingzheng.remotehome.Api.tools.PhotoClient;
import org.wangtingzheng.remotehome.Api.tools.QrcodeCheck;

import pers.qingyu.home.util.PropertityUtil;

public class test {

	public static void main(String[] args) throws IOException {

		String productKey = PropertityUtil.getProperties().getProperty("server.productKey");
		String deviceName = PropertityUtil.getProperties().getProperty("server.deviceName");
		String deviceSecret = PropertityUtil.getProperties().getProperty("server.deviceSecret");

		System.out.println(productKey);
		System.out.println(deviceName);
		System.out.println(deviceSecret);

		ScanApi api = new ScanApi(productKey, deviceName, deviceSecret, new QrcodeCheck() {

			@Override
			public boolean shouldOpenDoor(String payload) {
				if (payload.equals("http://weixin.qq.com/r/VjssNIPE1N6rrcdX925E")) {
					System.out.println("success");
					return true;
				}
				return false;
			}
			
			

		});

		api.startServer();

	}

	@Test
	public void testP() throws IOException {

		String productKey = PropertityUtil.getProperties().getProperty("nodes.productKey");
		String deviceName = PropertityUtil.getProperties().getProperty("nodes.deviceName");
		String deviceSecret = PropertityUtil.getProperties().getProperty("nodes.deviceSecret");
		String accessKey = PropertityUtil.getProperties().getProperty("access.accessKey");
		String accessSecret = PropertityUtil.getProperties().getProperty("access.accessSecret");

		PhotoClient photoClient = new PhotoClient(productKey, deviceName, deviceSecret, accessKey, accessSecret);
		PhotoApi photoApi = new PhotoApi();

		System.out.println("the size is " + photoApi.getUrl(photoClient).get(0));
	}

}
