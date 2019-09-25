package com.academy.core.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.academy.core.service.AcademyService;
import com.academy.core.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AcademyController {
	
	@Inject
	private AcademyService academyService;
	
	/**
	 * 시작
	 * 
	 * @throws Exception 
	 * @Param vo : 로그인 요청 정보
	 * */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome home! The client locale is {}.", locale);
		return "redirect:/login";
	}
	
	/**
	 * 로그인 폼
	 * 
	 * @throws Exception 
	 * @Param vo : 로그인 요청 정보
	 * */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void getLogin() throws Exception {
		log.info("로그인  폼 GET 요청");
	}
	
	/**
	 * 로그인 기능
	 * 
	 * @throws Exception 
	 * @Param vo : 로그인 요청 정보
	 * */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String postLogin(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		log.info("로그인 POST 요청 | vo : "+vo.toString());
		
		// 이미 로그인 했을 경우 로그인 못하도록 처리
		HttpSession session = req.getSession();
		
		// 비밀번호 일치 검사
		UserVO loginUser = academyService.login(vo);
		boolean passMatch = vo.getUser_password().equals(loginUser.getUser_password());
		
		// 비밀번호 일치 시,
		if(passMatch) {
			// 사용자 정보 session
			session.setAttribute("loginUser", loginUser);
			
			// 사용자 유형별로 redirect
			if(loginUser.getUser_type().equals("0")) {
				return "redirect:/admin/dashboard";
			} else if(loginUser.getUser_type().equals("1")) {
				return "redirect:/employee/dashboard";
			} else if(loginUser.getUser_type().equals("2")) {
				return "redirect:/student/dashboard";
			} else {
				log.info("존재하지 않는 사용자 유형");
			}
		}
		rttr.addFlashAttribute("msg","fail");
		return "redirect:/login";
	}
}
