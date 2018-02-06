package net.ys.util;

import java.io.IOException;
import java.sql.SQLException;

/**
 * User: NMY
 * Date: 17-6-12
 */
public class BeanMain {

    public static final String URL = "jdbc:mysql://192.168.1.125:3306/project";

    public static void main(String[] args) throws IOException, SQLException {
        GenerateBean.generateBean("project");
        GenerateMapper.generateBean("project");
        GenerateBeanRespMapper.generateBean("project");
        GenerateSelectAll.generateFields("project", "user");
    }
}
