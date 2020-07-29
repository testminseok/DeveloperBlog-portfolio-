package com.developer.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.developer.blog.domain.UserSignUpVO;
import com.developer.blog.mapper.UserMapper;
import com.developer.blog.service.UserService;


@Service
public class UserServiceimpl implements UserService {

	
	@Autowired
	private UserMapper mapper;
	
	@Override
	public void signUp( UserSignUpVO userVO) {
		mapper.signUp(userVO);
	}
	
	@Override
	public int idOverlapCheck(String userId) {
		return mapper.idOverlapCheck(userId);
	}
}
