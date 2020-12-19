package kr.or.funding.dto;

import java.util.List;

public class RewardVO {
	private int rno     ;
	private int fno     ;
	private int rprice  ;
	private int rcount  ;
	private int subcount;
	private int itemcnt;
	private List<RewardItemVO> rItemList;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getRprice() {
		return rprice;
	}
	public void setRprice(int rprice) {
		this.rprice = rprice;
	}
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public int getSubcount() {
		return subcount;
	}
	public void setSubcount(int subcount) {
		this.subcount = subcount;
	}
	public int getItemcnt() {
		return itemcnt;
	}
	public void setItemcnt(int itemcnt) {
		this.itemcnt = itemcnt;
	}
	public List<RewardItemVO> getrItemList() {
		return rItemList;
	}
	public void setrItemList(List<RewardItemVO> rItemList) {
		this.rItemList = rItemList;
	}
	@Override
	public String toString() {
		return "RewardVO [rno=" + rno + ", fno=" + fno + ", rprice=" + rprice + ", rcount=" + rcount + ", subcount="
				+ subcount + ", itemcnt=" + itemcnt + ", rItemList=" + rItemList + "]";
	}
	
}
