package com.kh.finalproject.member.model.service;

import com.kh.finalproject.member.model.vo.Member;

public interface MemberService {
	Member login(String U_ID, String U_Pw );
	int userEnroll(Member member);
	boolean checkID(String U_ID);
	boolean checkNickName(String U_NICKNAME);
	Member findById(String U_ID);
	int deleteUser(int no);
	String FindUserPwd(String U_ID, String U_NAME);
}
