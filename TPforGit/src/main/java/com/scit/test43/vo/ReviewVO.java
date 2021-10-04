package com.scit.test43.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private int rv_num;
	private String rv_target;
	private String rv_sender;
	private int rv_star;
	private String rv_review;
}
