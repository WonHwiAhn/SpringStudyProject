package com.naver.vo;

import java.sql.Date;

public class ReplyVO {
	private Integer rno;
	private Integer bno;
	private String replytext;
	private String replyer;
	
	private Date date;
	private Date updatedate;
	
	public ReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyVO(Integer rno, Integer bno, String replytext, String replyer, Date date, Date updatedate) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.replytext = replytext;
		this.replyer = replyer;
		this.date = date;
		this.updatedate = updatedate;
	}

	public Integer getRno() {
		return rno;
	}

	public void setRno(Integer rno) {
		this.rno = rno;
	}

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer + ", date="
				+ date + ", updatedate=" + updatedate + "]";
	}
}
