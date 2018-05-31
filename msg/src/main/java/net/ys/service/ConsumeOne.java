package net.ys.service;

import net.ys.bean.User;
import net.ys.utils.LogUtil;
import org.msgpack.MessagePack;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class ConsumeOne implements MessageListener {

    private MessagePack msgPack;

    @PostConstruct
    public void init() {
        msgPack = new MessagePack();
    }

    @Override
    public void onMessage(Message message) {
        try {
            byte[] data = message.getBody();
            User user = msgPack.read(data, User.class);
            LogUtil.print(user);
        } catch (Exception e) {
            LogUtil.error(e);
        }
    }
}