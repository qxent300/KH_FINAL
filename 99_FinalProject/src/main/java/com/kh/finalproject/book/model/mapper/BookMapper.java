package com.kh.finalproject.book.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.book.model.vo.Score;

public interface BookMapper {
	
	List<Book> selectAllBookList();
	
	float selectBookAvgScore(int bNo);
	
	int updateBookAvgScore(Book book);
	
	int selectBookCount();
	
	List<Book> selectAllBookList(RowBounds rowBounds);
	
	int selectBookCountByOption(Map<String, String> map);
	
	List<Book> selectBookList(Map<String, String> map, RowBounds rowBounds);
	
	Book selectBook(int bNo);
	
	List<Score> selectScoreList(int bNo);
	
	int insertScore(Score s);
	
}
