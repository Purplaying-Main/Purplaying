package kr.co.purplaying.domain;

import org.springframework.web.util.UriComponentsBuilder;
import static java.util.Objects.requireNonNullElse;
import static java.lang.Math.*;

public class SearchItem2 {
	
	public static final int DEFAULT_PAGE_SIZE = 6;
	public static final int MIN_PAGE_SIZE = 5;
	public static final int MAX_PAGE_SIZE = 50;
	
	
	private Integer page = 1;
	private Integer pageSize = DEFAULT_PAGE_SIZE;
	private String keyword = "";
	private Integer offset;
	
	public SearchItem2() {
		// TODO Auto-generated constructor stub
	}

	public SearchItem2(Integer page, Integer pageSize) {
		this(page, pageSize, "");
	}
	
	
	public SearchItem2(Integer page, Integer pageSize, String keyword) {
		//super();
		this.page = page;
		this.pageSize = pageSize;
		this.keyword = keyword;
	}
	
	
	public String getQueryString() {
		return getQueryString(page);
	}
	
	// uri? // ?page=10
	public String getQueryString(Integer page) {
		return UriComponentsBuilder.newInstance().queryParam("page", page)
												 .build().toString();
	}
	

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = requireNonNullElse(pageSize, DEFAULT_PAGE_SIZE);
		
		//	MIN_PAGE_SIZE <=  pageSize <= MAX_PAGE_SIZE
		this.pageSize = max(MIN_PAGE_SIZE, min(this.pageSize, MAX_PAGE_SIZE));
	}


	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getOffset() {
	    int result = (page-1) * pageSize; // offset => 변경
        if(result <0) {result= 0;}
        return result;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	@Override
	public String toString() {
		return "SearchItem2 [page=" + page + ", pageSize=" + pageSize + ",keyword=" + keyword
				+ ", offset=" + offset + "]";
	}
	
	
	
	
}
