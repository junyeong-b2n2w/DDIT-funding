package kr.or.funding.dto;

public class RewardItemVO {
	private int rino   ;
	private int rno    ;
	private String ritem  ;
	private String options;
	public int getRino() {
		return rino;
	}
	public void setRino(int rino) {
		this.rino = rino;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRitem() {
		return ritem;
	}
	public void setRitem(String ritem) {
		this.ritem = ritem;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	@Override
	public String toString() {
		return "RewardItemVO [rino=" + rino + ", rno=" + rno + ", ritem=" + ritem + ", options=" + options + "]";
	}
	
}
