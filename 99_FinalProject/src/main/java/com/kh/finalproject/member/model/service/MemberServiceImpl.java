package com.kh.finalproject.member.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.member.model.mapper.MemberMapper;
import com.kh.finalproject.member.model.vo.Member;

@Service 
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; // SHA-256 Hash code 알고리즘 (일반향 암호)

	@Override
	public Member login(String id, String pw) {
		Member member = mapper.selectMember(id);
		
		if (member.getUPw().equals(pw)) {
			return member;
		} else {
			return null;			
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int save(Member member) {
		int result = 0;
		
		if (member.getUNo() != 0) {
			result = mapper.updateMember(member);
		} else {
			result = mapper.insertMember(member);	// 회원가입시 비밀번호 암호화 필요..
		}
		
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int delete(Member member) {
		return mapper.deleteMember(member);
	}

	

}