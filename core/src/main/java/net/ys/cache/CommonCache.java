package net.ys.cache;

import net.ys.storage.RedsExecutor;
import net.ys.storage.RedsRunner;
import net.ys.storage.RedsServer;
import org.springframework.stereotype.Repository;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.exceptions.JedisConnectionException;

/**
 * User: LiWenC
 * Date: 16-11-21
 */
@Repository
public class CommonCache {

    /**
     * 获取访问次数
     *
     * @param cacheKey
     * @return
     */
    public long getAccessCount(final String cacheKey) {
        RedsRunner<Long> rr = new RedsRunner<Long>() {
            @Override
            public Long run(Jedis jedis) throws JedisConnectionException {
                try {
                    return jedis.incr(cacheKey);//当前访问次数
                } catch (Exception e) {
                }
                return 0L;
            }
        };
        return new RedsExecutor<Long>().exe(rr, RedsServer.MASTER);
    }

    /**
     * 设置失效时间
     *
     * @param cacheKey
     * @param timeLimit 秒
     * @return
     */
    public boolean setExpire(final String cacheKey, final int timeLimit) {
        RedsRunner<Boolean> rr = new RedsRunner<Boolean>() {
            @Override
            public Boolean run(Jedis jedis) throws JedisConnectionException {
                try {
                    return jedis.expire(cacheKey, timeLimit) > 0;
                } catch (Exception e) {
                }
                return false;
            }
        };
        return new RedsExecutor<Boolean>().exe(rr, RedsServer.MASTER);
    }
}
