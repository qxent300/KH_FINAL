package com.kh.finalproject.bookboard.model.vo;

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
public class Like {
	private int lNo;
	private int bbNo;
	private int uNo;
	
	private String uNickName;
	
	private int lCheck;
	private String rStatus;
	private Date lDate;
}