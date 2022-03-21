package com.kh.finalproject.book.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.book.model.vo.Score;

public interface BookCategoryMapper {
	
	List<Book> selectNovelList();
	
	List<Book> selectPoemList();
	
	List<Book> selectEconomyList();
	
	List<Book> selectSelfDevelopmentList();
	
	List<Book> selectHumanitiesList();
	
	List<Book> selectHistoryList();
	
	
}
