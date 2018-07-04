package net.ys.cache;

import net.sf.json.JSONObject;
import net.ys.bean.User;
import net.ys.constant.CacheKey;
import net.ys.storage.RedsExecutor;
import net.ys.storage.RedsRunner;
import net.ys.storage.RedsServer;
import org.springframework.stereotype.Repository;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Pipeline;
import redis.clients.jedis.exceptions.JedisConnectionException;

/**
 * User: LiWenC
 * Date: 16-11-21
 */
@Repository
public class UserCache {

    public boolean saveUsers(final User... users) {
        RedsRunner<Boolean> rr = new RedsRunner<Boolean>() {
            @Override
            public Boolean run(Jedis jedis) throws JedisConnectionException {
                try {
                    if (users.length > 0) {
                        Pipeline pipeline = jedis.pipelined();
                        for (User user : users) {
                            pipeline.set(CacheKey.USER_KEY + user.getId(), JSONObject.fromObject(user).toString());
                        }
                        pipeline.sync();
                        return true;
                    }
                } catch (Exception e) {
                }
                return false;
            }
        };
        return new RedsExecutor<Boolean>().exe(rr, RedsServer.MASTER);
    }
}
