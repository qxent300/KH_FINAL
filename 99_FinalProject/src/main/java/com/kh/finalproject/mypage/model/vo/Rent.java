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
public class Rent {
	private int rNo;
	private int bNo;
	private int uNo;
	private Date startDate;
	private Date endDate;
	private String rStatus;
}
