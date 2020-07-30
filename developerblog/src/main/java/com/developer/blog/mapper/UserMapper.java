package com.developer.blog.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.developer.blog.domain.UserDataVO;

@Mapper
public interface UserMapper {

	public void signUp(UserDataVO userVO);

	public int idOverlapCheck(String userId);

	public int loginUserCheck(@Param("userId") String userId,@Param("userPassowrd") String userPassowrd);

	public UserDataVO getUserData(@Param("userId") String userId,@Param("userPassowrd") String userPassowrd);
}
