package net.ys.constant;

/**
 * User: NMY
 * Date: 17-5-17
 */
public interface X {

    interface TIME {
        //对应秒
        int DAY_SECOND = 24 * 60 * 60;
        int HOUR_SECOND = 60 * 60;
        int MINUTE = 60;
        //对应毫秒
        int DAY_MILLISECOND = 24 * 60 * 60 * 1000;
        int HOUR_MILLISECOND = 60 * 60 * 1000;
        int MINUTE_MILLISECOND = 60 * 1000;
        int SECOND_MILLISECOND = 1000;
    }

    /**
     * 极光推送配置
     */
    interface J_PUSH {
        String APP_KEY = "f28070a35ea65b3086839a96";
        String MASTER_SECRET = "e433a430ebe0229e5beb40d5";
    }

    /**
     * 编码
     */
    interface ENCODING {
        String U = "UTF-8";
        String I = "ISO8859-1";
    }
}
