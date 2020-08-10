package com.developer.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.developer.blog.domain.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> viewAll();

	public List<BoardVO> getReportListAll();

	public void reportWrite(BoardVO boardVO);

	public BoardVO getBoardData(int bno);

	public void boardModify(BoardVO boardvo);

	public void boardDelete(int bno);

	public List<BoardVO> getReportListPart(@Param("startNum") int startNum, @Param("endNum") int endNum);

	public int getReportListAllCount();

	public List<String> getCategoryList();

}
