package com.kh.finalproject.book.model.vo;

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
public class Score {
	private int sNo;
	private int bNo;
	private int uNo;
	private String sContent;
	private Date createDate;
	private int score;
}
