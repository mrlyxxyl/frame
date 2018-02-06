package net.ys.service;

import net.ys.bean.SysEnum;
import net.ys.cache.CommonCache;
import net.ys.constant.SysEnumCode;
import net.ys.constant.X;
import net.ys.utils.Tools;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CommonService {

    @Resource
    private CommonCache commonCache;

    @Resource
    private SystemService systemService;

    /**
     * 校验请求接口参数是否合法-防刷
     *
     * @param key    加密秘钥
     * @param time   时间戳
     * @param md5Str 加密后的字符串
     * @return
     */
    public boolean verifyIntParams(String key, String time, String md5Str) {

        if (!Tools.isNotEmpty(key, time, md5Str)) {
            return false;
        }

        String m = Tools.genMD5(key + time);
        //初步校验
        if (!m.equals(md5Str)) {
            return false;
        }
        //缓存校验
        long count = commonCache.getAccessCount(md5Str);
        if (count == 1) {
            SysEnum sysEnum = systemService.querySysEnum(SysEnumCode.INTERFACE_ACCESS_TIME_LIMIT.code);//接口访问时间控制-分钟
            int timeLimit = sysEnum.getVi() * X.TIME.MINUTE;
            commonCache.setExpire(md5Str, timeLimit);
        }
        if (count > 1) {
            return false;
        }
        return true;
    }
}
