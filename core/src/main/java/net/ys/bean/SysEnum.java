package net.ys.bean;

import java.io.Serializable;

/**
 * 系统枚举表
 */
public class SysEnum implements Serializable {

    private int id;    //主键

    private String name;    //枚举名称

    private int code;    //枚举代码

    private int vi;    //int枚举值

    private String vs;    //字符串枚举值

    private int status;    //记录状态 0无效 1有效

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getCode() {
        return this.code;
    }

    public void setVi(int vi) {
        this.vi = vi;
    }

    public int getVi() {
        return this.vi;
    }

    public void setVs(String vs) {
        this.vs = vs;
    }

    public String getVs() {
        return this.vs;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return this.status;
    }

}