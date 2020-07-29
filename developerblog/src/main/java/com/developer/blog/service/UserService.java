package com.developer.blog.service;


import com.developer.blog.domain.UserSignUpVO;

public interface UserService {
	
	public void signUp(UserSignUpVO userVO);

	public int idOverlapCheck(String userId);

}
