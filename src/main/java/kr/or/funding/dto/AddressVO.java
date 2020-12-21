package kr.or.funding.dto;

public class AddressVO {
	private int ano;
	private int post;
	private String addr1;
	private String addr2;
	private String de_Addr;
	private String re_Addr;
	private String email;
	private String alias;
	
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDe_Addr() {
		return de_Addr;
	}
	public void setDe_Addr(String de_Addr) {
		this.de_Addr = de_Addr;
	}
	public String getRe_Addr() {
		return re_Addr;
	}
	public void setRe_Addr(String re_Addr) {
		this.re_Addr = re_Addr;
	}
	
	@Override
	public String toString() {
		return "AddressVO [ano=" + ano + ", post=" + post + ", addr1=" + addr1 + ", addr2=" + addr2 + ", de_Addr="
				+ de_Addr + ", re_Addr=" + re_Addr + ", email=" + email + "]";
	}
}
