package kr.or.funding.command;

public class SearchCriteria {
	
	private int page=1; // 페이지 번호
	private int perPageNum=16; // 한페이지당 리스트개수
	
	private int min_percent=0;
	private int max_percent=999999;
	private String fstatus = "";
	private String category = "";
	public String getFstatus() {
		return fstatus;
	}
	public void setFstatus(String fstatus) {
		this.fstatus = fstatus;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	private String searchType=""; // 검색구분
	private String keyword=""; //검색어
	
	public SearchCriteria() {}
	public SearchCriteria(int page, int perPageNum, String searchType, String keyword, int min_percent, int max_percent, String category ,String fstatus ) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.searchType = searchType;
		this.keyword = keyword;
		this.min_percent = min_percent;
		this.max_percent = max_percent;
		this.fstatus = fstatus;
		this.category = category;
	}
	public SearchCriteria(String page, String perPageNum, String searchType, String keyword ,String min_percent, String max_percent, String category ,String fstatus) {
		super();
		if(page!=null && !page.isEmpty())this.page = Integer.parseInt(page);
		if(perPageNum!=null && !perPageNum.isEmpty())this.perPageNum = Integer.parseInt(perPageNum);
		if(searchType!=null)this.searchType = searchType;
		if(keyword!=null)this.keyword = keyword;
		if(category!=null)this.category = category;
		if(fstatus!=null)this.fstatus = fstatus;
		if(min_percent!=null && !min_percent.isEmpty()) this.min_percent = Integer.parseInt(min_percent);
		if(max_percent!=null && !max_percent.isEmpty()) this.max_percent = Integer.parseInt(max_percent);
	}
	
	
	public int getMin_percent() {
		return min_percent;
	}
	public void setMin_percent(int min_percent) {
		this.min_percent = min_percent;
	}
	public int getMax_percent() {
		return max_percent;
	}
	public void setMax_percent(int max_percent) {
		this.max_percent = max_percent;
	}
	public int getPageStartRowNum(){ //각 페이지마다 시작하는 행번호
		return (this.page-1)*perPageNum;
	}
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setPage(String page) {
		if(page!=null && !page.isEmpty())
		this.page = Integer.parseInt(page);
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		if(perPageNum!=null && !perPageNum.isEmpty())
		this.perPageNum = Integer.parseInt(perPageNum);
	}

	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
}
