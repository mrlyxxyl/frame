package net.ys.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Repository
public class AdminDao {

    @Resource
    private JdbcTemplate jdbcTemplate;

    public Map<String, Object> queryAdmin(String username, String pass) {
        String sql = "SELECT * FROM admin WHERE username = ? AND password =?";
        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, username, pass);
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }
}
