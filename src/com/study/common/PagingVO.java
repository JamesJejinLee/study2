package com.study.common;
//공통이니까 하나의 파일을 만든거고 , 목록쪽에서 돌아가는건 searchvo라고 만들고 상속받아서 ....? 추가?
public class PagingVO {
	private int totalRowCount;  // 총 레코드 갯수
	private int totalPageCount; // 총 페이지 갯수
	private int listSize;		  // 화면당 레코드 갯수
	private int startRow;  	  // (페이지내) 시작 로우
	private int endRow;		  // (페이지내) 마지막 로우
	
	private int startPage;		
	private int endPage;		
	private int pageSize;			//총페이지가 몇장으로 할껀지
	private int currentPage;	  // 현재 페이지
	
//	public void setting(int rowCount) {
//		totalRowCount = rowCount;  //DB 레코드 전체 갯수 = 403
//		if(currentPage < 1) currentPage = 1;   // 현재 페이지 = 2
//		if(listSize < 1) listSize = 10;		   // 한페이지당 10개씩 나오게
//		if(pageSize < 1) pageSize = 10;			// 페이지를 10개씩 나오게 
//		
//		totalPageCount = (this.totalRowCount - 1) / listSize + 1;   // 41개
//		startRow = (currentPage - 1) * listSize;
//		endRow = startRow + listSize;
//	}
	
	public void setting(int rowCount) {
		
		totalRowCount = rowCount;
		if(currentPage < 1) currentPage = 1;
		if(listSize < 1) listSize = 10;
		if(pageSize < 1) pageSize = 10;
		
		totalPageCount = (this.totalRowCount - 1) / listSize + 1;
		startRow = (currentPage - 1) * listSize + 1;
		endRow = startRow + listSize;
		
		/*
		 *  전체 레코드 갯수 : 384 
			전체 페이지 갯수 : 39 
			시작 페이지 : 1 
			마지막 페이지 : 10 
			페이지 사이즈 : 10 
			현재 페이지 : 1 
		 * 
		 * 
		 * 	전체 레코드 갯수 : ${search.totalRowCount } <br/> 
			전체 페이지 갯수 : ${search.totalPageCount } <br/>
			시작 페이지 : ${search.startPage} <br/>
			마지막 페이지 : ${search.endPage} <br/>
			페이지 사이즈 : ${search.pageSize} <br/>
			현재 페이지 : ${search.currentPage} <br/>
		 * 
		 * 
		 * */
		
		
		//currentPage : 1 ~ 10     11 ~ 20      21 ~ 30		31 ~ 33
		//startPage   : 1          11           21			31
		//endPage     : 10         20           30			40
		
			startPage = ((currentPage - 1) / pageSize) * pageSize + 1;
			endPage = startPage + pageSize - 1;
		
			if(endPage > totalPageCount) {
				endPage = totalPageCount;
			}
		}
	
		public int getTotalRowCount() {
			return totalRowCount;
		}

		public void setTotalRowCount(int totalRowCount) {
			this.totalRowCount = totalRowCount;
		}

		public int getTotalPageCount() {
			return totalPageCount;
		}

		public void setTotalPageCount(int totalPageCount) {
			this.totalPageCount = totalPageCount;
		}

		public int getListSize() {
			return listSize;
		}

		public void setListSize(int listSize) {
			this.listSize = listSize;
		}

		public int getStartRow() {
			return startRow;
		}

		public void setStartRow(int startRow) {
			this.startRow = startRow;
		}

		public int getEndRow() {
			return endRow;
		}

		public void setEndRow(int endRow) {
			this.endRow = endRow;
		}

		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public int getPageSize() {
			return pageSize;
		}

		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}

		public int getCurrentPage() {
			return currentPage;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

}

