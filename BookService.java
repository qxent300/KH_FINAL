package com.kh.finalproject.book.model.service;

import java.util.List;

import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.book.model.vo.Score;
import com.kh.finalproject.common.util.PageInfo;

public interface BookService {

	int getBookCount();	// 페이징 처리를 위한 전체 도서 권수 확인
	
	List<Book> getAllBookList(PageInfo pageInfo);	// 모든 도서를 최신순으로 정렬
	
	int getBookCount(String category, String option, String query);	// option : 검색 종류(제목 / 저자), query : 검색어 -> 검색 결과에 해당하는 도서 권수 확인
	
	List<Book> getBookList(String category, String option, String query, String sort, PageInfo pageInfo);	// 도서 검색시 출력되는 결과 목록
	
	Book findBookByNo(int bNo);	// 도서 상세 정보(책 정보)
	
	List<Score> getScoreList(int bNo);	// 도서 상세 정보(평점 + 한줄평)
	
	int insertScore(int bNo, int uNo, String sContent, int score);	// 평점 + 한줄평 입력
	
	List<Book> getAllTodayBookList();

	List<Book> getBestsellerList();

	List<Book> getNewBookList();

	List<Book> getSearchBookList(String keyword, String option);

	List<Book> getSearchBookSort();
	
	
}
