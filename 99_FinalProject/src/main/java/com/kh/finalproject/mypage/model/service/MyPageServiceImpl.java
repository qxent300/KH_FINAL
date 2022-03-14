package com.kh.finalproject.mypage.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.member.model.mapper.MemberMapper;
import com.kh.finalproject.member.model.service.MemberService;
import com.kh.finalproject.member.model.vo.Member;

public class MyPageServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder; // SHA-256 Hash code 알고리즘 (일반향 암호)

	@Override
	public Member login(String id, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int save(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean validate(String userId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Member findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePwd(Member loginMember, String userPwd) {
		// TODO Auto-generated method stub
		return 0;
	}


}
