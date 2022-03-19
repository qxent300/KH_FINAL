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
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		
		String option = param.get("option");
		String query = param.get("query");
		String category = param.get("category");
		String sort = param.get("sort");
		
		if(query == null) {
			PageInfo pageInfo = new PageInfo(page, 12, service.getBookCount(), 12);
			List<Book> list = service.getAllBookList(pageInfo);
			
			System.out.println("list :" + list);
			
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
		}else {
			PageInfo pageInfo = new PageInfo(page, 12, service.getBookCount(category, option, query), 12);
			List<Book> list = service.getBookList(category, option, query, sort, pageInfo);
			System.out.println("list :" + list);
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
		}
		
		model.setViewName("book/bS_Poem");
		return model;
	}

	
	@GetMapping(value = "/economy")
	public ModelAndView economy(ModelAndView model, @RequestParam Map<String, String> param) {
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		
		String option = param.get("option");
		String query = param.get("query");
		String category = param.get("category");
		String sort = param.get("sort");
		
		if(query == null) {
			PageInfo pageInfo = new PageInfo(page, 12, service.getBookCount(), 12);
			List<Book> list = service.getAllBookList(pageInfo);
			
			System.out.println("list :" + list);
			
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
		}else {
			PageInfo pageInfo = new PageInfo(page, 12, service.getBookCount(category, option, query), 12);
			List<Book> list = service.getBookList(category, option, query, sort, pageInfo);
			System.out.println("list :" + list);
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
		}
		
		model.setViewName("book/bS_Economy");
		return model;
	}
	

	@GetMapping(value = "/selfDevelopment")
	public ModelAndView selfDevelopment(ModelAndView model, @RequestParam Map<String, String> param) {
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		
		String option = param.get("option");
		String query = param.get("query");
		String category = param.get("category");
		String sort = param.get("sort");
		
		if(query == null) {
			PageInfo pageInfo = new PageInfo(page, 12, service.getBookCount(), 12);
			List<Book> list = service.getAllBookList(pageInfo);
			
			System.out.println("list :" + list);
			
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
		}else {
			PageInfo pageInfo = new PageInfo(page, 12, service.getBookCount(category, option, query), 12);
			List<Book> list = service.getBookList(category, option, query, sort, pageInfo);
			System.out.println("list :" + list);
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
		}
		
		model.setViewName("book/bS_SelfDevelopment");
		return model;
	}
	
	@GetMapping(value = "/humanities")
	public ModelAndView humanities(ModelAndView model, @RequestParam Map<String, String> param) {
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		
		String option = param.get("option");
		String query = param.get("query");
		String category = param.get("category");
		String sort = param.get("sort");
		
		if(query == null) {
			PageInfo pageInfo = new PageInfo(page, 12, service.getBookCount(), 12);
			List<Book> list = service.getAllBookList(pageInfo);
			
			System.out.println("list :" + list);
			
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
		}else {
			PageInfo pageInfo = new PageInfo(page, 12, service.getBookCount(category, option, query), 12);
			List<Book> list = service.getBookList(category, option, query, sort, pageInfo);
			System.out.println("list :" + list);
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
		}
		
		model.setViewName("book/bS_Humanities");
		return model;
	}
	
	@GetMapping(value = "/historyCulture")
	public ModelAndView historyCulture(ModelAndView model, @RequestParam Map<String, String> param) {
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		
		String option = param.get("option");
		String query = param.get("query");
		String category = param.get("category");
		String sort = param.get("sort");
		
		if(query == null) {
			PageInfo pageInfo = new PageInfo(page, 12, service.getBookCount(), 12);
			List<Book> list = service.getAllBookList(pageInfo);
			
			System.out.println("list :" + list);
			
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
		}else {
			PageInfo pageInfo = new PageInfo(page, 12, service.getBookCount(category, option, query), 12);
			List<Book> list = service.getBookList(category, option, query, sort, pageInfo);
			System.out.println("list :" + list);
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
		}
		
		model.setViewName("book/bS_HistoryCulture");
		return model;
	}
}
