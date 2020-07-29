package com.developer.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.developer.blog.service.BoardService;

@Controller
public class BoardController {

	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("test")
	public String test(Model model) {
		model.addAttribute("viewAll", boardService.viewAll());
		return "board/test";
	}

	@GetMapping("board")
	public String board(Model model) {
		model.addAttribute("viewAll", boardService.viewAll());
		return "board/test";
	}
}
