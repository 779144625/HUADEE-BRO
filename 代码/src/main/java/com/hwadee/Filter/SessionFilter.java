package com.hwadee.Filter;

import com.hwadee.model.UserList;
import org.springframework.ui.Model;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Enzo Cotter on 2019/8/5.
 */
public class SessionFilter implements Filter {

    private FilterConfig filterConfig;

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig=filterConfig;
    }

    @Override
    public void doFilter(ServletRequest srequest, ServletResponse sresponse, FilterChain filterChain) throws IOException,ServletException{
        HttpServletRequest request=(HttpServletRequest) srequest;
        HttpServletResponse response=(HttpServletResponse)sresponse;
        //不用过滤的uri
        String[] unfilter = new String[]{"/user/login","/user/log"};

        //请求的uri
        String uri = request.getRequestURI();

        boolean ifneed = true;

        for(String s:unfilter){
            if(uri.indexOf(s)!=-1){
                ifneed=false;
                break;
            }
        }
        if(ifneed){
            UserList userlist = (UserList)request.getSession().getAttribute("test");
            if(null!=userlist){
                filterChain.doFilter(request,response);
            }
            else {
                response.sendRedirect(request.getContextPath()+"/user/login");
            }
        }
        else {
            filterChain.doFilter(request,response);
        }
    }

}
