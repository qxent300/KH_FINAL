package com.kh.finalproject.freeboard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.freeboard.model.vo.FreeBoard;
import com.kh.finalproject.freeboard.model.vo.Reply;
import com.kh.finalproject.common.util.PageInfo;

public interface FreeBoardService {

	int getFreeBoardCount();	// 페이징 처리를 위한 자유공간 게시글 수 확인
	
	void getAllFreeBoardList();	// 게시글 별로 댓글 수를 업데이트하여 전체 게시글을 조회하는 코드
	
	List<FreeBoard> getFreeBoardListByCategory(String fbCategory);	// 카테고리별 게시글 목록 출력
	
	List<FreeBoard> getFreeBoardList(PageInfo pageInfo);	// 공지를 제외한 게시글 목록 출력
	
	FreeBoard getFreeBoardDetail(int fbNo);	// 게시글 상세 조회
	
	int insertFreeBoard(FreeBoard fb);	// 게시글 입력

	int updateFreeBoard(FreeBoard fb);	// 게시글 수정
	
	int insertReply(Reply r);	// 댓글 입력
	
	int updateReply(Reply r);	// 댓글 수정
	
	int deleteReply(Reply r);	// 댓글 삭제
	
	int deleteFreeBoard(FreeBoard fb);	// 게시글 삭제

}
