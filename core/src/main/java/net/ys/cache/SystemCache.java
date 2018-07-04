package net.ys.cache;

import net.sf.json.JSONObject;
import net.ys.bean.SysEnum;
import net.ys.constant.CacheKey;
import net.ys.storage.RedsExecutor;
import net.ys.storage.RedsRunner;
import net.ys.storage.RedsServer;
import org.springframework.stereotype.Repository;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Pipeline;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.util.List;

/**
 * User: LiWenC
 * Date: 16-11-21
 */
@Repository
public class SystemCache {

    public boolean addSysEnums(final List<SysEnum> enums) {
        RedsRunner<Boolean> rr = new RedsRunner<Boolean>() {
            @Override
            public Boolean run(Jedis jedis) throws JedisConnectionException {
                try {
                    Pipeline pipeline = jedis.pipelined();
                    for (SysEnum sysEnum : enums) {
                        pipeline.zadd(CacheKey.SYS_ENUM_KEY, sysEnum.getCode(), JSONObject.fromObject(sysEnum).toString());
                    }
                    pipeline.sync();
                    return true;
                } catch (Exception e) {
                }
                return false;
            }
        };
        return new RedsExecutor<Boolean>().exe(rr, RedsServer.MASTER);
    }

}
