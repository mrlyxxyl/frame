package net.ys.controller;

import net.ys.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping(value = "web/admin")
public class AdminController {

    @Resource
    private AdminService adminService;

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String doGet() {
        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String doPost(HttpSession session, String username, String password) {
        Map<String, Object> admin = adminService.queryAdmin(username, password);
        if (admin != null) {
            session.setAttribute("admin", admin);
        }
        return "redirect:/web/main/main.do";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("admin");
        return "login";
    }

    @RequestMapping(value = "index")
    public ModelAndView statistics() {
        ModelAndView modelAndView = new ModelAndView("index");
        return modelAndView;
    }
}
