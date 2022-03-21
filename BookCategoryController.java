package com.kh.finalproject.book.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalproject.book.model.service.BookCategoryService;
import com.kh.finalproject.book.model.service.BookService;
import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.common.util.PageInfo;

@RequestMapping("/book")
@Controller
public class BookCategoryController {
	
	@Autowired
	private BookService service;
	
	@Autowired
	private BookCategoryService service2;
	
	@GetMapping(value = "/novel")
	public ModelAndView novel(ModelAndView model, @RequestParam Map<String, String> param) {
		
		List<Book> novelList = service2.getNovelList();
		model.addObject("novelList", novelList);
		
		model.setViewName("book/bS_Novel");
		return model;
	}
	
	@GetMapping(value = "/poem")
	public ModelAndView poem(ModelAndView model, @RequestParam Map<String, String> param) {
		
		List<Book> poemList = service2.getPoemList();
		model.addObject("poemList", poemList);
		
		model.setViewName("book/bS_Poem");
		return model;
	}

	
	@GetMapping(value = "/economy")
public ModelAndView economy(ModelAndView model, @RequestParam Map<String, String> param) {
		
		List<Book> economyList = service2.getEconomyList();
		model.addObject("economyList", economyList);
		
		model.setViewName("book/bS_Economy");
		return model;
	}
	

	@GetMapping(value = "/selfDevelopment")
public ModelAndView selfDevelopment(ModelAndView model, @RequestParam Map<String, String> param) {
		
		List<Book> selfDevelopmentList = service2.getSelfDevelopmentList();
		model.addObject("selfDevelopmentList", selfDevelopmentList);
		
		model.setViewName("book/bS_SelfDevelopment");
		return model;
	}
	
	@GetMapping(value = "/humanities")
public ModelAndView humanities(ModelAndView model, @RequestParam Map<String, String> param) {
		
		List<Book> humanitiesList = service2.getHumanitiesList();
		model.addObject("humanitiesList", humanitiesList);
		
		model.setViewName("book/bS_Humanities");
		return model;
	}
	
	@GetMapping(value = "/historyCulture")
public ModelAndView historyCulture(ModelAndView model, @RequestParam Map<String, String> param) {
		
		List<Book> historyCultureList = service2.getHistoryList();
		model.addObject("historyCultureList", historyCultureList);
		
		model.setViewName("book/bS_HistoryCulture");
		return model;
	}
}
