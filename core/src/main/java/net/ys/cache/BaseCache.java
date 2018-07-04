package net.ys.cache;

import net.sf.json.JSONObject;
import net.ys.storage.RedsExecutor;
import net.ys.storage.RedsRunner;
import net.ys.storage.RedsServer;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.msgpack.MessagePack;
import org.springframework.stereotype.Repository;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * User: LiWenC
 * Date: 17-9-21
 */
@Repository
public class BaseCache {


    MessagePack messagePack = new MessagePack();

    /**
     * k-v
     *
     * @param key
     * @param obj
     * @return
     */
    public boolean save(final String key, final Object obj) {
        RedsRunner<Boolean> rr = new RedsRunner<Boolean>() {
            @Override
            public Boolean run(Jedis jedis) throws JedisConnectionException {
                try {
                    String value;
                    if (obj instanceof String) {
                        value = String.valueOf(obj);
                    } else {
                        value = JSONObject.fromObject(obj).toString();
                    }
                    return "OK".equals(jedis.set(key, value));
                } catch (Exception e) {
                }
                return false;
            }
        };
        return new RedsExecutor<Boolean>().exe(rr, RedsServer.MASTER);
    }

    /**
     * k-v
     *
     * @param key
     * @param clazz
     * @param <T>
     * @return
     */
    public <T> T get(final String key, final Class<T> clazz) {
        RedsRunner<T> rr = new RedsRunner<T>() {
            @Override
            public T run(Jedis jedis) throws JedisConnectionException {
                try {
                    String val = jedis.get(key);
                    if (StringUtils.isNotBlank(val)) {
                        if (clazz == String.class) {
                            return (T) val;
                        }
                        return (T) JSONObject.toBean(JSONObject.fromObject(val), clazz);
                    }
                } catch (Exception e) {
                }
                return null;
            }
        };
        return new RedsExecutor<T>().exe(rr, RedsServer.MASTER);
    }

    /**
     * k-v
     *
     * @param key
     * @return
     */
    public boolean delete(final String key) {
        RedsRunner<Boolean> rr = new RedsRunner<Boolean>() {
            @Override
            public Boolean run(Jedis jedis) throws JedisConnectionException {
                try {
                    return jedis.del(key) > 0;
                } catch (Exception e) {
                }
                return false;
            }
        };
        return new RedsExecutor<Boolean>().exe(rr, RedsServer.MASTER);
    }

    /**
     * sorted set
     *
     * @param key
     * @param obj
     * @return
     */
    public boolean add(final String key, final double score, final Object obj) {
        RedsRunner<Boolean> rr = new RedsRunner<Boolean>() {
            @Override
            public Boolean run(Jedis jedis) throws JedisConnectionException {
                try {
                    String value;
                    if (obj instanceof String) {
                        value = String.valueOf(obj);
                    } else {
                        value = JSONObject.fromObject(obj).toString();
                    }
                    return jedis.zadd(key, score, value) > 0;
                } catch (Exception e) {
                }
                return false;
            }
        };
        return new RedsExecutor<Boolean>().exe(rr, RedsServer.MASTER);
    }

    /**
     * sorted set
     *
     * @param key
     * @param obj
     * @return
     */
    public boolean save(final String key, final double score, final Object obj) {
        RedsRunner<Boolean> rr = new RedsRunner<Boolean>() {
            @Override
            public Boolean run(Jedis jedis) throws JedisConnectionException {
                try {
                    jedis.zremrangeByScore(key, score, score);

                    String value;
                    if (obj instanceof String) {
                        value = String.valueOf(obj);
                    } else {
                        value = JSONObject.fromObject(obj).toString();
                    }
                    return jedis.zadd(key, score, value) > 0;
                } catch (Exception e) {
                }
                return false;
            }
        };
        return new RedsExecutor<Boolean>().exe(rr, RedsServer.MASTER);
    }

    /**
     * sorted set
     *
     * @param key
     * @return
     */
    public <T> T get(final String key, final double score, final Class<T> clazz) {
        RedsRunner<T> rr = new RedsRunner<T>() {
            @Override
            public T run(Jedis jedis) throws JedisConnectionException {
                try {
                    Set<String> data = jedis.zrangeByScore(key, score, score);
                    if (data.size() > 0) {
                        for (String val : data) {
                            if (clazz == String.class) {
                                return (T) val;
                            }
                            return (T) JSONObject.toBean(JSONObject.fromObject(val), clazz);
                        }
                    }
                } catch (Exception e) {
                }
                return null;
            }
        };
        return new RedsExecutor<T>().exe(rr, RedsServer.MASTER);
    }

    /**
     * sorted set
     *
     * @param key
     * @return
     */
    public <T> List<T> getsAsc(final String key, final double min, final double max, final int offset, final int count, final Class<T> clazz) {
        RedsRunner<List<T>> rr = new RedsRunner<List<T>>() {
            @Override
            public List<T> run(Jedis jedis) throws JedisConnectionException {
                List<T> list = new ArrayList<T>();
                try {
                    Set<String> data = jedis.zrangeByScore(key, min, max, offset, count);
                    if (CollectionUtils.isNotEmpty(data)) {
                        for (String val : data) {
                            if (clazz == String.class) {
                                list.add((T) val);
                            } else {
                                list.add((T) JSONObject.toBean(JSONObject.fromObject(val), clazz));
                            }
                        }
                    }
                } catch (Exception e) {
                }
                return list;
            }
        };
        return new RedsExecutor<List<T>>().exe(rr, RedsServer.MASTER);
    }

    /**
     * sorted set
     *
     * @param key
     * @return
     */
    public <T> List<T> getsDesc(final String key, final double min, final double max, final int offset, final int count, final Class<T> clazz) {
        RedsRunner<List<T>> rr = new RedsRunner<List<T>>() {
            @Override
            public List<T> run(Jedis jedis) throws JedisConnectionException {
                List<T> list = new ArrayList<T>();
                try {
                    Set<String> data = jedis.zrevrangeByScore(key, max, min, offset, count);
                    if (CollectionUtils.isNotEmpty(data)) {
                        for (String val : data) {
                            if (clazz == String.class) {
                                list.add((T) val);
                            } else {
                                list.add((T) JSONObject.toBean(JSONObject.fromObject(val), clazz));
                            }
                        }
                    }
                } catch (Exception e) {
                }
                return list;
            }
        };
        return new RedsExecutor<List<T>>().exe(rr, RedsServer.MASTER);
    }

    /**
     * sorted set
     *
     * @param key
     * @return
     */
    public long getKeyCount(final String key) {
        RedsRunner<Long> rr = new RedsRunner<Long>() {
            @Override
            public Long run(Jedis jedis) throws JedisConnectionException {
                try {
                    return jedis.zcard(key);
                } catch (Exception e) {
                }
                return 0L;
            }
        };
        return new RedsExecutor<Long>().exe(rr, RedsServer.MASTER);
    }

    /**
     * sorted set
     *
     * @param key
     * @param score
     * @return
     */
    public boolean delete(final String key, final long score) {
        RedsRunner<Boolean> rr = new RedsRunner<Boolean>() {
            @Override
            public Boolean run(Jedis jedis) throws JedisConnectionException {
                try {
                    return jedis.zremrangeByScore(key, score, score) > 0;
                } catch (Exception e) {
                }
                return false;
            }
        };
        return new RedsExecutor<Boolean>().exe(rr, RedsServer.MASTER);
    }
}
