package com.developer.blog.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		int reportListAllCount = boardService.getReportListAllCount();
		model.addAttribute("reportListAllCount",reportListAllCount);
		
		return "board/admin/adminPage";
	}
	
	//글 목록 불러오기
	@GetMapping("/toastList")
	public @ResponseBody List<BoardVO> getReportListAll(Model model ,@RequestParam(value = "perPage" , defaultValue = "10") String perPage, @RequestParam(value = "page", defaultValue = "1") String page) {
		
		
		int pageNum = Integer.parseInt(page);
		int perPageNum = Integer.parseInt(perPage);
		int endNum = pageNum * perPageNum;
		int startNum = endNum - perPageNum +1; 
		
		List<BoardVO> reportListPart= boardService.getReportListPart(startNum, endNum);
		
		
		
		
		return reportListPart;
	}
	

	//관리자 글쓰기 페이지로 이동
	@GetMapping("/boardWrite")
	public String adminBoardWrite(Model model,HttpSession session, HttpServletRequest request) {
		List<String> categoryList = boardService.getCategoryList();
		List<String> categoryDeduplication = new ArrayList<String>();
		
		for (String categoryName : categoryList) {
			if(!categoryDeduplication.contains(categoryName)) {
				categoryDeduplication.add(categoryName);
			}
		}
		model.addAttribute("categoryDeduplication",categoryDeduplication);
		return "board/admin/boardWrite";
	}
	
	//관리자 글쓰기
	@PostMapping("/reportWrite")
	public String reportWrite(BoardVO boardVO) {
		
		boardService.reportWrite(boardVO);
		
		return "board/admin/adminPage";
//		return "redirect: /adminPage";
	}
	
	//글 상세보기
	@GetMapping("/boardDetails/{bno}")
	public String getBoardDetails(@PathVariable("bno") int bno, Model model) {
		
		BoardVO boardVO = boardService.getBoardData(bno);
		
		model.addAttribute("boardVO",boardVO); 
		
		return "board/boardDetails";
	}
	
	//글 수정 페이지 이동
	@GetMapping("/moveBoardModifyPage/{bno}")
	public String moveBoardModifyPage(@PathVariable("bno") int bno, Model model) {
		
		BoardVO boardVO = boardService.getBoardData(bno);
		
		model.addAttribute("boardVO",boardVO);
		return "board/admin/boardModify";
	}
	
	//글 수정 
	@PutMapping("/boardModify")
	public String boardModify(BoardVO boardvo) {
		
		boardService.boardModify(boardvo);
		
		return "redirect: /boardDetails/"+boardvo.getBno();
	}
	
	//글 삭제
	@DeleteMapping("/boardDelete")
	public String boardDelete(@RequestParam("bno") int bno) {
		
		boardService.boardDelete(bno);
		
		return "redirect: /adminPage";
	}
	
}
