package net.ys.service;

import net.ys.bean.User;
import net.ys.cache.BaseCache;
import net.ys.cache.UserCache;
import net.ys.dao.UserDao;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {

    private static Logger logger = Logger.getLogger(UserService.class);

    @Resource
    private UserDao userDao;

    @Resource
    private UserCache userCache;

    @Resource
    private BaseCache baseCache;

    public List<User> queryUsers(int page, int pageSize) {
        return userDao.queryUsers(page, pageSize);
    }

    public long queryUserCount() {
        return userDao.queryUserCount();
    }
}
