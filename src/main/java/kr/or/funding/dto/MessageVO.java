package kr.or.funding.dto;

import java.util.Date;

public class MessageVO {
	private int mno      ;
	private String receiver ;
	private String sender   ;
	private String mcontent ;
	private String status   ;
	private Date regdate;
	private String delete_dist;
	
	
	public String getDelete_dist() {
		return delete_dist;
	}
	public void setDelete_dist(String delete_dist) {
		this.delete_dist = delete_dist;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMcontent() {
		return mcontent;
	}
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
