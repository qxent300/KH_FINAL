package com.kh.finalproject.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Member {
	private int uNo;
	private String uId;
	private String uPwd;
	private String uName;
	private String uNickName;
	private String uAddress;
	private String uPhone;
	private int uGrade;
	private String uStatus;
	private Date uEnrollDate;
	private Date uModifyDate;
}
