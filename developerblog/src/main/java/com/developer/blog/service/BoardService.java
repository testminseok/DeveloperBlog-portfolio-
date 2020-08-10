package com.developer.blog.service;

import java.util.List;

import com.developer.blog.domain.BoardVO;

public interface BoardService {

	public List<BoardVO> getReportListAll();

	public void reportWrite(BoardVO boardVO);

	public BoardVO getBoardData(int bno);

	public void boardModify(BoardVO boardvo);

	public void boardDelete(int bno);

	public List<BoardVO> getReportListPart(int startNum, int endNum);

	public int getReportListAllCount();

	public List<String> getCategoryList();
}
