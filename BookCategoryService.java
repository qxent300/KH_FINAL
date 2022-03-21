package com.kh.finalproject.book.model.service;

import java.util.List;

import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.book.model.vo.Score;
import com.kh.finalproject.common.util.PageInfo;

public interface BookCategoryService {

	List<Book> getNovelList();
	
	List<Book> getPoemList();
	
	List<Book> getEconomyList();
	
	List<Book> getSelfDevelopmentList();
	
	List<Book> getHumanitiesList();
	
	List<Book> getHistoryList();
	
}
