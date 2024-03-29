package net.ys.filter;

import net.ys.constant.GenResult;
import net.ys.constant.Glc;
import net.ys.utils.Tools;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebFilter(urlPatterns = "/api/*")
public final class SysFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        boolean flag = validParams(request);
        if (!flag) {
            response.setCharacterEncoding(Glc.Code.U);
            response.setContentType("application/json; charset=" + Glc.Code.U);
            HttpServletResponse res = (HttpServletResponse) response;
            res.getWriter().write(GenResult.REQUEST_INVALID.toJson());
        } else {
            chain.doFilter(request, response);
        }
    }

    private boolean validParams(ServletRequest request) {
        String time = request.getParameter("t");//时间戳
        String randomStr = request.getParameter("r");//原始加密字符串
        String md5Str = request.getParameter("m");//前端返回的md5加密串

        if (Tools.isNotEmpty(time, randomStr, md5Str)) {
            String m = Tools.genMD5(randomStr + time);
            if (m.equals(md5Str)) {
                return true;
            }
        }

        return false;
    }

    public void destroy() {
    }
}