package com.academy.appl.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.academy.appl.admin.service.AdminInfoService;
import com.academy.core.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/info/*")
public class AdminInfoController {

	@Inject
	private AdminInfoService adminInfoService;
	
	// 회원정보 업데이트
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String postUpdate(UserVO vo, HttpSession session, Model model) throws Exception {
		log.info("내 정보 수정 메뉴에서 회원 정보 업데이트 요청(POST)");
		log.info(vo.toString());
		int result = adminInfoService.updateUserInfo(vo); // 성공 실패 여부에 따라서
		if(result!=0) {
			session.removeAttribute("loginUser");
			UserVO loginUser = adminInfoService.renewalUserSession(vo); // 성공 실패 여부 체크하기
			session.setAttribute("loginUser", loginUser);
		}
		return "redirect:/admin/info";
	}	
	
	// 비밀번호 변경 폼
	@RequestMapping("passChange")
	public String getPassChange(Model model) throws Exception {
		log.info("내 정보 수정 메뉴에서 비밀번호 수정 폼 요청(GET)");
		model.addAttribute("pageTitle", "회원 탈퇴");
		return "admin/info/suspend";
	}	
	
	// 회원 정지 폼
	@RequestMapping("suspend")
	public String getSuspend(String user_id, Model model) throws Exception {
		log.info("내 정보 수정 메뉴에서 회원 탈퇴 폼 요청(GET)");
		adminInfoService.suspendUser(user_id);
		return "redirect:/logout";
	}	
	
}
