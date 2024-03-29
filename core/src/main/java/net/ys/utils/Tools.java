package net.ys.utils;

import net.ys.constant.Glc;
import net.ys.constant.SysRegex;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;
import java.util.UUID;

/**
 * User: LiWenC
 * Date: 16-9-8
 */
public class Tools {

    private static Random rand;
    public static final String KEY_PREFIX = "_86668_";
    static MessageDigest md5;

    static {
        rand = new Random();
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
        }
    }

    /**
     * 判断多个字符串是否为空
     *
     * @param strings
     * @return
     */
    public static boolean isNotEmpty(String... strings) {
        if (strings == null || strings.length == 0) {
            return false;
        }
        for (String str : strings) {
            if (str == null || "".equals(str.trim())) {
                return false;
            }
        }
        return true;
    }

    /**
     * 获取随机数字
     *
     * @return
     */
    public static int randomInt() {
        int[] array = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
        for (int i = 10; i > 1; i--) {
            int index = rand.nextInt(i);
            int tmp = array[index];
            array[index] = array[i - 1];
            array[i - 1] = tmp;
        }
        int result = 0;
        for (int i = 0; i < 6; i++) {
            if (i == 0 && array[i] == 0) {
                array[i] = 1;
            }
            result = result * 10 + array[i];
        }
        return result;
    }

    /**
     * 获取指定长度随机字符串
     *
     * @param len
     * @return
     */
    public static String randomString(int len) {
        return UUID.randomUUID().toString().replaceAll("-", "").substring(0, len);
    }

    /**
     * 获取随机数字
     *
     * @return
     */
    public static int randomInt(int num) {
        return rand.nextInt(num);
    }

    /**
     * MD5加密
     *
     * @param str
     * @return
     */
    public static String genMD5(String str) {
        try {
            if (str == null || "".equals(str.trim())) {
                return "";
            }
            byte[] bs = md5.digest((KEY_PREFIX + str).getBytes(Glc.Code.U));
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bs.length; i++) {
                sb.append(Character.forDigit((bs[i] >>> 4) & 0x0F, 16)).append(Character.forDigit(bs[i] & 0x0F, 16));
            }
            return sb.toString();
        } catch (Exception e) {
        }
        return "";
    }

    /**
     * 生成上传图片的名称
     *
     * @return
     */
    public static String genImgFileName() {
        return System.currentTimeMillis() + "_" + rand.nextInt(100);
    }

    /**
     * 校验手机号合法性
     *
     * @param phoneNumber
     * @return
     */
    public static boolean validatePhoneNumber(String phoneNumber) {
        if (phoneNumber != null && !"".equals(phoneNumber.trim())) {
            return phoneNumber.matches(SysRegex.PHONE_NUMBER.regex);
        }
        return false;
    }
}
