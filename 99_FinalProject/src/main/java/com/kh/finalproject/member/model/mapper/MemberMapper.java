package com.kh.finalproject.member.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.finalproject.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	
	Member selectMember(@Param("uId") String uId);
	
	Member selectMembern(@Param("uNickName") String uNickName);
	
	int insertMember(Member member);
	
	int updateMember(Member member);
	
	int deleteMember(@Param("uNo") int uNo);

	int updatePwd(Map<String, String> map);

	String FindUserPwd(@Param("uId") String uId,@Param("uName") String uName);
}
