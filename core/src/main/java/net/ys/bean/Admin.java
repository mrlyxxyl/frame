package net.ys.bean;

import org.msgpack.annotation.Message;

import java.io.Serializable;

@Message
public class Admin implements Serializable {

    private int id;    //

    private String username;    //用户名

    private String password;    //密码

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return this.username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return this.password;
    }
}