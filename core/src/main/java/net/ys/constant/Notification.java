package net.ys.constant;

/**
 * 通知类型
 * User: LiWenC
 * Date: 17-5-27
 */
public enum Notification {

    LOGIN_CONFLICT("您的账号已在其他设备登录", "{\"type\":2000,\"user_id\":%s}"),
    CERT_GRANT("您申请的证书已经被授权", "{\"type\":2001,\"cert_id\":%s,\"grant_type\":%s,\"grant_security\":%s}"),
    UPDATE_CERT_GRANT("授权您的证书已经被修改", "{\"type\":2002,\"cert_id\":%s,\"grant_type\":%s,\"grant_security\":%s}"),
    REVOKE_CERT_GRANT("授权您的证书已经被撤销", "{\"type\":2003,\"cert_id\":%s}"),
    DEL_CERT_GRANT("授权您的证书已经被删除", "{\"type\":2004,\"cert_id\":%s}"),;

    public String notificationTitle;//通知内容标题
    public String extraParam;//扩展字段

    private Notification(String notificationTitle, String extraParam) {
        this.notificationTitle = notificationTitle;
        this.extraParam = extraParam;
    }
}
