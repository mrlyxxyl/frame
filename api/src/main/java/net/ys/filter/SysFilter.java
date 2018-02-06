package net.ys.filter;

import net.ys.constant.GenResult;
import net.ys.constant.X;
import net.ys.controller.ApplicationContextUtil;
import net.ys.service.CommonService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = "/int/*")
public final class SysFilter implements Filter {

    private CommonService commonService;

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (commonService == null) {
            commonService = ApplicationContextUtil.getBean("commonService", CommonService.class);
        }

        HttpServletRequest req = (HttpServletRequest) request;
        String time = req.getParameter("t");
        String key = req.getParameter("k");
        String md5Str = req.getParameter("m");
        if (!commonService.verifyIntParams(key, time, md5Str)) {
            response.setCharacterEncoding(X.ENCODING.U);
            response.setContentType("application/json; charset=" + X.ENCODING.U);
            HttpServletResponse res = (HttpServletResponse) response;
            res.getWriter().write(GenResult.REQUEST_INVALID.toJson());
        } else {
            chain.doFilter(request, response);
        }
    }

    public void destroy() {
    }
}