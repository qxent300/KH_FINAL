package com.kh.finalproject.mypage.model.service;

import com.kh.finalproject.member.model.vo.Member;

public interface MyPageService {
	Member login(String id, String pwd);

	int save(Member member);

	boolean validate(String userId);

	Member findById(String id);

	int delete(int no);

	int updatePwd(Member loginMember, String userPwd);
}
