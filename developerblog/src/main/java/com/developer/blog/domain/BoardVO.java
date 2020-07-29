package com.developer.blog.domain;


import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {

	String title, subheading, writer, content;
	Date reportingDate;
	
}
