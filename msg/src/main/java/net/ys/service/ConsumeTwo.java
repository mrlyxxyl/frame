package net.ys.service;

import net.ys.utils.LogUtil;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.stereotype.Component;

@Component
public class ConsumeTwo implements MessageListener {

    @Override
    public void onMessage(Message message) {
        try {
            LogUtil.print(new String(message.getBody()));
        } catch (Exception e) {
            LogUtil.error(e);
        }
    }
}