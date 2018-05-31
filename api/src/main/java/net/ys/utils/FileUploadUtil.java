package net.ys.utils;

import net.sf.json.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.*;
import java.util.Random;

public class FileUploadUtil {

    private static CloseableHttpClient httpClient;
    private static HttpPost httpPost;
    private static Random random = new Random();

    static {
        String upload_url = PropertyUtil.get("upload_file_url");
        httpClient = HttpClients.createDefault();
        httpPost = new HttpPost(upload_url);
    }

    /**
     * 文件上传工具
     *
     * @param type          文件类型，eg:h->head_img, s->system
     * @param fileName      文件原始名称
     * @param fileAlias     文件别名:由业务系统生成
     * @param stream        文件流
     * @param needThumbnail 是否需要生成缩略图 0-不需要/1-需要
     * @throws IOException
     */
    public static JSONObject upload(String type, String fileName, String fileAlias, InputStream stream, String needThumbnail) throws IOException {

        MultipartEntityBuilder entityBuilder = MultipartEntityBuilder.create();
        entityBuilder.addTextBody("needThumbnail", needThumbnail);
        entityBuilder.addTextBody("type", type);
        entityBuilder.addTextBody("fileName", fileName);
        entityBuilder.addTextBody("fileAlias", fileAlias);
        entityBuilder.addBinaryBody("file", stream);

        httpPost.setEntity(entityBuilder.build());
        CloseableHttpResponse response = httpClient.execute(httpPost);
        JSONObject jsonObject = null;
        try {
            int code = response.getStatusLine().getStatusCode();
            if (code == 200) {
                HttpEntity entity = response.getEntity();
                BufferedReader reader = new BufferedReader(new InputStreamReader(entity.getContent()));
                String line;
                StringBuffer result = new StringBuffer();
                while ((line = reader.readLine()) != null) {
                    result.append(line);
                }
                EntityUtils.consume(entity);
                String dd = result.toString().replaceAll("'", "\"");
                jsonObject = JSONObject.fromObject(dd);
            }
        } finally {
            response.close();
        }
        return jsonObject;
    }

    public static void main(String[] args) throws IOException {
        String fileAlias = System.currentTimeMillis() + "_" + random.nextInt(100);
        JSONObject result = upload("h", "test.png", fileAlias, new FileInputStream("e:/test.png"), "1");
        LogUtil.print(result.toString());
    }
}