package com.kh.finalproject.book.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.book.model.mapper.BookCategoryMapper;
import com.kh.finalproject.book.model.mapper.BookSortMapper;
import com.kh.finalproject.book.model.vo.Book;

import oracle.net.aso.b;

@Service
public class BookSortServiceImpl implements BookSortService {

	@Autowired
	private BookSortMapper mapper;
	

	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Book> getSearchBookSort(String sort) {
		List<Book> list = mapper.selectSearchBookSort(sort);
		return list;
	}


	
}
