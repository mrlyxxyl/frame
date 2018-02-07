package net.ys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "main")
public class MainController {

    @RequestMapping(value = "main")
    public ModelAndView main() {
        ModelAndView modelAndView = new ModelAndView("main");
        return modelAndView;
    }

    @RequestMapping(value = "top")
    public ModelAndView top() {
        ModelAndView modelAndView = new ModelAndView("top");
        return modelAndView;
    }

    @RequestMapping(value = "left")
    public ModelAndView left() {
        ModelAndView modelAndView = new ModelAndView("left");
        return modelAndView;
    }

    @RequestMapping(value = "index")
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("index");
        return modelAndView;
    }
}
