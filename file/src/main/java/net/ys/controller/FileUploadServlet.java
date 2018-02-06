package net.ys.controller;

import net.ys.utils.ImgCompress;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 * User: LiWenC
 * Date: 16-9-18
 */
@WebServlet(urlPatterns = {"/upload"})
@MultipartConfig
public class FileUploadServlet extends HttpServlet {

    private static final int MIN_WIDTH = 600;//图片压缩最小宽度

    private static final String UPLOAD_PATH = "/img/";//上传服务器根路径

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendError(403);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        Part part = req.getPart("file");
        String type = req.getParameter("type");//文件类型
        String fileAlias = req.getParameter("fileAlias");//本地保存名称
        String fileName = req.getParameter("fileName");//文件原始名称
        String needThumbnail = req.getParameter("needThumbnail");//是否需要生成缩略图
        String uploadPath = req.getServletContext().getRealPath(UPLOAD_PATH + type);
        String str;
        if (part != null) {
            String suffix = fileName.substring(fileName.lastIndexOf("."));//文件格式
            fileName = fileAlias + suffix;//保存后的文件名称
            File file = new File(uploadPath);
            if (!file.exists()) {
                file.mkdirs();
            }

            InputStream is = part.getInputStream();
            ImgCompress imgCom = new ImgCompress(is, uploadPath + "/" + fileName);
            int width = imgCom.getWidth();
            int height = imgCom.getHeight();
            if (width > MIN_WIDTH) {
                width = width / 2;
                height = height / 2;
            }
            imgCom.resize(width, height);

            if ("1".equals(needThumbnail)) {//需要缩略图
                int withTmp = imgCom.getWidth();
                int heightTmp = imgCom.getHeight();
                if (withTmp > MIN_WIDTH) {
                    withTmp = withTmp / 3;
                    heightTmp = heightTmp / 3;
                }
                String thumbnailName = fileAlias + "_1" + suffix;//缩略图图片名称
                imgCom.setCompressPath(uploadPath + "/" + thumbnailName);
                imgCom.resize(withTmp, heightTmp);
            }

            str = "{\"result\":\"true\",\"suffix\":\"" + suffix + "\",\"width\":" + width + ",\"height\":" + height + "}";
        } else {
            str = "{\"result\":\"false\"}";
        }

        resp.getOutputStream().print(str);
    }
}
