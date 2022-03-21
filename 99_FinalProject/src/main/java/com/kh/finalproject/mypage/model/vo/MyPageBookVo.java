package com.kh.finalproject.mypage.model.vo;

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
public class MyPageBookVo {
	
	private int no;
	
	private int BBNO;
	
	private int BNO;
	
	private int UNO;
	
	private String BBTITLE;
	
	private String BBCONTENT;
	
	private int BBREADCOUNT;
	
	private int BBRECOMMENDCOUNT;
	
	private String BBSTATUS;
	
	private Date CREATEDATE;
	
	private Date MODIFYDATE;
	
	private String BNAME;
	
	private int RN;

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
	
	private int RNO;
	
	private int FBNO;
	
	private String RCONTENT;
	
	private String RSTATUS;
	
	private String FBCATEGORY;
	
	private String FBTITLE;
	
	private String FBCONTENT;
	
	private int FBREADCOUNT;
	
	private int FBREPLYCOUNT;
	
	private String FBSTATUS;
	
	
	
	
	

}
