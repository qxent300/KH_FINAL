package com.kh.finalproject.member.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int U_NO;
	private String U_ID;
	private String U_PW;
	private String U_NAME;
	private String U_NICKNAME;
	private String U_ADDRESS;
	private String U_PHONE;
	private String U_STATUS;

	
}
