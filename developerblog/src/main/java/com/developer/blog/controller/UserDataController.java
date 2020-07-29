package com.developer.blog.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.developer.blog.domain.UserSignUpVO;
import com.developer.blog.service.UserService;

@Controller
public class UserDataController {
	
	@Autowired
	UserService userService;
	
	@PostMapping("/signUp")
	public String signUp(UserSignUpVO userVO) {
		
		userService.signUp(userVO);
		
		return "redirect: / ";	
	}
	
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
	

}
