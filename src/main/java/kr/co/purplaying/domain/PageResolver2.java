package kr.co.purplaying.domain;

public class PageResolver2 {
  private SearchItem2 sc2;
  
  private int totalCnt;               // 게시물 총 갯수
//private int pageSize = 10;          // 1페이지에 나올 게시물 수
  public final int NAV_SIZE = 10;     // page naviation size
  
  private int totalPage;              // 전체 페이지 갯수
//private int page;                   // 현재 페이지
  
  private int beginPage;              // 화면에 보여줄 첫 페이지
  private int endPage;                // 화면에 보여줄 마지막 페이지
  private boolean showNext = false;   // 이후를 보여줄지 여부 (endPage == totalPage 이면 showNext는 false;)
  private boolean showPrev = false;   // 이전을 보여줄지 여부  (beginPage == 1이 아니면 showPrev는 true;)
  
  
  public PageResolver2(int totalCnt, int page) {
      this(totalCnt, new SearchItem2(page, 10));
  }
  
  
  public PageResolver2(int totalCnt, Integer page, int pageSize) {
      this(totalCnt, new SearchItem2(page, pageSize));
  }
  
  public PageResolver2(int totalCnt, SearchItem2 sc2) {
      this.totalCnt = totalCnt;
      this.sc2 = sc2;
      
      doPaging(totalCnt, sc2);
  }
  
  public void doPaging(int totalCnt, SearchItem2 sc2) {
      this.totalPage = totalCnt / sc2.getPageSize() + (totalCnt % sc2.getPageSize() == 0 ? 0 : 1); //전체 페이지 갯수
      this.sc2.setPage(Math.min(sc2.getPage(), totalPage)); // page가 totalPage보다는 크지 않음
      this.beginPage = (this.sc2.getPage()-1) / NAV_SIZE * NAV_SIZE + 1;
      this.endPage =  Math.min(this.beginPage + this.NAV_SIZE - 1, totalPage);
      this.showPrev = (beginPage != 1);
      this.showNext = endPage != totalPage;
  }



  public void print() {
      System.out.println("page = "+ sc2.getPage());
      System.out.print(showPrev ? "PREV " : "");
      
      for(int i = beginPage; i <= endPage; i++) {
          System.out.print(i + " ");
      }
      
      System.out.println(showNext ? " NEXT" : "");

  }


  @Override
  public String toString() {
      return "PageResolver [sc=" + sc2 + ", totalCnt=" + totalCnt + ", totalPage=" + totalPage + ", beginPage="
              + beginPage + ", endPage=" + endPage + ", showNext=" + showNext + ", showPrev=" + showPrev + "]";
  }

  

  public SearchItem2 getSc() {
      return sc2;
  }


  public void setSc2(SearchItem2 sc2) {
      this.sc2 = sc2;
  }


  public int getTotalCnt() {
      return totalCnt;
  }


  public void setTotalCnt(int totalCnt) {
      this.totalCnt = totalCnt;
  }


//public int getPageSize() {
//    return pageSize;
//}
//
//
//public void setPageSize(int pageSize) {
//    this.pageSize = pageSize;
//}


  public int getTotalPage() {
      return totalPage;
  }


  public void setTotalPage(int totalPage) {
      this.totalPage = totalPage;
  }


//public int getPage() {
//    return page;
//}
//
//
//public void setPage(int page) {
//    this.page = page;
//}


  public int getBeginPage() {
      return beginPage;
  }


  public void setBeginPage(int beginPage) {
      this.beginPage = beginPage;
  }


  public int getEndPage() {
      return endPage;
  }


  public void setEndPage(int endPage) {
      this.endPage = endPage;
  }


  public boolean isShowNext() {
      return showNext;
  }


  public void setShowNext(boolean showNext) {
      this.showNext = showNext;
  }


  public boolean isShowPrev() {
      return showPrev;
  }


  public void setShowPrev(boolean showPrev) {
      this.showPrev = showPrev;
  }


  public int getNAV_SIZE() {
      return NAV_SIZE;
  }
	
}
