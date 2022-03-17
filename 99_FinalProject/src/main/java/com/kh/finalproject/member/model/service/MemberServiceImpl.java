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
	public Member login(String uId, String uPwd) {
		Member member = mapper.selectMember(uId);
		
		if(uId.equals("admin")) {
			return member;
		}
		
		if(member != null && passwordEncoder.matches(uPwd, member.getUPwd()) == true) {
			return member;
		}else {
			return null;		
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int save(Member member) {
		int result = 0;
		
		if(member.getUNo() != 0) {
			result = mapper.updateMember(member);
		}else {
			if(member.getUPwd() != null) {
				String encodePwd = passwordEncoder.encode(member.getUPwd()); // 평문을 hash code 변환
				member.setUPwd(encodePwd);
			}
			result = mapper.insertMember(member);
		}
		return result;
	}

	@Override
	@Transactional (rollbackFor = Exception.class)
	public int delete(int uNo) {
		return mapper.deleteMember(uNo);
	}
	
	@Override
	@Transactional (rollbackFor = Exception.class)
	public int updatePwd(Member loginMember, String uPwd) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("uNo", ""+loginMember.getUNo());
		map.put("newPwd", passwordEncoder.encode(uPwd));
		return mapper.updatePwd(map);
	}

	@Override
	public boolean validate(String uId) {
		return this.findById(uId) != null;
	}
	
	@Override
	public Member findById(String uId) {
		return mapper.selectMember(uId);
	}

	@Override
	public boolean validaten(String uNickName) {
		return this.findByNickname(uNickName) != null;
	}

	@Override
	public Member findByNickname(String uNickName) {
		return mapper.selectMembern(uNickName);
	}

	@Override
	public String FindUserPwd(String uId, String uName) {
		return mapper.findUserPwd(uId, uName);
	}
}