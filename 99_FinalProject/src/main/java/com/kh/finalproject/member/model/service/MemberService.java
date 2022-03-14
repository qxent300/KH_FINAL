package com.kh.finalproject.member.model.service;

import com.kh.finalproject.member.model.vo.Member;

public interface MemberService {

	Member login(String uId, String uPw);
	
	int save(Member member);
	
	int delete(Member member);
	
}
