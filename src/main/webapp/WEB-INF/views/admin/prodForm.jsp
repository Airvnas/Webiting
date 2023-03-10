<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top" />
<c:import url="/adminNavi" />
<script src= "../js/pcategory.js"></script> <!-- 참조 할 부분 -->
<div class="py-5">
	<div class="container mt-4" style="overflow: auto ;position:relative">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center">상품 등록[Admin Page]</h1>
				<form name="prodF" id="prodF" method="Post"                    
					enctype="multipart/form-data" action="prodInsert"
					onsubmit="return check()">
					<!-- 파일업로드시: enctype="multipart/form-data"-->
					<table class="table table-condensed table-bordered mt-4">
						<thead>
							<tr>
								<th colspan="2" class="text-center">
									<h3>:::Product Register:::</h3>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="20%"><b>카테고리</b></td>
								<td width="80%"><select name="upCg_code" id="upCg_code"
									onchange="selectDownCategory(this.value)">
										<option value="">::상위 카테고리::</option>
										<c:forEach var="up" items="${upCgList}">
											<option value="${up.upCg_code}">${up.upCg_name}</option>
										</c:forEach>


								</select> <span id="selectDcg"> </span></td>
							</tr>

							<tr>
								<td width="20%"><b>상품명</b></td>
								<td width="80%"><input type="text" name="pname" id="pname">
									<span style="color: red"> </span></td>
							</tr>
							<tr>
								<td width="20%"><b>제조사</b></td>
								<td width="80%"><input type="text" name="pcompany"
									id="pcompany"></td>
							</tr>
							<tr>
								<td width="20%"><b>상품스펙</b></td>
								<td width="80%"><select name="pspec" id="pspec">
										<option value="NEW" selected>NEW</option>
										<option value="HIT">HIT</option>
										<option value="BEST">BEST</option>
								</select></td>
							</tr>
							<tr>
								<td>상품이미지</td>
								<td><input type="file" name="pimage"><br> <input
									type="file" name="pimage"><br> <input type="file"
									name="pimage"><br></td>
							</tr>

							<tr>
								<td width="20%"><b>상품수량</b></td>
								<td width="80%"><input type="number" name="pqty" id="pqty">
									개 <span style="color: red"> </span></td>

							</tr>
							<tr>
								<td width="20%"><b>상품공급가</b></td>
								<td width="80%"><input type="text" name="price" id="price">

									원 <span style="color: red"> </span></td>
							</tr>
							<tr> 
								<td width="20%"><b>상품판매가</b></td>
								<td width="80%"><input type="text" name="saleprice"
									id="saleprice"> 원 <span style="color: red"> </span></td>
							</tr> 
							<tr>
								<td width="20%"><b>상품설명</b></td>
								<td width="80%"><textarea name="pcontents" id="pcontents"
										rows="5" cols="60"></textarea></td>
							</tr>
							<tr>
								<td width="20%"><b>포인트</b></td>
								<td width="80%"><input type="number" name="point"
									id="point"> POINT</td>
							</tr>
							<tr>
								<td width="20%"><b>태그 검색어</b></td>
								<td width="80%">
								<input type="text" name="tag1" id="tag1">
								<input type="text" name="tag2" id="tag2">
								<input type="text" name="tag3" id="tag3"> 
								</td>
							</tr>
							<tr>
								<td colspan="2" class="text-center">
									<button class="btn btn-outline-success">상품등록</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

			</div>
		</div>
	</div>
</div>
	

<c:import url="/foot" />