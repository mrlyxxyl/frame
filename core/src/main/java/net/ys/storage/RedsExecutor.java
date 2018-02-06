package net.ys.storage;

import org.apache.log4j.Logger;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.exceptions.JedisException;

public class RedsExecutor<T> {

    static Logger log = Logger.getLogger(RedsExecutor.class);

    public RedsExecutor() {
    }

    public T exe(RedsRunner<T> redsRunner, RedsServer redsServer) {
        T rst = null;
        Jedis j = null;
        try {
            j = RedsDBIns.INSTANCE.getReds(redsServer);
            if (j != null) {
                rst = redsRunner.run(j);
                RedsDBIns.INSTANCE.release(redsServer, j);
            } else {
                log.warn("Stop process as Reds Connect Failed for " + redsServer.getHost() + ":" + redsServer.getPort() + ",timeout=" + redsServer.getTimeout());
            }
        } catch (JedisException e) {
            RedsDBIns.INSTANCE.releaseBrokenReds(redsServer, j);
            log.error(e, e);
        } catch (Exception e) {
            RedsDBIns.INSTANCE.release(redsServer, j);
            log.error(e, e);
        }
        return rst;
    }
}
