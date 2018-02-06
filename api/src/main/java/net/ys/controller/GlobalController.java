package net.ys.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.ys.constant.GenResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * 处理全局请求
 */
@RestController
@RequestMapping(value = "global")
@Api(value = "global-api", description = "全局接口")
public class GlobalController {

    /**
     * HTTP 400
     */
    @RequestMapping(value = "http_400", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    @ApiOperation(httpMethod = "POST", response = Map.class, responseContainer = "Map", value = "内部错误重定向")
    public Map<String, Object> http400() {
        return GenResult.PARAMS_ERROR.genResult();
    }
}
