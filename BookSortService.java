package com.kh.finalproject.book.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.book.model.vo.Score;
import com.kh.finalproject.common.util.PageInfo;

public interface BookSortService {


	List<Book> getSearchBookSort(String sort);

	
}
