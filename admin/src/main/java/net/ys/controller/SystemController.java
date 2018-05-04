package net.ys.controller;

import net.ys.bean.SysEnum;
import net.ys.constant.GenResult;
import net.ys.service.SystemService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "web/sys")
public class SystemController {

    @Resource
    private SystemService systemService;

    //--------------------------系统配置-----------------------------------
    @RequestMapping(value = "sysEnum/list")
    public ModelAndView sysEnumList(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "15") int pageSize) {
        ModelAndView modelAndView = new ModelAndView("sysEnum/list");
        if (page < 1) {
            page = 1;
        }
        long count = systemService.querySysEnumCount();

        long t = count / pageSize;
        int k = count % pageSize == 0 ? 0 : 1;
        int totalPage = (int) (t + k);

        if (page > totalPage && count > 0) {
            page = totalPage;
        }

        List<SysEnum> sysEnums;
        if ((page - 1) * pageSize < count) {
            sysEnums = systemService.querySysEnums(page, pageSize);
        } else {
            sysEnums = new ArrayList<SysEnum>();
        }

        modelAndView.addObject("count", count);
        modelAndView.addObject("currPage", page);
        modelAndView.addObject("totalPage", totalPage);
        modelAndView.addObject("sysEnums", sysEnums);
        return modelAndView;
    }

    @RequestMapping(value = "sysEnum/edit")
    public ModelAndView sysEnumEdit(@RequestParam(defaultValue = "0") int code) {
        ModelAndView modelAndView = new ModelAndView("sysEnum/edit");
        SysEnum sysEnum;
        if (code == 0) {//新增
            sysEnum = new SysEnum();
        } else {
            sysEnum = systemService.querySysEnum(code);
        }
        modelAndView.addObject("sysEnum", sysEnum);
        return modelAndView;
    }

    @RequestMapping(value = "sysEnum/save")
    @ResponseBody
    public Map<String, Object> sysEnumSave(SysEnum sysEnum) {
        boolean flag = systemService.updateSysEnum(sysEnum);
        if (!flag) {
            return GenResult.FAILED.genResult();
        }
        return GenResult.SUCCESS.genResult();
    }

    @RequestMapping(value = "sysEnum/add")
    @ResponseBody
    public Map<String, Object> sysEnumAdd(SysEnum sysEnum) {
        sysEnum = systemService.addSysEnum(sysEnum);
        if (sysEnum == null) {
            return GenResult.FAILED.genResult();
        }
        return GenResult.SUCCESS.genResult(sysEnum);
    }
}
