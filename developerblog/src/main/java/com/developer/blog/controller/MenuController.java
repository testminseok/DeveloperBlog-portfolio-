package com.developer.blog.controller;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.developer.blog.domain.BoardVO;
import com.developer.blog.service.BoardService;

@Controller
public class MenuController {
	
	@Autowired
	private BoardService boardService;
	
	
	@GetMapping("/") 
	public String homeMenu (Model model,@RequestParam(value = "perPage" , defaultValue = "10") String perPage, @RequestParam(value = "page", defaultValue = "1") String page) {
		
		int pageNum = Integer.parseInt(page);
		int perPageNum = Integer.parseInt(perPage);
		int endNum = pageNum * perPageNum;
		int startNum = endNum - perPageNum +1; 
		
		int totalReports = (int) Math.ceil(((double)boardService.getReportListAllCount()/(double)perPageNum));
		int nowPage = pageNum;
		List<BoardVO> reportListPart = boardService.getReportListPart(startNum, endNum);
		model.addAttribute("reportListPart",reportListPart);
		model.addAttribute("totalReports",totalReports);
		model.addAttribute("nowPage",nowPage);
		
		return "index";
		
	}
			
	@GetMapping("/aboutMe")
	public String aboutMeMenu () {
		
		return "menu/aboutMe";
	}
	
	@GetMapping("/category")
	public String categoryMenu (Model model) {
		List<String> categoryList = boardService.getCategoryList();
		
		Map<String, Integer> categoryCount = new HashMap<String, Integer>();
		
		for (String categoryName : categoryList) {
			categoryCount.put(categoryName, categoryCount.getOrDefault(categoryName, 0)+1);
		}
		
		List<BoardVO> boardlist = boardService.getReportListAll();
		model.addAttribute("boardlist",boardlist);
		model.addAttribute("categoryCount",categoryCount);
		
		
		return "menu/category";
	}
	
	@GetMapping("/timeline")
	public String timelineMenu (Model model) {
		List<BoardVO> boardlist = boardService.getReportListAll();
		
		Collections.sort(boardlist);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		for (BoardVO boardVO : boardlist) {
			boardVO.setFormatDate(dateFormat.format(boardVO.getReportingDate()));
		}
		
		int boardCount = boardService.getReportListAllCount();
		
		model.addAttribute("boardCount",boardCount);
		model.addAttribute("boardlist",boardlist);
		
		
		return "menu/timeline";
	}

}
