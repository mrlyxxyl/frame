package net.ys.mapper;

import net.ys.bean.SysEnum;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SysEnumMapper implements RowMapper<SysEnum> {
    @Override
    public SysEnum mapRow(ResultSet resultSet, int i) throws SQLException {
        SysEnum sysEnum = new SysEnum();
        sysEnum.setId(resultSet.getInt("id"));
        sysEnum.setName(resultSet.getString("name"));
        sysEnum.setCode(resultSet.getInt("code"));
        sysEnum.setVi(resultSet.getInt("vi"));
        sysEnum.setVs(resultSet.getString("vs"));
        sysEnum.setStatus(resultSet.getInt("status"));
        return sysEnum;
    }
}