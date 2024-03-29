package net.ys.controller;

import io.swagger.annotations.Api;
import net.ys.bean.User;
import net.ys.constant.GenResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import springfox.documentation.annotations.ApiIgnore;

import java.util.*;

@Controller
@RequestMapping(value = "common", produces = {"application/json;charset=utf-8"})
@Api(value = "common", description = "公共接口")
public class CommonController {

    @ApiIgnore
    @RequestMapping(value = "result/code", method = RequestMethod.GET)
    public ModelAndView resultCode() {
        ModelAndView mv = new ModelAndView("result_code");
        GenResult[] results = GenResult.values();
        mv.addObject("results", results);
        return mv;
    }

    @ApiIgnore
    @RequestMapping(value = "free_show", method = RequestMethod.GET)
    public ModelAndView freeShow() {
        ModelAndView mv = new ModelAndView("show");
        mv.addObject("title", "freemarker_title");
        mv.addObject("content", "freemarker_content");

        mv.addObject("time", new Date());
        mv.addObject("number", 44444.44446f);
        mv.addObject("td", 0);

        Map<String, Object> map = new HashMap<String, Object>(2);
        map.put("name", "name");
        map.put("age", 25);
        mv.addObject("map", map);

        List<String> list = Arrays.asList("a", "b", "c");
        mv.addObject("list", list);

        mv.addObject("answer", 0.33);

        mv.addObject("bool", true);

        int[] array = {1, 2, 3, 4, 5, 6};

        mv.addObject("array", array);

        Map<String, Object> root = new HashMap<String, Object>(1);

        User user = new User();
        user.setId(1);
        user.setName("jack");
        user.setAge(26);

        root.put("user", user);

        mv.addObject("root", root);
        mv.addObject("sex", "nan");
        mv.addObject("address", "address");
        mv.addObject("age", 66);
        return mv;
    }
}
