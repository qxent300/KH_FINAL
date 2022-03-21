package com.kh.finalproject.book.model.mapper;

import java.util.List;

import com.kh.finalproject.book.model.vo.Book;

public interface BookCategoryMapper {
	
	List<Book> selectNovelList();

	List<Book> selectPoemList();

	List<Book> selectEconomyList();

	List<Book> selectSelfDevList();

	List<Book> selectHumList();

	List<Book> selectHisCulList();
}