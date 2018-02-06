package net.ys.utils;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * 图片压缩处理
 */
public class ImgCompress {
    private Image img;
    private int width;
    private int height;
    private String compressPath;

    /**
     * 构造函数
     */
    public ImgCompress(String in, String out) throws IOException {
        this.compressPath = out;
        File file = new File(in);
        img = ImageIO.read(file);      // 构造Image对象
        width = img.getWidth(null);   // 得到源图宽
        height = img.getHeight(null); // 得到源图长
    }

    /**
     * 构造函数
     */
    public ImgCompress(InputStream in, String out) throws IOException {
        this.compressPath = out;
        img = ImageIO.read(in);      // 构造Image对象
        width = img.getWidth(null);   // 得到源图宽
        height = img.getHeight(null); // 得到源图长
    }

    /**
     * 强制压缩/放大图片到指定大小
     */
    public void resize(int width, int height) throws IOException {
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        image.getGraphics().drawImage(img, 0, 0, width, height, null); // 绘制缩小后的图
        File outFile = new File(compressPath);
        FileOutputStream out = new FileOutputStream(outFile); // 输出到文件流
        // 可以正常实现bmp、png、gif转jpg
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
        encoder.encode(image);
        out.close();
    }

    public int getWidth() {
        return width;
    }

    public int getHeight() {
        return height;
    }

    public void setCompressPath(String compressPath) {
        this.compressPath = compressPath;
    }
}