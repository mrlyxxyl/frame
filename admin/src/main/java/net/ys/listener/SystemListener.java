package net.ys.listener;

import net.ys.utils.LogUtil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * User: NMY
 * Date: 16-8-29
 */
@WebListener
public class SystemListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        LogUtil.print("-------  system destroyed  -------");
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        LogUtil.print("-------  system init  -------");
    }
}