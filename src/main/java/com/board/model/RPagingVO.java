package com.board.model;



import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
public class RPagingVO {
	private int rpage;
	private int rpageSize = 15;
	private int totalRCount;
	private int pageRCount;
	
	private int begin;
	private int last;
	
	private int rpagingBlock =10;
	private int prevRBlock;
	private int nextRBlock;
	
	private String findType;
	private String findType2;
	private String findKeyword;
	
	
	public void init(HttpSession ses) {
		if(ses!=null) {
			ses.setAttribute("pageSize", rpageSize);
		}
		log.info("1. RPagingVO totalCount======================="+rpageSize);
		log.info("1. RPagingVO totalCount======================="+totalRCount);
		pageRCount = (totalRCount - 1) / rpageSize + 1;
		
		if(rpage<1) {
			rpage=1;
		}
		if(rpage>pageRCount) {
			rpage=pageRCount;
		}
		
		
		begin = (rpage-1)*rpageSize;
		last = begin+(rpageSize+1);
		
		prevRBlock=(rpage-1)/rpagingBlock * rpagingBlock;
		nextRBlock=prevRBlock+(rpagingBlock+1);
		
	}
	
	public String getRPageNavi(String myctx,String loc, String userAgent) {
		
		if(findType==null) {
			findType="";
			findKeyword="";
		}else {
			if(userAgent.indexOf("MSIE")>-1||userAgent.indexOf("Trident")>-1) {
				try {
					findKeyword=URLEncoder.encode(findKeyword,"UTF-8");
				} catch (UnsupportedEncodingException e) {
					System.out.println(e);
				}
			}
		}
		
		if(findType2==null) findType2="";
		
		String str="";
		String link=myctx+"/"+loc;
		String qStr="?pageSize="+rpageSize+"&findType="+findType+"&findType2="+findType2;
				qStr+="&findKeyword"+findKeyword;
		link+=qStr;
		StringBuilder buf=new StringBuilder();
		buf.append("<ul class='pagination justify-content-center'>");
		if(prevRBlock>0) {
			buf.append("<li class='page-item>")
				.append("<a class='page-link' href='"+link+"&cpage="+prevRBlock+"'>")
				.append("Prev")
				.append("</a>")
				.append("</li>");
		}
		for(int i=prevRBlock+1;i<nextRBlock && i<=pageRCount;i++) {
			String css=(i==rpage)?" active":"";
			
			buf.append("<li class='page-item "+css+"'>")
				.append("<a class='page-link' href='"+link+"&cpage="+i+"'>")
				.append(i)
				.append("</a>")
				.append("</li>");	
		}	
		if(nextRBlock<=pageRCount) {
			buf.append("<li class='page-item'>")
			.append("<a class='page-link' href='"+link+"&cpage="+nextRBlock+"'>")
			.append("Next")
			.append("</a>")
			.append("</li>");	
		}
		buf.append("</ul>");
		str=buf.toString();
		return str;
	}
	
}
