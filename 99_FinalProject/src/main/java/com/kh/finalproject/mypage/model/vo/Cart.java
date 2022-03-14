package com.kh.finalproject.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Cart {
	private int cNo;
	private int bNo;
	
	private String bName;
	private String bWriter;
	private String bImage;
	private Date publishDate;
	
	private int uNo;

	private String uId;
	private String uName;
	private String uAddress;
	private String uPhone;
}
