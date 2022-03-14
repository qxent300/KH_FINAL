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
public class BookBoard {
	private int bbNo;
	private int bNo;
	private int uNo;
	
	// 도서 관련 parameter
	private String bName;
	private String bWriter;
	private String bImage;
	private String bCategory;
	private Date publishDate;
	
	// 사용자 관련 parameter
	private String uNickName;
	
	private String bbTitle;
	private String bbContent;
	private int bbReadCount;
	private int bbRecommendCount;
	private String bbStatus;
	private Date createDate;
	private Date modifyDate;
}
