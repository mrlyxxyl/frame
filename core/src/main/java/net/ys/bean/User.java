package net.ys.bean;

import java.io.Serializable;

/**
 * 用户表
 */
public class User implements Serializable {

    private long id;    //主键

    private String name;    //用户昵称

    private int age;    //年龄

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}