package kr.or.funding.dto;

public class SaleLogVO {
	private int sno    ;
	private String email  ;
	private int rno    ;
	private int fno    ;
	private int sprice ;
	private String sstatus;
	private String address;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
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
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public String getSstatus() {
		return sstatus;
	}
	public void setSstatus(String sstatus) {
		this.sstatus = sstatus;
	}
	@Override
	public String toString() {
		return "SaleLogVO [sno=" + sno + ", email=" + email + ", rno=" + rno + ", fno=" + fno + ", sprice=" + sprice
				+ ", sstatus=" + sstatus + "]";
	}
	
	
	
}
