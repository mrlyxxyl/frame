package net.ys.dao;

import net.ys.bean.SysEnum;
import net.ys.mapper.SysEnumMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

@Repository
public class SystemDao {

    @Resource
    private JdbcTemplate jdbcTemplate;

    public List<SysEnum> querySysEnums() {
        String sql = "SELECT id, `name`, code, vi, vs, `status` FROM sys_enum WHERE `status` = 1";
        return jdbcTemplate.query(sql, new SysEnumMapper());
    }

    public boolean updateSysEnum(SysEnum sysEnum) {
        String sql = "UPDATE sys_enum SET `name` = ?, vi = ?, vs = ? WHERE `eid` = ?";
        return jdbcTemplate.update(sql, sysEnum.getName(), sysEnum.getVi(), sysEnum.getVs(), sysEnum.getId()) > 0;
    }

    public SysEnum addSysEnum(final SysEnum sysEnum) {
        final String sql = "INSERT INTO sys_enum ( `name`, `code`, `vi`, `vs` ) VALUES (?,?,?,?)";

        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
                PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, sysEnum.getName());
                ps.setInt(2, sysEnum.getCode());
                ps.setInt(3, sysEnum.getVi());
                ps.setString(4, sysEnum.getVs());
                return ps;
            }
        }, keyHolder);
        long id = keyHolder.getKey().longValue();

        if (id > 0) {
            String selSql = "SELECT  `id`, `name`, `code`, `vi`, `vs`, `status` FROM sys_enum WHERE eid = " + id;
            List<SysEnum> sysEnums = jdbcTemplate.query(selSql, new SysEnumMapper());
            if (sysEnums.size() > 0) {
                return sysEnums.get(0);
            }
        }
        return null;
    }

}
