package net.ys.controller;

import net.ys.bean.User;
import net.ys.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "web/user")
public class UserController {

    @Resource
    private UserService userService;

    //--------------------------用户管理-----------------------------------
    @RequestMapping(value = "list")
    public ModelAndView list(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "15") int pageSize) {
        ModelAndView modelAndView = new ModelAndView("user/list");
        if (page < 1) {
            page = 1;
        }

        long count = userService.queryUserCount();

        long t = count / pageSize;
        int k = count % pageSize == 0 ? 0 : 1;
        int totalPage = (int) (t + k);

        if (page > totalPage && count > 0) {
            page = totalPage;
        }

        List<User> users;
        if ((page - 1) * pageSize < count) {
            users = userService.queryUsers(page, pageSize);
        } else {
            users = new ArrayList<User>();
        }
        modelAndView.addObject("count", count);
        modelAndView.addObject("currPage", page);
        modelAndView.addObject("totalPage", totalPage);
        modelAndView.addObject("users", users);
        return modelAndView;
    }
}
