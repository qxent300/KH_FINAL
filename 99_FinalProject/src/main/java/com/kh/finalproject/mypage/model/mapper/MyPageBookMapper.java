package com.kh.finalproject.mypage.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.finalproject.member.model.vo.Member;
import com.kh.finalproject.mypage.model.vo.MyPageBookVo;
import com.kh.finalproject.mypage.model.vo.MyPagePagingVo;

@Mapper
public interface MyPageBookMapper {
	
	List<MyPageBookVo> myPageBookBoardList(Map<String, Object> paramMap);

	int countBoard();

	List<MyPagePagingVo> selectBoard(MyPagePagingVo vo);

	int deleteMyPage(String no);
 
	int myPageMemberUpdate(Map<String, Object> paramMap);
	
	Member selectMember(int loginMember);
	
	int pwdUpdate(Map<String, Object> paramMap);
	
	Member pwdSearch(String uId);
	
	List<MyPageBookVo> myPageBookReply(Map<String, Object> paramMap2);
	
	List<Map<String, Object>> replyList(Map<String, Object> paramMap);
	
	int replyCount(int uNo);
	
	
	
}
