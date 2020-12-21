package kr.or.funding.dto;

public class WishListVO {

	private int wno;
	private String email;
	private int fno;
	public int getWno() {
		return wno;
	}
	@Override
	public String toString() {
		return ""+fno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	
	
}
