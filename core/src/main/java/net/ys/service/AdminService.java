package net.ys.service;

import net.ys.dao.AdminDao;
import net.ys.utils.Tools;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service
public class AdminService {
    @Resource
    private AdminDao adminDao;

    public Map<String, Object> queryAdmin(String username, String password) {
        String pass = Tools.genMD5(password);
        return adminDao.queryAdmin(username, pass);
    }
}
