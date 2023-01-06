<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  ---------------------------------------------------------- -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- function taglib------------------------------------------- -->


<c:import url="/top" />

<style>
	#boardBody>tr>td:nth-child(5n+2) {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	img#secret {
		width:15px;
		height:15px;
	}
	a[href] { 
		text-decoration:none;
		color:black;
	}
	
	#notice{
		width:30px;
		height:17px;
	}

</style>
<script>

	function check() {//검색시 유효성 체크(검색유형, 검색어) 함수
		var searchF=document.getElementById("searchF")
		if (!searchF.findType.value) {
			alert('검색 유형을 선택하세요');
			return false;
		}
		if (!searchF.findKeyword.value) {
			alert('검색어를 입력하세요');
			searchF.findKeyword.focus();
			return false;
		}
		return false;
	}

	
	function chk_form(num) {//비밀글 비밀번호 체크 함수	
		frm.num.value = num;
		frm.action = 'pwdCheck';
		frm.method = 'post';
	}
	
</script>


<!-- ${boardArr} -->
<div class="container mt-3" style="height: 600px; overflow: auto;">
	<h1 class='text-center'>고객문의게시판</h1>
	<!-- 검색기능------------------------------------------------------>
	<div class="row py-3">
		<div>
			<form name="pageSizeF" action="list">
				<!-- hidden data -->
				<input type="hidden" name="findType" value="${paging.findType}">
				<input type="hidden" name="findKeyword" value="${paging.findKeyword}">
			    <input type="hidden" name="cpage" value="${paging.cpage}">
				<!--  ------------------->
				<select name="pageSize" style="padding: 6px;" onchange="submit()">
					<option>::페이지 사이즈::</option>
					<c:forEach var="ps" begin="5" end="20" step="5">
						<option value="${ps}"
							<c:if test="${pageSize eq ps}">selected</c:if>>페이지 사이즈 ${ps}</option>
					</c:forEach>
				</select>
			</form>
		</div>
	</div>
	<!-- boardTable----------------------- -->
	<table class="table table-hover">
		<thead class='text-center'>
			<th style="width: 5%">번호</th>
			<th style="width: 10%">문의유형</th>
			<th style="width: 55%">제목</th>
			<th style="width: 10%">작성자</th>
			<th style="width: 10%">작성일</th>
			<th style="width: 5%">조회수</th>
		</thead>
		<tbody>
			<c:if test="${boardArr eq null or empty boardArr}">
				<tr>
					<td colspan="6" align='center'><b>조회된 데이터가 없습니다</b></td>
				</tr>
			</c:if>
			<c:if test="${boardArr ne null and not empty boardArr}">
				<c:forEach var="board" items="${boardArr}">
					<tr>
						<!-- 글번호  -->
						<c:if test="${board.adminSunbun > 0}">
							<td class='text-center'><img id="notice" src="../../resources/images/notice.jpg"></td>
						</c:if>
						<c:if test="${board.adminSunbun == 0}">
							<td class='text-center'><c:out value="${board.num}" /></td>
						</c:if>
						<!-- 문의유형  -->
						<td class='text-center' style="font-size: 1em"><c:out
								value="${board.bcg_name}" /></td>
						<!-- 답변레벨에 따른 들여쓰기 -->
						<td>
							<c:if test="${board.lev > 0}">&nbsp;&nbsp;
								<img src="../../resources/images/reply.jpg">
							</c:if>
							<!-- 글제목(이미지넣기, 제목 글자수 설정하기, 비밀글 여부에 따른 제목 설정) -----------------> 
								<!-- 관리자 작성글일 경우에 제목 -------------->
							<c:if test="${board.adminSunbun > 0}">
								<c:if test="${board.secret == 'Y'}">
									<a href="view/<c:out value="${board.num}"/>" style="color:red;">
									<c:out value="${fn:substring(board.subject,0,50)}" /></a>
								</c:if> 
								<c:if test="${board.secret == 'N'}">
									<img id="secret" src="../../resources/images/secret.jpg">
									<a data-toggle="modal" href="#pwdModal" style="color:red;" onclick="chk_form('${board.num}')">
									<c:out value="${fn:substring(board.subject,0,50)}" /></a>
								</c:if>	
							</c:if>
							
								<!-- 회원 작성글일 경우에 제목------------------->
							<c:if test="${board.adminSunbun == 0}">	
								<c:if test="${board.secret == 'Y'}">
									<a href="view/<c:out value="${board.num}"/>">
									<c:out value="${fn:substring(board.subject,0,50)}" /></a>
								</c:if> 
								<c:if test="${board.secret == 'N'}">
									<img id="secret" src="../../resources/images/secret.jpg">
										<c:if test="${board.lev == 0}">
											<a data-toggle="modal" href="#pwdModal" onclick="chk_form('${board.num}')">비밀글 입니다</a>
										</c:if>
										<c:if test="${board.lev > 0}">
											<a data-toggle="modal" href="#pwdModal" onclick="chk_form('${board.num}')">
											<c:out value="${fn:substring(board.subject,0,50)}" /></a>
										</c:if>
								</c:if>	
							</c:if>
					    </td>
						<!--  -->
						<!--  -->
						<td class='text-center'><c:out value="${board.name}" /></td>
						<td class='text-center'><c:out value="${board.wdate}" /></td>
						<td class='text-center'><c:out value="${board.readnum}" /></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td style="background: beige" colspan="6" class="col-md-10 text-right">
					<a href="write"><button class="btn btn-warning">글쓰기</button></a>
				</td>
			</tr>
			<!-- 검색기능 -------------------------------------------------->
			<tr>
				<td colspan="6">
					<div class="col-md-10 text-left">
						<form name="searchF" id="searchF" action="list" onsubmit="return check()">
							<input type="hidden" name="cpage" value="${paging.cpage}">
							<!--  -->
							<select name="findType" style="padding: 6px">
								<option value="">::검색유형::</option>
								<option value="1"
									<c:if test="${paging.findType eq 1}">selected</c:if>>글제목</option>
								<option value="2"
									<c:if test="${paging.findType eq 2}">selected</c:if>>작성자</option>
								<option value="3"
									<c:if test="${paging.findType eq 3}">selected</c:if>>글내용</option>
							</select> 
							<input type="text" name="findKeyword" placeholder="검색어를 입력하세요"
								autofocus="autofocus" style='width: 30%'>
							<button class="btn btn-outline-primary">검 색</button>
						</form>
					</div>
				</td>
			</tr>
			<!-- 페이징 블럭 처리----------------------------------- -->
			<tr>
				<td colspan="6" class="text-center">${pageNavi}</td>
			</tr>
		</tfoot>
	</table>
	<!-- 비밀글 선택시 비밀번호 입력 모달 띄우기------------- -->
	<%@ include file="/WEB-INF/views/board/passwordModal.jsp" %>

</div>
<c:import url="/foot" />