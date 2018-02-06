package net.ys.utils;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

public class ImageHelper {
    /* 
     * 根据尺寸图片居中裁剪 
     */
    public static void cutCenterImage(String src, String destination, int w, int h) throws IOException {
        Iterator iterator = ImageIO.getImageReadersByFormatName("png");
        ImageReader reader = (ImageReader) iterator.next();
        InputStream in = new FileInputStream(src);
        ImageInputStream iis = ImageIO.createImageInputStream(in);
        reader.setInput(iis, true);
        ImageReadParam param = reader.getDefaultReadParam();
        int imageIndex = 0;
        Rectangle rect = new Rectangle((reader.getWidth(imageIndex) - w) / 2, (reader.getHeight(imageIndex) - h) / 2, w, h);
        param.setSourceRegion(rect);
        BufferedImage bi = reader.read(0, param);
        ImageIO.write(bi, "png", new File(destination));
    }

    /* 
     * 图片裁剪二分之一 
     */
    public static void cutHalfImage(String src, String destination) throws IOException {
        Iterator iterator = ImageIO.getImageReadersByFormatName("jpg");
        ImageReader reader = (ImageReader) iterator.next();
        InputStream in = new FileInputStream(src);
        ImageInputStream iis = ImageIO.createImageInputStream(in);
        reader.setInput(iis, true);
        ImageReadParam param = reader.getDefaultReadParam();
        int imageIndex = 0;
        int width = reader.getWidth(imageIndex) / 2;
        int height = reader.getHeight(imageIndex) / 2;
        Rectangle rect = new Rectangle(width / 2, height / 2, width, height);
        param.setSourceRegion(rect);
        BufferedImage bi = reader.read(0, param);
        ImageIO.write(bi, "jpg", new File(destination));
    }

    /*
     * 图片裁剪通用接口 
     */
    public static void cutImage(String src, String destination, int x, int y, int w, int h) throws IOException {
        Iterator iterator = ImageIO.getImageReadersByFormatName("jpg");
        ImageReader reader = (ImageReader) iterator.next();
        InputStream in = new FileInputStream(src);
        ImageInputStream iis = ImageIO.createImageInputStream(in);
        reader.setInput(iis, true);
        ImageReadParam param = reader.getDefaultReadParam();
        Rectangle rect = new Rectangle(x, y, w, h);
        param.setSourceRegion(rect);
        BufferedImage bi = reader.read(0, param);
        ImageIO.write(bi, "jpg", new File(destination));

    }

    /* 
     * 图片缩放 
     */
    public static void zoomImage(String src, String destination, int w, int h) throws Exception {
        double wr, hr;
        File srcFile = new File(src);
        File destinationFile = new File(destination);
        BufferedImage bufImg = ImageIO.read(srcFile);
        Image image = bufImg.getScaledInstance(w, h, bufImg.SCALE_SMOOTH);
        wr = w * 1.0 / bufImg.getWidth();
        hr = h * 1.0 / bufImg.getHeight();
        AffineTransformOp ato = new AffineTransformOp(AffineTransform.getScaleInstance(wr, hr), null);
        image = ato.filter(bufImg, null);
        try {
            ImageIO.write((BufferedImage) image, destination.substring(destination.lastIndexOf(".") + 1), destinationFile);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


    public static void main(String[] args) throws IOException {
        String src = "e:/test.png";
        String destination = "e:/test2.png";
        cutCenterImage(src, destination, 168, 105);
    }
}