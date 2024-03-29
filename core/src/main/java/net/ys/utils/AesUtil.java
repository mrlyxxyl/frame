package net.ys.utils;

import net.ys.constant.Glc;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * 使用AES算法完成对数据的加密和解密
 */
public class AesUtil {

    private static final String IV_STRING = "6868688xy8686866";
    private static final String KEY = "8686866xy6868688";
    private static final String TITLE_CONTENT = "AES";
    private static final String INS = "AES/CBC/PKCS5Padding";

    /**
     * 加密
     *
     * @param content
     * @return
     */
    public static String encryptAES(String content) {
        try {
            byte[] byteContent = content.getBytes(Glc.Code.U);
            byte[] enCodeFormat = KEY.getBytes(Glc.Code.U);
            SecretKeySpec secretKeySpec = new SecretKeySpec(enCodeFormat, TITLE_CONTENT);
            byte[] initParam = IV_STRING.getBytes(Glc.Code.U);
            IvParameterSpec ivParameterSpec = new IvParameterSpec(initParam);
            Cipher cipher = Cipher.getInstance(INS);
            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);
            byte[] encryptedBytes = cipher.doFinal(byteContent);
            return new BASE64Encoder().encode(encryptedBytes);
        } catch (Exception e) {
        }
        return "";
    }

    /**
     * 解密
     *
     * @param content
     * @return
     */
    public static String decryptAES(String content) {
        try {
            BASE64Decoder decoder = new BASE64Decoder();
            byte[] encryptedBytes = decoder.decodeBuffer(content);
            byte[] enCodeFormat = KEY.getBytes(Glc.Code.U);
            SecretKeySpec secretKey = new SecretKeySpec(enCodeFormat, TITLE_CONTENT);
            byte[] initParam = IV_STRING.getBytes(Glc.Code.U);
            IvParameterSpec ivParameterSpec = new IvParameterSpec(initParam);
            Cipher cipher = Cipher.getInstance(INS);
            cipher.init(Cipher.DECRYPT_MODE, secretKey, ivParameterSpec);
            byte[] result = cipher.doFinal(encryptedBytes);
            return new String(result, Glc.Code.U);
        } catch (Exception e) {
        }
        return "";
    }

    public static void main(String[] args) throws Exception {
        String str = encryptAES("hello");
        LogUtil.print(str);
        LogUtil.print(decryptAES(str));
    }
}