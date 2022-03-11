package com.kh.finalproject.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.book.model.service.BookService;

@RequestMapping("/book")
@Controller
public class BookController {
	
	@Autowired
	private BookService service;

	@GetMapping("/search")
	public void bookSearch() {
	}
	
	@GetMapping("/view")
	public void bookDetail() {
	}
}
