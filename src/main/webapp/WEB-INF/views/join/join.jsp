<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/top" />
<script type="text/javascript" src="./js/userCheck.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="container" style="height: 1500px; overflow: auto;">

	<h1 class="text-center mt-1">Signup</h1>
	<!-- hidden data----------------------------------------- -->
	<form name="mf" action="join" method="post" enctype=multipartform-data>
		<input type="hidden" name="id_flag" id="id_flag" value="N">
		<table class="table">
			<tr>
				<td width="20%" class="m1"><b>이름</b></td>
				<td width="80%" class="m2"><input type="text" name="name"
					id="name" placeholder="Name"> <br>
				<span class='ck1'>*이름은 한글만 가능해요</span></td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>아이디</b></td>
				<td width="80%" class="m2"><input type="text" name="userid"
					id="userid"  placeholder="Userid">
					<button type="button" class="btn btn-success"
						onclick="ajax_idcheck()">아이디 중복 체크</button> <br>
				<span class='ck1' id="id_result">*아이디는 영문자, 숫자, _, !만
						사용가능합니다.</span></td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>비밀번호</b></td>
				<td width="80%" class="m2"><input type="password" name="pwd"
					id="pwd" placeholder="Password"> <br>
				<span class='ck1'>*비밀번호는 문자,숫자,!,. 포함해서 4~8자리 이내</span></td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>비밀번호 확인</b></td>
				<td width="80%" class="m2"><input type="password" name="pwd2"
					id="pwd2" placeholder="Re Password"></td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>연락처</b></td>
				<td width="80%" class="m2"><input type="text" name="hp1"
					id="hp1" placeholder="HP1" maxlength="3">- <input
					type="text" name="hp2" id="hp2" placeholder="HP2" maxlength="4">-
					<input type="text" name="hp3" id="hp3" placeholder="HP3"
					maxlength="4"> <br>
				<span class='ck1'>*앞자리(010|011)중에 하나-(숫자3~4자리)-(숫자4자리)가능해요</span></td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>우편번호</b></td>
				<td width="80%" class="m2"><input type="text" name="post"
					id="post" placeholder="Post" maxlength="5">
					<button type="button" onclick="postfind()" class="btn btn-success">우편번호
						찾기</button></td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>주소</b></td>
				<td width="80%" class="m2"><input type="text" name="addr1"
					id="addr1" placeholder="Address1"><br> <input
					type="text" name="addr2" id="addr2" placeholder="Address2">
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>이메일</b></td>
				<td width="80%" class="m2"><input type="text" name="email"
					id="email" placeholder="Email"><br> <span class='ck1'>*카카오계정과
						동일하게 입력해주세요</span></td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>성별</b></td>
				<td width="80%" class="m2"><input type="radio" name="gender"
					id="gender1" value="male">남자 <input type="radio"
					name="gender" id="gender2" value="female">여자</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>연령대</b></td>
				<td width="80%" class="m2">
					<select id="age" name="age">
						<option  value="10">10대</option>
						<option  value="20">20대</option>
						<option  value="30">30대</option>
						<option  value="40">40대</option>
						<option  value="50">50대</option>
						<option  value="60">60대</option>
						<option  value="70">70대</option>
					</select>
				</td>
			</tr>
			<tr>
				
				<td class="m2 text-center" colspan="2">
				<h2 class="tit01">개인정보의 수집 및 이용에 대한 동의 (필수)</h2>
				<div class="box01 scroll" >
					<iframe src="/agree" title="개인정보의 수집 및 이용에 대한 동의 (필수)" style="width:80%"></iframe>
				</div>
				<p class="agree01">
				<fieldset id="agreeRadio">
					<input type="radio" id="pInforAgree02" name="pInforAgree2" value="1"> <label class="mr10" for="pInforAgree02">동의합니다</label>
					<input type="radio" id="pInforAgree022" name="pInforAgree2" value="2"> <label for="pInforAgree022">동의하지 않습니다</label>
				</fieldset>
				</p>
				</td>
			</tr>
					
			<tr>
				<td colspan="2" class="m3 text-center">
					<button class="btn btn-primary" type="button"
						onclick="member_check()">회원가입</button>
					<button class="btn btn-danger" type="reset">다시쓰기</button>
				</td>

			</tr>
		</table>
	</form>


</div>


<c:import url="/foot" />