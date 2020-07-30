package com.developer.blog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.developer.blog.domain.UserDataVO;
import com.developer.blog.service.UserService;

@Controller
public class UserDataController {
	
	@Autowired
	UserService userService;
	
	
	//회원가입 함수
	@PostMapping("/signUp")
	public String signUp(UserDataVO userVO) {
		
		userService.signUp(userVO);
		
		return "redirect: / ";	
	}
	
	//회원가입 아이디 중복확인 함수
	@PostMapping("/idOverlapCheck")
	public @ResponseBody String idOverlapCheck(HttpServletRequest request) {
		int overlapCheck = userService.idOverlapCheck(request.getParameter("userid"));
		
		if (overlapCheck == 0) {
			return "true";
		}
		else {
			return "false";
		}
		
		
	}
	
	//로그인 함수
	@PostMapping("/checkUserData")
	public @ResponseBody String checkUserData(HttpServletRequest request, HttpSession session) {
		
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassowrd");
		int userCheck = userService.loginUserCheck(userId, userPassword);
		
		UserDataVO userData =  userService.getUserData(userId, userPassword);
		
		session.setAttribute("user", userData); 
		
		if (userCheck == 0 ) {
			return "false"; 
		}
		else {
			return "true";
		}
	}
	
	//로그아웃
	@GetMapping("/userLogout")
	public String userLogout(HttpSession session) {
		
		session.removeAttribute("user");
		
		
		return "redirect: /";
	}
	

}
