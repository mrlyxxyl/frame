package net.ys.response;

import io.swagger.annotations.ApiModelProperty;

public class SysEnumResponse {

    @ApiModelProperty(value = "主键")
    private int id;

    @ApiModelProperty(value = "枚举名称")
    private String name;

    @ApiModelProperty(value = "枚举代码")
    private int code;

    @ApiModelProperty(value = "int枚举值")
    private int vi;

    @ApiModelProperty(value = "字符串枚举值")
    private String vs;

    @ApiModelProperty(value = "记录状态 0无效 1有效")
    private int status;

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