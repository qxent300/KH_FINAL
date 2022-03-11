package com.kh.finalproject.bookboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.bookboard.model.service.BookBoardService;

@RequestMapping("/bookboard")
@Controller
public class BookBoardController {

	@Autowired
	private BookBoardService service;

	@GetMapping("/list")
	public void bookBoardList() {
	}
	
	@GetMapping("/write")
	public void bookBoardWrite() {
	}
	
	@GetMapping("/view")
	public void bookBoardView() {
	}
}
