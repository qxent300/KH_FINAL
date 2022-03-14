package com.kh.finalproject.freeboard.model.vo;

import java.util.Date;
import java.util.List;

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
public class FreeBoard {
	private int fbNo;
	private int uNo;
	
	private String uNickName;
	
	private String fbCategory;
	private String fbTitle;
	private String fbContent;
	private String originalFileName;
	private String renamedFileName;
	private int fbReadCount;
	private int fbReplyCount;
	private List<Reply> replies;
	private String fbStatus;
	private Date createDate;
	private Date modifyDate;
}
