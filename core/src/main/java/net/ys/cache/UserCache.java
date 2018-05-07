package net.ys.cache;

import net.ys.bean.User;
import net.ys.constant.CacheKey;
import net.ys.storage.RedsExecutor;
import net.ys.storage.RedsRunner;
import net.ys.storage.RedsServer;
import org.msgpack.MessagePack;
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

    private static final MessagePack msgPack = new MessagePack();

    public boolean saveUsers(final User... users) {
        RedsRunner<Boolean> rr = new RedsRunner<Boolean>() {
            @Override
            public Boolean run(Jedis jedis) throws JedisConnectionException {
                try {
                    if (users.length > 0) {
                        Pipeline pipeline = jedis.pipelined();
                        for (User user : users) {
                            pipeline.set(msgPack.write(CacheKey.USER_KEY + user.getId()), msgPack.write(user));
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
