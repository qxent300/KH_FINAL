package com.kh.finalproject.member.model.service;

import com.kh.finalproject.member.model.vo.Member;

public interface MemberService {
	Member login(String id, String pwd);

	int save(Member member);

	boolean validate(String userId);

	Member findById(String id);

	int delete(int no);

	int updatePwd(Member loginMember, String userPwd);

	Member findByNickname(String nickname);

	boolean validaten(String nickname);
}
