package net.ys.schedule;

import net.ys.service.EmailService;
import net.ys.utils.PropertyUtil;
import org.springframework.stereotype.Service;

/**
 * 定时任务
 */
@Service
public class ScheduleService {

    private static String username;
    private static String password;
    private static String receiveUsers;

    static {
        username = PropertyUtil.get("email.username");
        password = PropertyUtil.get("email.password");
        receiveUsers = PropertyUtil.get("email.receiveUsers");
    }

    /**
     * 每日新增认证和提现邮件提醒管理员
     */
    public void newAuthNotice() {
        EmailService emailService = new EmailService("smtp.qq.com", username, password);
        String notice = "新增主播认证：%s,新增提现申请：%s,请尽快登录海棠直播后台进行处理！";
        emailService.sendZoneEmail("海棠直播今日新增主播认证和提现", String.format(notice, 1, 1), receiveUsers);
    }
}
