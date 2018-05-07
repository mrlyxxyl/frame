package net.ys.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import net.sf.json.JSONObject;
import net.ys.constant.FileType;
import net.ys.constant.GenResult;
import net.ys.utils.FileUploadUtil;
import net.ys.utils.LogUtil;
import net.ys.utils.Tools;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping(value = "file", produces = {"application/json;charset=utf-8"})
@Api(value = "file-api", description = "文件接口")
public class FileController {

    @RequestMapping(value = "upload", method = RequestMethod.POST, headers = "Accept=application/json")
    @ResponseBody
    @ApiOperation(httpMethod = "POST", response = Map.class, responseContainer = "Map", value = "上传文件")
    public Map<String, Object> upload(@ApiParam(value = "头像文件", required = true) @RequestParam(required = true) MultipartFile file) {
        try {
            long start = System.currentTimeMillis();
            JSONObject result = FileUploadUtil.upload(FileType.HEAD_IMG.path, file.getOriginalFilename(), Tools.genImgFileName(), file.getInputStream(), "1");
            System.out.println(System.currentTimeMillis() - start);
            if (result.optBoolean("result")) {
                return GenResult.SUCCESS.genResult();
            }
            return GenResult.FAILED.genResult();
        } catch (Exception e) {
            LogUtil.error(e);
            return GenResult.UNKNOWN_ERROR.genResult();
        }
    }
}
