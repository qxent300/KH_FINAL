package com.kh.finalproject.mypage.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.kh.finalproject.member.model.vo.Member;
import com.kh.finalproject.mypage.model.vo.MyPageBookVo;
import com.kh.finalproject.mypage.model.vo.MyPagePagingVo;


public interface MyPageBookBoardService {
	
	//게시판 리스트
    public List<MyPageBookVo> myPageBookBoardList(String nowPage, String cntPerPage, Member loginMember);
 
    // 게시물 총 갯수
    public int countBoard();

    // 페이징 처리 게시글 조회
    public List<MyPagePagingVo> selectBoard(MyPagePagingVo vo);

	public int deleteMyPage(String no);
	
	//마이페이지-회원정보수정
	public int myPageMemberUpdate(HttpServletRequest request);
	
	public Member memberData(String loginMember);
	
	int pwdUpdate (String str);
	
	String pwdSearch(String str);
	
	public List<MyPageBookVo> myPageBookReply(String nowPage, String cntPerPage, String loginMember);
	
	public Map<String, Object> replyMap(int uNo, int clickPage);
	


}
	
