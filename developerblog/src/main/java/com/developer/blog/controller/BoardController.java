package com.developer.blog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.developer.blog.domain.BoardVO;
import com.developer.blog.service.BoardService;

@Controller
public class BoardController {

	
	@Autowired
	private BoardService boardService;
	
	//관리자 페이지로 이동
	@GetMapping("/adminPage")
	public String adminPage(HttpSession session, Model model) {
		
		List<BoardVO> reportListAll = boardService.getReportListAll();
		
		model.addAttribute("reportListAll",reportListAll);
		
		return "board/admin/adminPage";
	}
	
	//글 목록 불러오기
	@GetMapping("/toastList")
	public @ResponseBody List<BoardVO> getReportListAll() {
		
		List<BoardVO> reportListAll = boardService.getReportListAll();
		
		return reportListAll;
	}
	
	//관리자 글쓰기 페이지로 이동
	@GetMapping("/boardWrite")
	public String adminBoardWrite(HttpSession session, HttpServletRequest request) {
		
		return "board/admin/boardWrite";
	}
	
	//관리자 글쓰기
	@PostMapping("/reportWrite")
	public String reportWrite(BoardVO boardVO) {
		
		boardService.reportWrite(boardVO);
		
		return "board/admin/adminPage";
	}
	
}
