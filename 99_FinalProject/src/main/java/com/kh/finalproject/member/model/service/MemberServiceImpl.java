package com.kh.finalproject.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.member.model.mapper.MemberMapper;
import com.kh.finalproject.member.model.vo.Member;

public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	
	private BCryptPasswordEncoder passwordEncoder; // SHA-256 Hashcode 알고리즘(일방향 암호)
	
	@Override
	public Member login(String U_ID, String U_Pw) {
		Member member = this.findById(U_ID);
		return member != null && 
				passwordEncoder.matches(U_Pw, member.getU_PW()) ? member : null;
		
	}

	@Override
	@Transactional (rollbackFor = Exception.class)
	public int userEnroll(Member member) {
		int result = 0;
		if(member.getU_NO() != 0) {
			result = mapper.updateUser(member);
		}else {
			String encodePwd = passwordEncoder.encode(member.getU_PW());
			member.setU_PW(encodePwd);
			result = mapper.insertUser(member);
		}
		return result;
	}


	@Override
	public boolean checkID(String U_ID) {
		return this.findById(U_ID) != null;
	}

	@Override
	public boolean checkNickName(String U_NICKNAME) {
		return this.findByNickName(U_NICKNAME) != null;
	}

	@Override
	public Member findById(String U_ID) {
		return mapper.findById(U_ID);
	}
	public Member findByNickName(String U_NICKNAME) {
		return mapper.findByNickName(U_NICKNAME);
	}

	@Override
	@Transactional (rollbackFor = Exception.class)
	public int deleteUser(int no) {
		return mapper.deleteUser(no);
	}

	@Override
	public String FindUserPwd(String U_ID, String U_NAME) {
		return mapper.FindUserPwd(U_ID, U_NAME);
	}


}
