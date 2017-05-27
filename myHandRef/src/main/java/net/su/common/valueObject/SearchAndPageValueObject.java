package net.su.common.valueObject;

public class SearchAndPageValueObject {

	//검색용 변수
	private String searchBgnDe = "";//검색 시작일

	private String searchEndDe = "";//검색 종료일
	
	private String searchCnd = "";//검색 조건
	
	private String searchWrd = "";//검색 단어
	
	//페이징용 변수
	private int currentPageNo = 1;//현재 페이지 번호
	
	private int recordCountPerPage = 10;//한 페이지당 게시되는 게시물 건 수 //
	
	private int pageSize = 5;//페이지 리스트에 게시되는 페이지 건 수
	
	private int totalRecordCount = 0;//전체 게시물 건 수
	
	private int totalPageCount = 0;//전체 페이지 개수
	
	private int firstRecordIndex = 0;//첫 페이지 인덱스 번호(글 번호) //
	
	private int lastRecordIndex = 0;//마지막 페이지 인덱스 번호(글 번호)
	
	private int firstPageNoOnPageList = 1; //페이지 리스트의 첫 페이지 번호
	
	private int lastPageNoOnPageList = 1;//페이지 리스트의 마지막 페이지 번호

	
	
	public String getSearchBgnDe() {
		return searchBgnDe;
	}

	public void setSearchBgnDe(String searchBgnDe) {
		this.searchBgnDe = searchBgnDe;
	}

	public String getSearchEndDe() {
		return searchEndDe;
	}

	public void setSearchEndDe(String searchEndDe) {
		this.searchEndDe = searchEndDe;
	}

	public String getSearchCnd() {
		return searchCnd;
	}

	public void setSearchCnd(String searchCnd) {
		this.searchCnd = searchCnd;
	}

	public String getSearchWrd() {
		return searchWrd;
	}

	public void setSearchWrd(String searchWrd) {
		this.searchWrd = searchWrd;
	}
////
	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		totalPageCount = ((getTotalRecordCount()-1)/getRecordCountPerPage()) + 1;
		return totalPageCount;
	}

//	public void setTotalPageCount(int totalPageCount) {
//		this.totalPageCount = totalPageCount;
//	}

	public int getFirstRecordIndex() {
		firstRecordIndex = (getCurrentPageNo() - 1) * getRecordCountPerPage();
		return firstRecordIndex;
	}

//	public void setFirstRecordIndex(int firstRecordIndex) {
//		this.firstRecordIndex = firstRecordIndex;
//	}
	
	// 마지막 페이지 인덱스 번호(글 번호)
	public int getLastRecordIndex() {
		lastRecordIndex = getCurrentPageNo() * getRecordCountPerPage();
		return lastRecordIndex;
	}

//	public void setLastRecordIndex(int lastRecordIndex) {
//		this.lastRecordIndex = lastRecordIndex;
//	}
	
	//페이지 리스트의 첫 페이지 번호
	public int getFirstPageNoOnPageList() {
		firstPageNoOnPageList = ((getCurrentPageNo()-1)/getPageSize())*getPageSize() + 1;
		return firstPageNoOnPageList;
	}

//	public void setFirstPageNoOnPageList(int firstPageNoOnPageList) {
//		this.firstPageNoOnPageList = firstPageNoOnPageList;
//	}

	public int getLastPageNoOnPageList() {
		lastPageNoOnPageList = getFirstPageNoOnPageList() + getPageSize() - 1;		
		if(lastPageNoOnPageList > getTotalPageCount()){
			lastPageNoOnPageList = getTotalPageCount();
		}
		return lastPageNoOnPageList;
	}

//	public void setLastPageNoOnPageList(int lastPageNoOnPageList) {
//		this.lastPageNoOnPageList = lastPageNoOnPageList;
//	}
	
}
