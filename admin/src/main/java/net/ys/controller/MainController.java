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

    @RequestMapping(value = "default")
    public ModelAndView sysDefault() {
        ModelAndView modelAndView = new ModelAndView("default");
        return modelAndView;
    }

    @RequestMapping(value = "imgTable")
    public ModelAndView imgTable() {
        ModelAndView modelAndView = new ModelAndView("imgTable");
        return modelAndView;
    }

    @RequestMapping(value = "imgList")
    public ModelAndView imgList() {
        ModelAndView modelAndView = new ModelAndView("imgList");
        return modelAndView;
    }

    @RequestMapping(value = "imgListOne")
    public ModelAndView imgListOne() {
        ModelAndView modelAndView = new ModelAndView("imgListOne");
        return modelAndView;
    }

    @RequestMapping(value = "tools")
    public ModelAndView tools() {
        ModelAndView modelAndView = new ModelAndView("tools");
        return modelAndView;
    }

    @RequestMapping(value = "computer")
    public ModelAndView computer() {
        ModelAndView modelAndView = new ModelAndView("computer");
        return modelAndView;
    }

    @RequestMapping(value = "tab")
    public ModelAndView tab() {
        ModelAndView modelAndView = new ModelAndView("tab");
        return modelAndView;
    }

    @RequestMapping(value = "right")
    public ModelAndView right() {
        ModelAndView modelAndView = new ModelAndView("right");
        return modelAndView;
    }

    @RequestMapping(value = "form")
    public ModelAndView form() {
        ModelAndView modelAndView = new ModelAndView("form");
        return modelAndView;
    }

    @RequestMapping(value = "fileList")
    public ModelAndView fileList() {
        ModelAndView modelAndView = new ModelAndView("fileList");
        return modelAndView;
    }

    @RequestMapping(value = "error")
    public ModelAndView error() {
        ModelAndView modelAndView = new ModelAndView("error");
        return modelAndView;
    }
}
