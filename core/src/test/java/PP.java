import net.sf.json.JSONObject;

/**
 * User: LiWenC
 * Date: 18-7-4
 */
public class PP {

    private int id;
    private String name;
    private int age;

    public PP() {
    }

    public static PP fromJson(String json) {
        JSONObject obj = JSONObject.fromObject(json);
        return (PP) JSONObject.toBean(obj, PP.class);
    }

    public PP(int id, String name, int age) {
        this.id = id;
        this.name = name;
        this.age = age;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "PP{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}
