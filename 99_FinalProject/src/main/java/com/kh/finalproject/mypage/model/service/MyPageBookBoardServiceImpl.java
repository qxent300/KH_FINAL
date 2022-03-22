package com.kh.finalproject.mypage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalproject.member.model.mapper.MemberMapper;
import com.kh.finalproject.member.model.vo.Member;
import com.kh.finalproject.mypage.model.mapper.MyPageBookMapper;
import com.kh.finalproject.mypage.model.vo.MyPageBookVo;
import com.kh.finalproject.mypage.model.vo.MyPagePagingVo;


@Service
public class MyPageBookBoardServiceImpl implements MyPageBookBoardService {

	@Autowired
    private MyPageBookMapper mapper;
	
	@Autowired
	private MemberMapper memberMapper;
 
	public List<MyPageBookVo> myPageBookBoardList(String nowPage, String cntPerPage, Member loginMember) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		MyPagePagingVo vo = new MyPagePagingVo();
		vo.calcStartEnd(Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		paramMap.put("start", vo.getStart());
		paramMap.put("end", vo.getEnd());
		paramMap.put("loginMember", loginMember);
        return mapper.myPageBookBoardList(paramMap);
    }
	
	@Override
	public int countBoard() {
		return mapper.countBoard();
	}

	@Override
	public List<MyPagePagingVo> selectBoard(MyPagePagingVo vo) {
		return mapper.selectBoard(vo);
	}

	@Override
	public int deleteMyPage(String no) {
		return mapper.deleteMyPage(no);
	}

	@Override
	public int myPageMemberUpdate(HttpServletRequest request) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("uId", request.getParameter("uId"));
		paramMap.put("uName", request.getParameter("uName"));
		paramMap.put("uNickName", request.getParameter("uNickName"));
		paramMap.put("uAddress", request.getParameter("uAddress"));
		paramMap.put("uPhone", request.getParameter("uPhone"));
		paramMap.put("uNo", request.getParameter("uNo"));
		
		
		
        return mapper.myPageMemberUpdate(paramMap);
	}
	
	
	@Override
	public Member memberData(String loginMember) {
		Member member = memberMapper.selectMember(loginMember);
		
//		Member member2 = new Member();
//		member2.setUNo(member.getUNo());
//		member2.setUId(member.getUId());
//		member2.setUName(member.getUName());
//		member2.setUNickName(member.getUNickName());
//		member2.setUAddress(member.getUAddress());
//		member2.setUPhone(member.getUPhone());
		
		return member;
	}
	
	@Override
	public int pwdUpdate(String str) {
		
		String[] strArr= str.split(",");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("UId",strArr[0]);
		paramMap.put("UPwd",strArr[1]);
		
		return mapper.pwdUpdate(paramMap);
	}
	
	@Override
	public String pwdSearch(String str) {
		String[] strArr= str.split(",");
		
		Member result = mapper.pwdSearch(String.valueOf(strArr[0]));
		String returnStr = result.getUPwd();
		
		return returnStr;
	}
	
	@Override
	public List<MyPageBookVo> myPageBookReply(String nowPage, String cntPerPage, String loginMember) {
		
		Map<String, Object> paramMap2 = new HashMap<String, Object>();
		
		MyPagePagingVo vo = new MyPagePagingVo();
		vo.calcStartEnd(Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		paramMap2.put("start", vo.getStart());
		paramMap2.put("end", vo.getEnd());
		paramMap2.put("loginMember", loginMember);
        return mapper.myPageBookReply(paramMap2);
	}
	
	@Override
	public Map<String, Object> replyMap(int uNo, int clickPage) {	
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int start = 1;
		int end = 5;
		
		if(clickPage > 1) {
			start = ((clickPage-1) * 5) + 1;
			end = clickPage * 5;
		}
		
		resultMap.put("uNo", uNo);
		resultMap.put("start", start);
		resultMap.put("end", end);
		List<Map<String, Object>> resultList = mapper.replyList(resultMap);
		
		int count = mapper.replyCount(uNo);
		
		resultMap.clear();
		resultMap.put("resultList", resultList);
		resultMap.put("count", count);
		
		return resultMap;
	}
	
}
