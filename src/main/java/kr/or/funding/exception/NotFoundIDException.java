package kr.or.funding.exception;

public class NotFoundIDException extends Exception {
	
	public NotFoundIDException() {
		super("아이디를 찾을수가 없습니더.");
	}
}
