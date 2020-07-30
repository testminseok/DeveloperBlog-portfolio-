package com.developer.blog.mapper;

import java.util.List;

import com.developer.blog.domain.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> viewAll();

	public List<BoardVO> getReportListAll();

	public void reportWrite(BoardVO boardVO);

}
