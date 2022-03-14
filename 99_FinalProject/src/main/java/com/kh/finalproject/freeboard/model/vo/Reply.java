package com.kh.finalproject.freeboard.model.vo;

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
public class Reply {
	private int rNo;
	private int fbNo;
	private int uNo;
	
	private String uNickName;
	
	private String rContent;
	private String rStatus;
	private Date createDate;
	private Date modifyDate;
}
