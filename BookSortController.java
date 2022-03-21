package com.kh.finalproject.book.controller;

import java.util.HashMap;
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
import com.kh.finalproject.book.model.service.BookSortService;
import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.common.util.PageInfo;

@RequestMapping("/book")
@Controller
public class BookSortController {
	
	@Autowired
	private BookService service;
	
	@Autowired
	private BookSortService service3;
	
	@GetMapping(value = "/searchsort")
	public ModelAndView sort(ModelAndView model, 
			@RequestParam Map<String, String> param,
			@RequestParam(defaultValue = "publish_date") String sortname) {
		
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

		
		List<Book> SearchBookSort = service3.getSearchBookSort(sortname);
		model.addObject("list", SearchBookSort);
		model.addObject("sortname", sortname);
		
		model.setViewName("book/searchsort");
		return model;
	}
	
}
