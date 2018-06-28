package net.ys.constant;

/**
 * Global Config
 * User: NMY
 * Date: 17-5-17
 */
public interface Glc {

    interface Time {
        int SECOND_DAY = 24 * 60 * 60;
        int SECOND_HOUR = 60 * 60;
        int SECOND_MINUTE = 60;
        int MILLISECOND_DAY = 24 * 60 * 60 * 1000;
        int MILLISECOND_HOUR = 60 * 60 * 1000;
        int MILLISECOND_MINUTE = 60 * 1000;
        int MILLISECOND_SECOND = 1000;
    }

    /**
     * 极光推送配置
     */
    interface JgPush {
        String APP_KEY = "f28070a35ea65b3086839a96";
        String MASTER_SECRET = "e433a430ebe0229e5beb40d5";
    }

    /**
     * 编码
     */
    interface Code {
        String U = "UTF-8";
        String I = "ISO8859-1";
    }
}
