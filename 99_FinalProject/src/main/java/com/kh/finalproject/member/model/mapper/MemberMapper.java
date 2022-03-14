package com.kh.finalproject.member.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.finalproject.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	
	Member selectMember(String id);
	
	int insertMember(Member member);
	
	int updateMember(Member member);
	
	int deleteMember(Member member);
	
}
