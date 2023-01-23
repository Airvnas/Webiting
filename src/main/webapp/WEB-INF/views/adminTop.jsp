<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
  			<!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
   		<!-- Core theme CSS (includes Bootstrap)-->
  <link href="/resources/css/styles.css" rel="stylesheet" />
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  
  

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="/resources/js/scripts.js"></script>
  <script>
  function Logout() {
 	    $.ajax({
 	        url: '/logout',
 	        type: 'get',
 	        async: false,
 	        dataType: 'text',
 	        success: function (res) {
 	        	alert('로그아웃 되었습니다.');
 	            location.href =res;
 	        }
 	    });
 	  }
  </script>
    <style type="text/css">
#Category {
    float: left;
    font-weight: bold;
    position: relative;
    
}
.menu_pan {
    width: 100%;
    background: #fff;
    position: absolute;
    left: 0;
    top:100%;
    z-index: 999;
    padding-left: 180px;
    font-size: 15px;
}
.navbar{
	position:fixed;
	z-index:1;
	width:100%;

}
</style>
<style>
	.txt0{
		color:gray;
	}
	.txt-1{
		color:blue;
	}
	.txt-2{
		color:tomato;
	}

	.title{
		text-align: center;
		vertical-align:middle;
		
	}
	.userInfo{
		 text-align:left;
		 font-size:15px;
	}
	.content_main{
		background-color:#787878;
		color:white;
		text-align:center;
		font-size:40px;
		margin:10px 0px;
		padding:10px;
		width:100%;
		border-radius:5px;
	}
	.btn-list{
		 	width: 100%;
            height: 5%;
            background-color: gray;
            color: rgb(209, 209, 209);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
			margin:10px 0px;
	}
	.btn-list button{
			margin:10px;
	}
	
	.search div{
		maring:10px;			
	}
	#searchFilter{
		border: 1px solid gray;
		padding:20px;
		border-radius:5px;
	}
	.list-group{
		font-size:12px;	
	}
	.card-header{
		font-size:12px;
		font-weight:700;
	}

</style>
<script type="text/javascript">
$(function(){
	$('#Category').mouseenter(function(){
		//alert('test');
           $('.upcate').css({ 
               display:'block'
           })
    });
	$('.upcate').mouseenter(function(){
	    $('.upcate').css({
	        display:'block'
    	});
    	$('.selectDcg').css({
	        display:'block'
    	});
	});
	$('.upcate').mouseleave(function(){
	    $('.upcate').css({
	        display:'none'
	    });
	    $('.selectDcg').css({
	        display:'none'
    	});
	});
	$('.selectDcg').mouseenter(function(){
	    $('.selectDcg').css({
	        display:'block'
    	});
    	$('.upcate').css({
	        display:'block'
    	});
	});
	$('.selectDcg').mouseleave(function(){
	    $('.selectDcg').css({
	        display:'none'
	    });
	    $('.upcate').css({
	        display:'block'
    	});
	});
})
function check(){
		if(!searchF.findType.value){
			alert('검색 유형을 선택하세요');
			return false;
		}
		if(!searchF.findKeyword.value){
			alert('검색어를 입력하세요');
			searchF.findKeyword.focus();
			return false;
		}
		return true;
	}


function selectDownCategoryHome(upCode){
		//alert(upCode);
		//ajax로 요청보내기. get방식으로 upCg_code를 파라미터값으로 전달하면, json으로 받아보자
		//url: getDownCategory
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
  		var context =location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );

		$.ajax({
			type:'get',
			url:'../test/getDownCategoryHome?upCg_code='+upCode,
			dataType:'json',
			cache:false
		})
		.done(function(res){
			//alert(JSON.stringify(res));
			//응답 결과를 받아서 select 태그 만들어서 id가 selectDcg인 곳에 응답 html데이터를 넣기
			let str="";
			$.each(res, function(i, item){
				str+='<li class="dropdown-item-right"><a href="/prodList?downCg_code='
						+item.downCg_code+'&downCg_name='+item.downCg_name+'">'+item.downCg_name+'</a></li>';
			});
			//alert(str);	
			$('.selectDcg').html(str);
			
		})
		.fail(function(err){
			alert('err');
		})
		
	}//----------------------------
	function Logout() {
   	    $.ajax({
   	        url: '/logout',
   	        type: 'get',
   	        async: false,
   	        dataType: 'text',
   	        success: function (res) {
   	        	alert(res);
   	            location.href =res;
   	        }
   	    });
   	  }
   	  
</script>
	
    </head>


    <body>
    <c:set var="myctx" value="${pageContext.request.contextPath}"/>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/index">Webiting<h3>로그인 상태:${loginUser.status}</h3></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
						<c:if test="${loginUser.status eq 9 }">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="${myctx}/admin/userList">Admin</a></li>
						</c:if>
						
                        <c:if test="${loginUser eq null }">
                        <li class="nav-item">
                          <a class="nav-link" href="${myctx}/login">Login</a>
                        </li>
                     </c:if>
      
                     <c:if test="${loginUser ne null }">
                        <li class="nav-item bg-primary">
                           <a class="nav-link text-white" href="#">${loginUser.userid}</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#" onclick="Logout()">Logout</a>
                        </li>
                     </c:if>
                     
                     <li class="nav-item"><a class="nav-link" href="${myctx}/board/home">고객문의</a></li>

                     <!-- 로그인한 유저만 보이게 설정 -------------------------------------------------------------------- -->
				 	<%-- <c:if test="${loginUser ne null }">
                     	<li class="nav-item"><a class="nav-link" href="${myctx}/mypage">MyPage</a></li>
					</c:if> --%>
					<!-- test용 ------------------------------------------------------------------------------ -->
					<c:if test="${loginUser ne null }">
                     <li class="nav-item"><a class="nav-link" href="${myctx}/mypage/likeList">MyPage</a></li>
                    </c:if>
					 <li id="shop" class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                            		 aria-expanded="false">Shop</a>
                            	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                	<li><a class="dropdown-item" href="/prodList">All Products</a></li>
                                	<li><hr class="dropdown-divider" /></li>
									<li class="nav-item" id="Category"><a class="dropdown-item" href="#" >카테고리</a>
                     				<div class="menu_pan" > 
                     					<!-- <li><hr class="dropdown-divider" /></li> -->
	                            		<c:forEach var="up" items="${upCgList}">
                               			<li class="upcate dropdown-item"  style="display:none;"><a href="#" 
                               			onmouseover ="selectDownCategoryHome(${up.upCg_code})">
                               			${up.upCg_name}</a> </li>
										</c:forEach>
										<div class="selectDcg"></div>
                     				</div>
                     			</li>	
                            </ul>
                        </li>                                             
                    </ul>
                    <!-- 검색폼 시작------------------------- -->
	
		<div class="row py-3">
			<div class="col-md-9" style="width:100%;float:left">
				<form name="searchF" action="prodList" onsubmit="return check()" style="width:100%;height:35px;">
					<input type="hidden" name="pageSize" value="${pageSize}">
					<input type="hidden" name="cpage" value="1">
						 <select name="findType" style="padding:6px;width:35%;height:35px;">
							<option value="">검색유형</option>
							<option value="1" <c:if test="${paging.findType eq 1}">selected</c:if>>상품명</option>
							<option value="2" <c:if test="${paging.findType eq 2}">selected</c:if>>태그검색</option>
						</select> 
						<input type="text" name="findKeyword" placeholder="검색" 
								 style="width:25%;padding:3px;height:35px;margin:3px;" >
						<button class="btn btn-outline-primary" style="width:30%;">검  색</button>
				</form>
			</div>
			<div class="col-md-3 text-right">
				<form name="pageSizeF" action="prodListForm">
					<input type="hidden" name="findType" value="${paging.findType}">
					<input type="hidden" name="findKeyword" value="${paging.findKeyword}">
					<input type="hidden" name="cpage" value="${paging.cpage}">
					<input type="hidden" name="downCg_code" value="${downCg_code}">
					<input type="hidden" name="downCg_code_name" value="${downCg_code_name}">
				</form>
			</div>
		</div>
	
	<!-- -------------------------------- -->
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="button" onclick="location.href='${myctx}/mypage/cartList'">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
       <header class="bg-dark py-5">
            <!-- <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Webiting</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Furniture Shopping Mall</p>
                </div>
            </div> -->
        </header>
        
        
 	<!-- admin nav ------------------------------------------- -->   
 	
 	
 	
 

<c:set var="myctx" value="${pageContext.request.contextPath}"/>

<div style="position:fixed;display:inline-block;width:9%;margin-top:7%;margin-left:2%;margin-right:5%;">
          <div class="card">
              <!--card-header : 카드 제목 부분 설정-->
              <div class="card-header">회원 및 상품</div>
              <!--list-group : 수직 목록 생성-->
              <!--list-group-flush : 카드 영역에 목록 생성-->
              <div class="list-group list-group-flush">
                  <a href="${myctx}/admin/userList" class="list-group-item list-group-item-action">회원관리</a>
                  <a href="${myctx}/admin/prodForm" class="list-group-item list-group-item-action">상품등록</a>
              </div>
          </div>
          <br>
          <div class="card bg-info">
              <div class="card-header">결제관련</div>
              <div class="list-group">
                  <a href="${myctx}/orderedList" class="list-group-item list-group-item-action">주문목록</a>
                  <a href="${myctx}/AorderedList" class="list-group-item list-group-item-action">배송관리</a>
                  <a href="${myctx}/orderedCancel" class="list-group-item list-group-item-action">취소/환불관리</a>
              </div>
          </div>
          <br>
          <div class="card bg-secondary">
              <div class="card-header">기  타</div>
              <div class="list-group">
                  <a href="${myctx}/admin/list" class="list-group-item list-group-item-action">관리자 게시판</a>
                  <a href="${myctx}/admin/ditchList" class="list-group-item list-group-item-action">폐가구 신청 현황</a>
                  <a href="#" class="list-group-item list-group-item-action">Help</a>
            </div>
        </div>
 </div>
 	    