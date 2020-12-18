package kr.or.funding.dto;

import java.sql.Date;
import java.util.List;

public class FundingVO {
	private int fno       ;
	private String writer    ;
	private String title     ;
	private String content   ;
	private int price_goal;
	private int price_pre ;
	private Date regdate   ;
	private Date startdate ;
	private Date enddate   ;
	private String fstatus   ;
	private int fcount    ;
	private String tag       ;
	private String creater       ;
	private String furl       ;
	private String category;
	private String project_img;

	private List<RewardVO> rewardList;

	public String getProject_img() {
		return project_img;
	}
	public void setProject_img(String project_img) {
		this.project_img = project_img;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice_goal() {
		return price_goal;
	}
	public void setPrice_goal(int price_goal) {
		this.price_goal = price_goal;
	}
	public int getPrice_pre() {
		return price_pre;
	}
	public void setPrice_pre(int price_pre) {
		this.price_pre = price_pre;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getFstatus() {
		return fstatus;
	}
	public void setFstatus(String fstatus) {
		this.fstatus = fstatus;
	}
	public int getFcount() {
		return fcount;
	}
	public void setFcount(int fcount) {
		this.fcount = fcount;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getFurl() {
		return furl;
	}
	public void setFurl(String furl) {
		this.furl = furl;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public List<RewardVO> getRewardList() {
		return rewardList;
	}
	public void setRewardList(List<RewardVO> rewardList) {
		this.rewardList = rewardList;
	}
	
}
