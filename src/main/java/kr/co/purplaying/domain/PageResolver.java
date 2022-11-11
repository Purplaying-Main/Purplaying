package kr.co.purplaying.domain;

public class PageResolver {

	private int totalCnt;				//게시물 총 갯수
	private int pageSize = 10;			//한 페이지당 게시물 갯수
	public final int NAV_SIZE = 5;		//page navigation size
	
	private int totalPage;				//전체 페이지 갯수
	private int page;					//현제 페이지
	
	private int beginPage;				//화면에 보여줄 첫 페이지	
	private int endPage;				//화면에 보여줄 마지막 페이지
	private boolean showNext = false;	//이후를 보여줄지 여부 (endPage==totalPage 이면 showNext는 false)
	private boolean showPrev = false;	//이전을 보여줄지 여부 (beginPage == 1 이면 showPrev false)
	
	
	public PageResolver(int totalCnt, int page) {
		this(totalCnt, page, 10);
	}
	
	public PageResolver(int totalCnt, int page, int pageSize) {
		this.totalCnt = totalCnt;
		this.pageSize = pageSize;
		this.page = page;
		
		//this.totalPage = (totalCnt%pageSize == 0 ? totalCnt/pageSize : totalCnt/pageSize+1);		//전체 페이지 갯수
		this.totalPage = (int)Math.ceil(totalCnt/(double)pageSize);		//전체 페이지 갯수
		this.beginPage = (page-1) / NAV_SIZE * NAV_SIZE + 1 ;
		this.endPage = Math.min(this.beginPage + this.NAV_SIZE - 1, totalPage);
		this.showPrev = beginPage != 1;
		this.showNext = endPage != totalPage;
		
		
	}
	
	public void print() {
		System.out.println("page = "+page);
		System.out.print(showPrev ? "PREV " : "");
        for (int i=beginPage; i<=endPage; i++) {
            System.out.print(i + " ");
        }
        System.out.println(showNext ? " Next" : "");
    }

    @Override
    public String toString() {
        return "PageResolver [totalCnt=" + totalCnt + ", pageSize=" + pageSize + ", NAV_SIZE=" + NAV_SIZE
                + ", totalPage=" + totalPage + ", page=" + page + ", beginPage=" + beginPage + ", endPage=" + endPage
                + ", showNext=" + showNext + ", showPrev=" + showPrev + "]";
    }

	public int getTotalCnt() {
		return totalCnt;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getNAV_SIZE() {
		return NAV_SIZE;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getPage() {
		return page;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public boolean isShowPrev() {
		return showPrev;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}
    
	
    
	
}
