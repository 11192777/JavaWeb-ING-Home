package pers.qingyu.home.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import pers.qingyu.home.bean.UserInformationBean;
import pers.qingyu.home.util.StringUtil;

/**
 * 服务器启动监听器
 * 
 * @author IsQingyu
 *
 */
public class ServerStartupListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application = sce.getServletContext();
		String path = application.getContextPath();
		application.setAttribute("APP_PATH", path);

		String appPath = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		UserInformationBean.DEFAULT_HEADING_IMG = StringUtil.cutOffString(appPath, "WEB-INF") + "images/headImg/";
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

}
