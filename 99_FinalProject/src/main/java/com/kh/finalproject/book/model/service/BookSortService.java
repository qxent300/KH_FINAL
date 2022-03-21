package com.kh.finalproject.book.model.service;

import java.util.List;

import com.kh.finalproject.book.model.vo.Book;

public interface BookSortService {

	List<Book> getSearchBookSort(String sort);
}