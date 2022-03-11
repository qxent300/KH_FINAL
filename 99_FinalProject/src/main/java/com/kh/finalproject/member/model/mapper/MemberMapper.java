package com.kh.finalproject.member.model.mapper;

import com.kh.finalproject.member.model.vo.Member;

public interface MemberMapper {
	int insertUser(Member member);
	int updateUser(Member member);
	Member findById(String U_ID);
	Member findByNickName(String U_NICKNAME);
	int deleteUser(int U_NO);
	String FindUserPwd(String U_ID, String U_NAME);

}
