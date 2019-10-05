package com.academy.appl.admin.vo;

import lombok.Data;

@Data
public class JqgridQueryString {
	// 검색 쿼리
	private boolean _search; // 검색 요청 여부
	private String nd; //
	private int rows; // 몇 개씩
	private int page; // 페이지 수
	private String sidx;
	private String sord; // 정렬 방식 asc, desc
	private String searchField;
	private String searchString;
	private String searchOper;
	private String filters;
	
	private int total;
	private int records;

	private int rowStart;
	private int rowEnd;
	
	/*
	 * "total": 페이지수,"records":총 로우수,"page":현재 페이지,"rows": 데이터리스트 << 반환형식
	 * 요청변수 rows : 한페이지에 표시될 로우수, page: 현재 페이지, sidx : 정렬할 컬럼명, sord : 정렬방법(asc, desc)
	*/
}
