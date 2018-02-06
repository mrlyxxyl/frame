package net.ys.constant;

/**
 * 上传附件文件类型
 * User: NMY
 * Date: 17-6-10
 */
public enum FileType {
    HEAD_IMG(1000, "h", "用户头像"),
    LIVE_COVER(1001, "c", "直播封面"),
    GIFT_ICON(1002, "g", "礼物图标"),
    USER_DYNAMIC(1003, "d", "用户动态"),
    USER_AUTH(1004, "a", "用户认证"),
    REPORT_SCREEN_SHOT(1005, "r", "用户举报截屏"),
    SYSTEM(1006, "s", "系统图标"),
    SYS_ADS(1007, "ad", "广告"),;

    public int type;
    public String path;
    public String desc;

    private FileType(int type, String path, String desc) {
        this.type = type;
        this.path = path;
        this.desc = desc;
    }

    public static FileType genBean(int type) {
        FileType[] fileTypes = FileType.values();
        for (FileType fileType : fileTypes) {
            if (fileType.type == type) {
                return fileType;
            }
        }
        return null;
    }
}
