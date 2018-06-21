package net.ys.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import net.ys.bean.User;
import net.ys.constant.GenResult;
import net.ys.response.UserResponse;
import net.ys.service.UserService;
import net.ys.utils.LogUtil;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "api/user", produces = {"application/json;charset=utf-8"})
@Api(value = "user-api", description = "用户接口")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping(value = "users", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    @ApiOperation(httpMethod = "GET", response = UserResponse.class, responseContainer = "UserResponse", value = "用户列表")
    public Map<String, Object> users(@ApiParam(required = true, value = "页数", defaultValue = "1") @RequestParam(required = true, defaultValue = "1") int page,
                                     @ApiParam(required = true, value = "每页条数", defaultValue = "10") @RequestParam(required = true, value = "page_size", defaultValue = "10") int pageSize) {
        try {
            List<User> users = userService.queryUsers(page, pageSize);
            return GenResult.SUCCESS.genResult(users);
        } catch (Exception e) {
            LogUtil.error(e);
            return GenResult.UNKNOWN_ERROR.genResult();
        }
    }
}
