package com.kh.finalproject.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int uNo;

	private String uId;

	private String uPwd;

	private String uGrade;

	private String uName;
	
	private String uNickName;

	private String uPhone;

	private String uAddress;

	private String uStatus;

	private Date uEnrollDate;

	private Date uModifyDate;
}
