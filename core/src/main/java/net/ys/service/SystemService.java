package net.ys.service;

import net.ys.bean.SysEnum;
import net.ys.cache.BaseCache;
import net.ys.cache.SystemCache;
import net.ys.constant.CacheKey;
import net.ys.dao.SystemDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SystemService {

    @Resource
    private SystemDao systemDao;

    @Resource
    private SystemCache systemCache;

    @Resource
    private BaseCache baseCache;

    /**
     * 获取系统配置
     *
     * @return
     */
    public SysEnum querySysEnum(int code) {
        SysEnum sysEnum = baseCache.get(CacheKey.SYS_ENUM_KEY, code, SysEnum.class);
        if (sysEnum == null) {
            long count = baseCache.getKeyCount(CacheKey.SYS_ENUM_KEY);
            if (count == 0) {
                List<SysEnum> enums = systemDao.querySysEnums();
                if (enums.size() > 0) {
                    systemCache.addSysEnums(enums);
                    sysEnum = baseCache.get(CacheKey.SYS_ENUM_KEY, code, SysEnum.class);
                }
            }
        }
        return sysEnum;
    }

    /**
     * 获取系统配置列表
     *
     * @param page
     * @param pageSize
     * @return
     */
    public List<SysEnum> querySysEnums(int page, int pageSize) {
        return baseCache.getsAsc(CacheKey.SYS_ENUM_KEY, 0, Integer.MAX_VALUE, (page - 1) * pageSize, pageSize, SysEnum.class);
    }

    /**
     * 获取系统配置个数
     *
     * @return
     */
    public long querySysEnumCount() {
        long count = baseCache.getKeyCount(CacheKey.SYS_ENUM_KEY);
        if (count == 0) {
            List<SysEnum> enums = systemDao.querySysEnums();
            if (enums.size() > 0) {
                systemCache.addSysEnums(enums);
                count = enums.size();
            }
        }
        return count;
    }

    /**
     * 修改系统配置
     *
     * @param sysEnum
     * @return
     */
    public boolean updateSysEnum(SysEnum sysEnum) {
        boolean flag = systemDao.updateSysEnum(sysEnum);
        if (flag) {
            baseCache.save(CacheKey.SYS_ENUM_KEY, sysEnum.getCode(), sysEnum);
        }
        return flag;
    }

    /**
     * 新增系统配置
     *
     * @param sysEnum
     * @return
     */
    public SysEnum addSysEnum(SysEnum sysEnum) {
        int currCode = querySysEnumCurrCode();
        sysEnum.setCode(currCode + 1);
        sysEnum = systemDao.addSysEnum(sysEnum);
        if (sysEnum != null) {
            baseCache.add(CacheKey.SYS_ENUM_KEY, sysEnum.getCode(), sysEnum);
        }
        return sysEnum;
    }

    public int querySysEnumCurrCode() {
        List<SysEnum> list = baseCache.getsDesc(CacheKey.SYS_ENUM_KEY, 0, Integer.MAX_VALUE, 0, 1, SysEnum.class);
        if (list.size() > 0) {
            return list.get(0).getCode();
        }
        return -1;
    }

}
