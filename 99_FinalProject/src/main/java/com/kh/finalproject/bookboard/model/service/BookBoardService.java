package com.kh.finalproject.bookboard.model.service;

import java.util.List;

import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.bookboard.model.vo.BookBoard;
import com.kh.finalproject.common.util.PageInfo;


public interface BookBoardService {
	
	int saveBookBoard(BookBoard bookBoard);
	
	int getBookBoardCount();	// 페이징 처리를 위한 전체 독서 일기 게시글 수 확인
	
	List<BookBoard> getBookBoardListByRecommendCount();	// 가장 추천수가 높은 게시글 4개 출력
	
	List<BookBoard> getAllBookBoardList(PageInfo pageInfo, List<Integer> bbNoList);	// bbNoList에는 위의 추천수 높은 게시글 4개의 게시글 번호가 저장되어 4개를 제외한 나머지 게시글 목록 출력
	
	BookBoard getBookBoardByNo(int bbNo);	// 독서 일기 상세 정보 조회
	
	int insertBookBoard(BookBoard bb);	// 독서 일기 입력
	
	int updateBookBoard(BookBoard bb);	// 독서 일기 수정
	
	int deleteBookBoard(int bbNo);	// 독서 일기 삭제

	int updateRecommendPlus(int bbNo);	// 추천하기(추천수 + 1)
	
	int updateRecommendMinus(int bbNo);	// 추천 취소하기(추천수 - 1)

	Book findBookByNo(int bNo);
	
	int selectTest();
	
}