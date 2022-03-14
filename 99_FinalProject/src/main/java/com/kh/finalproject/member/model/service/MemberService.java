package com.kh.finalproject.member.model.service;

import com.kh.finalproject.member.model.vo.Member;

public interface MemberService {

	Member login(String id, String pw);
	
	int save(Member member);
	
	int delete(Member member);
	
}
