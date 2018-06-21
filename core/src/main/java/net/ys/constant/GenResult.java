package net.ys.constant;

import net.sf.json.JSONObject;

import java.util.LinkedHashMap;
import java.util.Map;

public enum GenResult {
    SUCCESS(1000, "请求成功"),

    FAILED(1001, "请求失败"),

    REQUEST_INVALID(1002, "非法请求"),

    PARAMS_ERROR(1003, "请求参数错误"),

    REQUEST_METHOD_ERROR(1004, "请求方式错误"),

    DB_ERROR(1005, "数据库异常"),

    NOT_LOGIN(1006, "未登录"),

    NO_DATA_OR_INVALID(1007, "数据不存在或已过期，请刷新重试!"),

    UNKNOWN_ERROR(9999, "未知异常"),;

    public int msgCode;
    public String message;

    private GenResult(int msgCode, String message) {
        this.msgCode = msgCode;
        this.message = message;
    }

    public Map<String, Object> genResult() {
        Map<String, Object> map = new LinkedHashMap<String, Object>();
        map.put("code", msgCode);
        map.put("msg", message);
        return map;
    }

    public Map<String, Object> genResult(Object data) {
        Map<String, Object> map = new LinkedHashMap<String, Object>();
        map.put("code", msgCode);
        map.put("msg", message);
        map.put("data", data);
        return map;
    }

    public String toJson() {
        JSONObject object = new JSONObject();
        object.put("code", msgCode);
        object.put("msg", message);
        return object.toString();
    }
}
