package com.developer.blog.service;


import com.developer.blog.domain.UserDataVO;

public interface UserService {
	
	public void signUp(UserDataVO userVO);

	public int idOverlapCheck(String userId);

	public int loginUserCheck(String userId, String userPassowrd);

	public UserDataVO getUserData(String userId, String userPassword);

}
