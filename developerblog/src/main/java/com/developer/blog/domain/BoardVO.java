package com.developer.blog.domain;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter 
public class BoardVO implements Comparable<BoardVO> {
	
	private int bno;
	private String title, subheading, writer,category, content;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date reportingDate;
	
	private String formatDate;
	
	@Override
	public int compareTo(BoardVO o) {
		
		return o.getReportingDate().compareTo(getReportingDate());
	}
}
