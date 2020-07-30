package com.developer.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.developer.blog.domain.BoardVO;
import com.developer.blog.mapper.BoardMapper;
import com.developer.blog.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	
	@Override
	public List<BoardVO> getReportListAll() {
		return mapper.getReportListAll();
	}
	
	@Override
	public void reportWrite(BoardVO boardVO) {
		mapper.reportWrite(boardVO);
	}
}
