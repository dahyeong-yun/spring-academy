package com.academy.core.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.academy.core.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CommonInterceptor extends HandlerInterceptorAdapter {
	/**
	 * 로그인 세션 체크
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			log.info("로그인 세션 없음");
			response.sendRedirect("/login");
			return false;
		} else {
			log.info("로그인 유저 : "+loginUser.toString());
			return true;
		}
	}

	/**
	 * 메뉴 권한 체크
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}
}
