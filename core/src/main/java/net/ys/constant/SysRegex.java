package net.ys.constant;

/**
 * 系统正则
 * User: LiWenC
 * Date: 17-6-20
 */
public enum SysRegex {
    INVITATION_CODE("[0-9a-z]{8}", "注册邀请码"),
    FANS_BADGE("[a-zA-Z\u4e00-\u9fa5]{2,4}", "粉丝徽章"),
    NICK_NAME("[\\w\u4e00-\u9fa5]{3,6}", "用户昵称"),
    PASSWORD("[0-9a-zA-Z]{6,12}", "密码"),
    PHONE_NUMBER("^((13[0-9])|(15[^4])|(18[0-9])|(17[0-8])|(147,145))\\d{8}$", "手机号码"),
    COMMA_LIST("(\\d+,)*\\d+", "逗号隔开的数字字符串"),;

    public String regex;
    public String desc;

    private SysRegex(String regex, String desc) {
        this.regex = regex;
        this.desc = desc;
    }
}
