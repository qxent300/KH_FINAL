package com.kh.finalproject.member.model.service;

import com.kh.finalproject.member.model.vo.Member;

public interface MemberService {

	Member login(String uId, String uPwd);
	
	int save(Member member);
	
	int delete(int uNo);

	Member findById(String uId);

	boolean validate(String uId);

	boolean validaten(String uNickName);

	int updatePwd(Member loginMember, String uPwd);

	Member findByNickname(String uNickName);

	String FindUserPwd(String uId, String uName);
}
