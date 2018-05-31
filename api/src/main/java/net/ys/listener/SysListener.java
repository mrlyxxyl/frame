package net.ys.listener;

import net.ys.utils.LogUtil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * User: LiWenC
 * Date: 17-7-2
 */
@WebListener
public class SysListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        LogUtil.print("--- contextInitialized  ---");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        LogUtil.print("--- contextDestroyed  ---");
    }
}
