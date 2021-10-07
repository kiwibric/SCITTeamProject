package com.scit.test43.vo;

import lombok.Data;

@Data
public class CommentReplyVO {
	private	String	reply_id;
	private	String	cmt_id;
	private	String	parent_id;
	private	String	depth;
	private	String	reply_content;
	private	String	reply_writer;
	private	String	reply_password;
	private	String	indate;
}
