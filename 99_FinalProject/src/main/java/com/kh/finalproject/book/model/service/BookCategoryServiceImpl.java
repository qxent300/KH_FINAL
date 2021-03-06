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
		List<Book> list = mapper.selectNovelList();
		return list;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Book> getPoemList() {
		List<Book> list = mapper.selectPoemList();
		return list;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Book> getEconomyList() {
		List<Book> list = mapper.selectEconomyList();
		return list;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Book> getSelfDevList() {
		List<Book> list = mapper.selectSelfDevList();
		return list;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Book> getHumList() {
		List<Book> list = mapper.selectHumList();
		return list;
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Book> getHisCulList() {
		List<Book> list = mapper.selectHisCulList();
		return list;
	}
}
