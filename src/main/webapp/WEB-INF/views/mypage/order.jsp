<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="/WEB-INF/views/mypage/orderScript.jsp" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet" href="/resources/css/order.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%-- <script type="text/javascript" charset="utf-8"><%@ include file="/js/pay.js"  %></script> --%>
<script type="text/javascript" charset="utf-8" src="/resources/js/pay.js"></script>

<div class="content_area">
	<div class="content_subject">
		<span>주문 페이지</span>
	</div>

	<div class="content_main">
		<!-- 회원 정보 -->
		<div class="member_info_div">
			<table class="table_text_align_center loginUser_table">
				<tbody>
					<tr>
						<th style="width: 25%;">주문자</th>
						<td style="width: *">${loginUser.name}|
							${loginUser.email}</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 배송지 정보 -->
		<div class="addressInfo_div">
			<div class="addressInfo_button_div">
				<button class="address_btn address_btn_1" onclick="showAdress('1')"
					style="background-color: #3c3838;">사용자 정보 주소록</button>
				<button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
			</div>
			<div class="addressInfo_input_div_wrap">
				<div class="addressInfo_input_div addressInfo_input_div_1"
					style="display: block">
					<table>
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>이름</th>
								<td>${loginUser.name}</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>${loginUser.getAllAddr()}<br>
									<input class="selectAddress" value="T" type="hidden"> 
									<input class="username_input" value="${loginUser.name}" type="hidden"> 
									<input class="post_input" type="hidden" value="${loginUser.post}">
									<input class="addr1_input" type="hidden" value="${loginUser.addr1}"> 
									<input class="addr2_input" type="hidden" value="${loginUser.addr2}">
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${loginUser.getAllHp()}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="addressInfo_input_div addressInfo_input_div_2">
					<table>
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>이름</th>
								<td><input class="username_input"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<input class="selectAddress" value="F" type="hidden">
									<input class="post_input" readonly="readonly"> <a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br> 
									<input class="addr1_input" readonly="readonly"> 
									<input class="addr2_input"><br>
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>							
										<input type="text" name="hp1" id="hp1" placeholder="HP1" maxlength="3">- 
										<input type="text" name="hp2" id="hp2" placeholder="HP2" maxlength="4">-
										<input type="text" name="hp3" id="hp3" placeholder="HP3" maxlength="4">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 상품 정보 -->
		<div class="orderGoods_div">
			<!-- 상품 종류 -->
			<div class="goods_kind_div">
				주문상품 <span class="goods_kind_div_kind"></span>종 / 총 수량: <span class="goods_kind_div_count"></span>개
			</div>
			<!-- 상품 테이블 -->
			<table class="goods_subject_table">
				<colgroup>
					<col width="15%">
					<col width="45%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<th>이미지</th>
						<th>상품 정보</th>
						<th>판매가</th>
					</tr>
				</tbody>
			</table>
			<table class="goods_table">
				<colgroup>
					<col width="15%">
					<col width="45%">
					<col width="40%">
				</colgroup>
				<tbody>
					<c:forEach items="${orderList}" var="ol">
						<tr>
							<td>
								<div class="image_wrap">
									<img src="/resources/product_images/${ol.pimage1}">
								</div>
							</td>
							<td>${ol.pname}</td>
							<td class="goods_table_price_td">
								<fmt:formatNumber value="${ol.saleprice}" pattern="###,###,### 원" /> | 
								수량	${ol.pqty}개 <br> 
								<fmt:formatNumber value="${ol.totalPrice}" pattern="###,###,### 원" /> <br>
								[<fmt:formatNumber value="${ol.totalPoint}" pattern="###,###,### " />P]
								<input type="hidden" class="individual_salePrice_input" value="${ol.saleprice}">
								<input type="hidden" class="individual_oqty_input" value="${ol.pqty}"> 
								<input type="hidden" class="individual_totalPrice_input" value="${ol.saleprice * ol.pqty}"> 
								<input type="hidden" class="individual_point_input" value="${ol.point}">
								<input type="hidden" class="individual_totalPoint_input" value="${ol.totalPoint}"> 
								<input type="hidden" class="individual_pnum_input" value="${ol.pnum}">
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		<!-- 포인트 정보 -->
		<div class="point_div">
			<div class="point_div_subject">포인트 사용</div>
			<table class="point_table">
				<colgroup>
					<col width="25%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>포인트 사용</th>
						<td>보유 : ${loginUser.mileage}p | 사용 : <input class="order_point_input"
							value="0">원 <a
							class="order_point_input_btn order_point_input_btn_N"
							data-state="N">모두사용</a> <a
							class="order_point_input_btn order_point_input_btn_Y"
							data-state="Y" style="display: none;">사용취소</a>

						</td>
					</tr>
					<tr>
						<th>할인 쿠폰</th>
						<td>
							<select>
								<option>::할인쿠폰 선택::</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 주문 종합 정보 -->
		<div class="total_info_div">
			<!-- 가격 종합 정보 -->
			<div class="total_info_price_div">
				<ul>
					<li><span class="price_span_label">상품 금액</span> <span
						class="totalPrice_span">${ovo.totalPrice}</span>원</li>
					<li><span class="price_span_label">배송비</span> <span
						class="delivery_price_span">0</span>원</li>
					<li><span class="price_span_label">할인금액</span> <span
						class="usePoint_span">0</span>원</li>
					<li class="price_total_li"><strong
						class="price_span_label total_price_label">최종 결제 금액</strong> <strong
						class="strong_red"> <span
							class="total_price_red finalTotalPrice_span"></span>원
					</strong></li>
					<li class="point_li"><span class="price_span_label">적립예정
							포인트</span> <span class="totalPoint_span">${ovo.totalPoint}원</span></li>
				</ul>
			</div>
			<!-- 버튼 영역 -->
			<div class="total_info_btn_div">
				  <button class="order_btn" onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
			</div>
		</div>
	</div>
</div>

<!-- 주문 요청 form -->

	<input name="name" type="text">
	<input name="amount" type="text">
	<input name="buyer_email" type="text" value="${loginUser.email}">
	<input name="buyer_name" type="text" value="${loginUser.name}">
	<input name="buyer_tel" type="text"  value="${loginUser.getAllHp()}">
	<input name="buyer_addr" type="text">
	<input name="buyer_postcode" type="text">


<c:import url="/foot" />