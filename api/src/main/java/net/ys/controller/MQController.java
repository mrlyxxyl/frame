package net.ys.controller;

import net.ys.bean.User;
import net.ys.constant.GenResult;
import net.ys.constant.MsgKey;
import net.ys.service.MsgProducer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping(value = "mq", produces = {"application/json;charset=utf-8"})
public class MQController {

    @Resource
    private MsgProducer msgProducer;

    @RequestMapping(value = "test_one", headers = "Accept=application/json")
    @ResponseBody
    public Map<String, Object> testOne() throws IOException {
        User user = new User();
        user.setId(1);
        user.setName("中国");
        user.setAge(12);
        msgProducer.sendObjMsg(MsgKey.QUEUE_ONE_KEY, user);
        return GenResult.SUCCESS.genResult();
    }

    @RequestMapping(value = "test_two", headers = "Accept=application/json")
    @ResponseBody
    public Map<String, Object> testTwo() {
        msgProducer.sendStrMsg(MsgKey.QUEUE_TWO_KEY, "queue_two_value");
        return GenResult.SUCCESS.genResult();
    }
}
