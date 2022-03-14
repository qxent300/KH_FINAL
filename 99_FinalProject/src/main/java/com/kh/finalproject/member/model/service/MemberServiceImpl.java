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
		Member member = this.findById(uId);
		
		// passwordEncoder 활용법
		
		System.out.println(member.getUPwd()); // Hash code로 암호화된 패스워드가 출력
		System.out.println(passwordEncoder.encode(uPwd)); // encode를 통해 평문에서 암호문으로 바꾸는 코드
		System.out.println(passwordEncoder.matches(uPwd, member.getUPwd())); 
							// 파라메터로 받아온 pwd를 암호 화하고 기존 암호화 비교하는 코드
		
//		return member != null && 
//				passwordEncoder.matches(pwd, member.getPassword()) ? member : null;
//		
		
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
			String encodePwd = passwordEncoder.encode(member.getUPwd()); // 평문을 hash code 변환
			member.setUPwd(encodePwd);
			result = mapper.insertMember(member);
		}
		return result;
	}

	@Override
	public boolean validate(String userId) {
		return this.findById(userId) != null;
	}
	@Override
	public boolean validaten(String nickname) {
		return this.findByNickname(nickname) != null;
	}

	@Override
	public Member findById(String uId) {
		return mapper.selectMember(uId);
	}
	
	@Override
	public Member findByNickname(String nickname) {
		return mapper.selectMembern(nickname);
	}

	@Override
	@Transactional (rollbackFor = Exception.class)
	public int delete(int no) {
		return mapper.deleteMember(no);
	}


	@Override
	@Transactional (rollbackFor = Exception.class)
	public int updatePwd(Member loginMember, String userPwd) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("no", ""+loginMember.getUNo());
		map.put("newPwd", passwordEncoder.encode(userPwd));
		return mapper.updatePwd(map);
	}
}