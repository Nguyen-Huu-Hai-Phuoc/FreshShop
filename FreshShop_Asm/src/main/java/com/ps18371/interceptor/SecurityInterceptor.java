package com.ps18371.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

@Service
public class SecurityInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)	throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null){
			response.sendRedirect(request.getContextPath() + "/site/login");
			return false;
		}
		return true;
	}
}
