package kr.or.funding.command;

public class RewardCommand {
	private int[] itemcnt;
	private int[] rprice;
	private int[] rcount;
	private String[] options;
	private String[] ritem;
	public String[] getOptions() {
		return options;
	}
	public void setOptions(String[] options) {
		this.options = options;
	}
	public String[] getRitem() {
		return ritem;
	}
	public void setRitem(String[] ritem) {
		this.ritem = ritem;
	}
	public int[] getItemcnt() {
		return itemcnt;
	}
	public void setItemcnt(int[] itemcnt) {
		this.itemcnt = itemcnt;
	}
	public int[] getRprice() {
		return rprice;
	}
	public void setRprice(int[] rprice) {
		this.rprice = rprice;
	}
	public int[] getRcount() {
		return rcount;
	}
	public void setRcount(int[] rcount) {
		this.rcount = rcount;
	}
	
}
