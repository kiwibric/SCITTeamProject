package com.scit.test43.vo;

import lombok.Data;

@Data
public class CommentVO {
	private	String	cmt_id;
	private	String	subject;
	private	String	content;
	private	String	password;
	private	String	writer;
	private	String	target;
	private	int		hits;
	private	String	indate;
	
}
