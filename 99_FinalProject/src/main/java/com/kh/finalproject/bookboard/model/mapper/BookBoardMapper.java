package com.kh.finalproject.bookboard.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.bookboard.model.vo.BookBoard;


@Mapper
public interface BookBoardMapper {

	int selectBookBoardCount();
	
	List<BookBoard> selectBookBoardListByRecommendCount();
	
	List<BookBoard> selectAllBookBoardList(Map<String, List<Integer>> map, RowBounds rowBounds);
	
	BookBoard selectBookBoardByNo(int bbNo);
	
	int insertBookBoard(BookBoard bb);
	
	int updateBookBoard(BookBoard bb);
	
	int deleteBookBoard(int bbNo);
	
	int updateRecommendPlus(int bbNo);
	
	int updateRecommendMinus(int bbNo);

	Book selectBook(int bNo);

	int selectTest();

	
}
