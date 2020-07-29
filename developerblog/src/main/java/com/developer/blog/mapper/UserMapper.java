package com.developer.blog.mapper;


import com.developer.blog.domain.UserSignUpVO;

public interface UserMapper {

	public void signUp(UserSignUpVO userVO);

	public int idOverlapCheck(String userId);
}
