package com.kh.finalproject.book.model.mapper;

import java.util.List;

import com.kh.finalproject.book.model.vo.Book;

public interface BookSortMapper {
	
	List<Book> selectSearchBookSort(String sort);
}
