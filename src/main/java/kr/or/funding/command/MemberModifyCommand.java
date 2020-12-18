package kr.or.funding.command;

import org.springframework.web.multipart.MultipartFile;

import kr.or.funding.dto.MemberVO;



public class MemberModifyCommand {
	private String password;
	private String name;
	private String email;
	private MultipartFile picture; // 사진파일
	private String oldPicture; // 이전 사진 파일명
	private String uploadPicture;
	
	public MemberVO toParseMember() {
		
		MemberVO member = new MemberVO();
		member.setPassword(this.password);
		member.setName(this.name);
		member.setEmail(this.email);
		return member;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	public String getOldPicture() {
		return oldPicture;
	}
	public void setOldPicture(String oldPicture) {
		this.oldPicture = oldPicture;
	}
	public String getUploadPicture() {
		return uploadPicture;
	}
	public void setUploadPicture(String uploadPicture) {
		this.uploadPicture = uploadPicture;
	}

	@Override
	public String toString() {
		return "MemberModifyCommand [password=" + password + ", name=" + name + ", email=" + email + ", picture="
				+ picture + ", oldPicture=" + oldPicture + ", uploadPicture=" + uploadPicture + "]";
	}
	
	
	
	
}
