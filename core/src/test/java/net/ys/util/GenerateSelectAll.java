package net.ys.util;

import java.io.IOException;
import java.sql.*;

/**
 * 根据mysql数据库直接生成select *对应的字段列表
 * User: LiWenC
 * Date: 17-5-10
 */
public class GenerateSelectAll {
    static Connection connection = null;
    static Statement statement = null;
    static ResultSet rs = null;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(BeanMain.URL, "root", "root");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void generateFields(String dbName, String tableName) throws SQLException, IOException {
        String sql = "SELECT COLUMN_NAME FROM information_schema.`COLUMNS` WHERE TABLE_NAME = '%s' AND TABLE_SCHEMA='%s'";
        String columnName;
        statement = connection.createStatement();
        rs = statement.executeQuery(String.format(sql, tableName, dbName));
        StringBuffer sb = new StringBuffer("SELECT ");
        while (rs.next()) {
            columnName = rs.getString("COLUMN_NAME").toLowerCase();
            sb.append("`" + columnName + "`, ");
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.deleteCharAt(sb.length() - 1);
        sb.append(" FROM " + tableName);
        System.out.println(sb.toString());
    }
}
