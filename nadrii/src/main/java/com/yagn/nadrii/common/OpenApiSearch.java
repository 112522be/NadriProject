package com.yagn.nadrii.common;


public class OpenApiSearch {
	
	///Field
	private int pageNo;
	// listTicket 에서 4가지 정렬방식 (A=제목순, B=조회순, C=수정일순, D=생성일순)
	private String searchCondition;
	private String searchKeyword;
	private int numOfRows;
	//==> 리스트화면 currentPage에 해당하는 회원정보를 ROWNUM 사용 SELECT 위해 추가된 Field                   
	//==> UserMapper.xml 의                                                              
	//==> <select  id="getUserList"  parameterType="search"	resultMap="userSelectMap">  
	//==> 참조                                                                            
	private int endRowNum;
	private int startRowNum;
    
	///Constructor
	public OpenApiSearch() {
	}
	
	///Method
	public int getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(int numOfRows) {
		this.numOfRows = numOfRows;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	//==> Select Query 시 ROWNUM 마지막 값 
	public int getEndRowNum() {
		return getPageNo()*getNumOfRows();
	}
	//==> Select Query 시 ROWNUM 시작 값   
	public int getStartRowNum() {
		return (getPageNo()-1)*getNumOfRows()+1;
	}


	@Override
	public String toString() {
		return "OpenApiSearch [pageNo=" + pageNo + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", numOfRows=" + numOfRows + ", endRowNum=" + endRowNum + ", startRowNum="
				+ startRowNum + "]";
	}

	
	
	

}