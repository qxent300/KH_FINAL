package com.kh.finalproject.book.model.service;

import java.util.List;

import com.kh.finalproject.book.model.vo.Book;

public interface BookCategoryService {

	List<Book> getNovelList();

	List<Book> getPoemList();

	List<Book> getEconomyList();

	List<Book> getSelfDevList();

	List<Book> getHumList();

	List<Book> getHisCulList();
}