package net.ys.dao;

import net.ys.bean.User;
import net.ys.mapper.UserMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository
public class UserDao {

    @Resource
    private JdbcTemplate jdbcTemplate;

    public List<User> queryUsers(int page, int pageSize) {
        String sql = "SELECT id, name, age FROM user LIMIT ?,?";
        return jdbcTemplate.query(sql, new UserMapper(), (page - 1) * pageSize, pageSize);
    }

    public long queryUserCount() {
        String sql = "SELECT COUNT(user_id) FROM `user`";
        return jdbcTemplate.queryForObject(sql, Long.class);
    }
}
