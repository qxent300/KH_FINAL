package com.kh.finalproject.mypage.model.vo;

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
public class Library {
	private int no;
	private String name;
	private String address;
	private String lat;
	private String lng;
}
