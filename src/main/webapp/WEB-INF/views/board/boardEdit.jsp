<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top"/>
<link rel="stylesheet" href="/resources/css/board.css">
<script>
	$(function(){//수정글 유효성 체크
		$('#bf').submit(function(){
			if($('#name').val()==''||$('#name').val().trim()==''){
				alert("이름을 입력하세요");
				$('#name').focus();
				return false;
			}
			if($('#subject').val()==''||$('#subject').val().trim()==''){
				alert('제목을 입력하세요');
				$('#subject').focus();
				return false;
			}
			if($('#content').val()==''){
				alert('글내용을 입력하세요');
				$('#content').focus();
				return false;
			}
			if($('#bpwd').val()==''){
				alert('비밀번호를 입력하세요');
				$('#bpwd').focus();
				return false;
			}
			if($("input[name=secret]:radio:checked").length < 1){
				alert("공개글 여부를 체크하세요");	
				return false;
			}
			return true;
		})
	
	})//$()end-----------------
</script>



<div align="center" id="bbs" class="col-md-8 offset-md-2">
	<br><h1 class='text-center mt-5'>게시판 글 편집하기</h1><br>
		 <form name="bf" id="bf" role="form" action="write" method="POST" enctype="multipart/form-data">
	   <input type="hidden" name="mode" value="edit">
	   <input type="hidden" name="num" value="<c:out value='${board.num}'/>">
	    <!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->       
	    <table class="table">
	      	<tr>
				<td><!------------------- 문의유형 ------------------------------>  
					<c:if test="${board.bcg_code eq null or empty board.bcg_code}">
						<select class="select_code" name="bcg_code" style="padding: 6px;">
							<option value="" selected>:::문의 유형:::</option>
						</select>
					</c:if> 
						<c:if test="${board.bcg_code ne null or not empty board.bcg_code}">
							<select class="select_code" name="bcg_code" style="padding: 6px;">
								<option value="">:::문의 유형:::</option>
								<option value="1"
									<c:if test="${board.bcg_code==1}">selected</c:if>>회원정보
									문의</option>
								<option value="2"
									<c:if test="${board.bcg_code==2}">selected</c:if>>주문/결제
									문의</option>
								<option value="3"
									<c:if test="${board.bcg_code==3}">selected</c:if>>취소/환불
									문의</option>
								<option value="4"
									<c:if test="${board.bcg_code==4}">selected</c:if>>배송관련
									문의</option>
								<option value="5"
									<c:if test="${board.bcg_code==5}">selected</c:if>>시스템
									오류 제보</option>
								<option value="6"
									<c:if test="${board.bcg_code==6}">selected</c:if>>기타문의</option>
							</select>
						</c:if>
					</td>
	      		</tr>
			<!-- 작성자-------------------------->	      		
	      	<tr>
	          <td>
		          <input type="text" name="name" id="name"  maxlength="10"  placeholder="이름" value='<c:out value="${board.name}"/>' class="form-control">
	          </td>
	       </tr>
	       
	       <!-- 글제목---------------------------------- -->
	       <tr>
	          <td>
	          <input type="text" name="subject" id="subject" maxlength="30" placeholder="제목" value='<c:out value="${board.subject}"/>' class="form-control">
	          </td>
	       </tr>     
	        
	       <!-- 글내용---------------------------------- --> 
	       <tr>
	          <td>
	          <textarea name="content" id="content" placeholder="문의내용" maxlength="600" rows="10" cols="50" 
	              class="form-control">${board.content}</textarea>
	          </td>
	       </tr>
	      
	       <!-- 비밀번호---------------------------------- --> 
	       <tr>
	          <td>
	          <input type="password" name="passwd" id="bpwd" placeholder="비밀번호" maxlength="10"
	            class="form-control">
	          </td>
	      </tr>
	    
	     <!-- 파일첨부(기존의 저장된 파일이 있으면 해당 파일은 old_filename에 값 설정, 새롭게 올린 파일은 mfilename 값 설정 ---------------------------------- --> 
	      <tr>
	         <td>
		         <c:out value="${board.originFilename}"/>[<c:out value="${board.filesize}"/>bytes]<br>
		         <input type="file" name="mfilename" id="filename" class="form-control">
		          <input type="hidden" name="old_filename" value="<c:out value="${board.filename}"/>"> 
	         </td>  
	      </tr>
	      
	      <!-- 비밀글 체크여부------------------------ -->
	      <tr>
	    	  <td>
	    		  <input type="radio" name="secret" id="secret" value="Y" class="radio" /><span for="secret">공개</span>&nbsp;&nbsp;&nbsp;&nbsp;
	  			  <input type="radio" name="secret" id="secret" value="N" class="radio" /><span for="secret">비공개</span>&nbsp;
		 	  </td>
	      </tr>
	      
	      <!-- button------------------------- -->
	   	    <tr>
	         <td>
	            <button type="submit" id="btnWrite" class="btn btn-success">글수정</button>
	            <button type="reset" id="btnReset" class="btn btn-warning">다시쓰기</button>
	         </td>
	      </tr>
	      </table>
	   
	</form>       
</div>
<c:import url="/foot" />
