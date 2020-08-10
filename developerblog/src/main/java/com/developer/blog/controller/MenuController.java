package com.developer.blog.controller;

import java.util.List;

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
	public String callByHome (Model model,@RequestParam(value = "perPage" , defaultValue = "10") String perPage, @RequestParam(value = "page", defaultValue = "1") String page) {
		
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
			

}
