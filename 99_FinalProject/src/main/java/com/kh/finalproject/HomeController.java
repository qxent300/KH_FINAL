package com.kh.finalproject;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalproject.book.model.service.BookService;
import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.common.util.PageInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BookService service;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView model) {
		List<Book> todayBookList = service.getAllTodayBookList();
		model.addObject("todayBookList", todayBookList);
		
		List<Book> bestsellerList = service.getBestsellerList();
		model.addObject("bestsellerList", bestsellerList);
		
		List<Book> newBookList = service.getNewBookList();
		model.addObject("newBookList", newBookList);
		
		model.setViewName("home");
		return model;
	}
	
	
	
	
	
}
