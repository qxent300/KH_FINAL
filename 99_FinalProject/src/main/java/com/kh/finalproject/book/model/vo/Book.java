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
public class Book {
	private int bNo;
	private String bName;
	private String bWriter;
	private String bImage;
	private String bContent;
	private String bCategory;
	private Date publishDate;
	private int bRentCount;
	private float bAvgScore;
}
