package com.kh.finalproject.book.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.book.model.mapper.BookCategoryMapper;
import com.kh.finalproject.book.model.vo.Book;

@Service
public class BookCategoryServiceImpl implements BookCategoryService {

	@Autowired
	private BookCategoryMapper mapper;
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Book> getNovelList() {
		List<Book> list = mapper.selectNovelList();	// 전체 도서 검색
		return list;
	}
}
