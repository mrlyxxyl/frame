package net.ys.constant;

/**
 * 系统枚举code
 * User: LiWenC
 * Date: 16-9-6
 */
public enum SysEnumCode {
    AWARD_REG_INV_GOLD(1000, "普通注册邀请金币奖励"),;

    public int code;
    public String desc;

    private SysEnumCode(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }
}
