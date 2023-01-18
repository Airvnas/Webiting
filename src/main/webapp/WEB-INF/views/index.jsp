<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<c:import url="/top"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
	$(function(){
		$('.post-wrapper').slick({
			  slidesToShow: 1,
			  slidesToScroll: 1,
			  autoplay: true,
			  autoplaySpeed: 5000,
			  nextArrow:$('.next'),
			  prevArrow:$('.prev'),
			});
  		})
</script>


<style>
.banner-size{
border:10px;
}
.sale-btn{
border-radius:60px;
border:10px solid #000;
	}
a.sale-btn{
color:#ced4da;
background-color:#212529;
}
</style>
<c:if test="${toplikeprod ne null and not empty toplikeprod}">
			<!-- Home 화면 슬라이더  -->
 <div class="page-wrapper" style= "position:relative;">
      		<!--page slider --> 		
      <div class="post-slider">
        <h1 class="silder-title">Top Like Products</h1>
        <i class="fas fa-chevron-left prev"></i>  
        <i class="fas fa-chevron-right next"></i>   
        <div class="post-wrapper">
        <c:forEach var="prod" items="${toplikeprod}">
          <div class="post">
            <a href="/prodDetail?pnum=${prod.pnum}" style="width:200px;height:200px;">
            <img src="../resources/product_images/${prod.pimage1}" class="slider-image" style="width:400px;height:200px;text-align:center"></a>
            <div class="post-info">
              <i class="far fa-user" style="height:10%;"></i>
            </div>
          </div>
        </c:forEach>
          <!--  -->
        </div>
      </div> 
    </div>
</c:if>
<c:import url="/prodRecoForm" />

    			<!-- 배너 2-->
    		<div class = "home-banner" style="text-align:center">
				<div class = "banner" id = "NewYear-sale">
					<div class = "pub-banner" style="height:80%">
						<div class = "banner-size" style ="padding:15%">
							<div class = "banner-detail">
								<div class ="banner-main" style="background-color:rgb(251,170,20);
								 height:40%; width:110%">
									<div>
										<h2 class = "sale-text">새해 맞이 온라인 최대 50% OFF!!</h2>
										<div><p>IKEA가 준비한 최대50% 마지막 할인 제품을 만나보세요</p></div>
										<a role="button" class="sale-btn" href = "">
										<span>
											<span class ="sale-btn_label" style="display:inline-flex; font-weight:bold;">
											온라인 최대 50% 할인 보러가기</span>
										</span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
    		</div>

    
<c:import url="/foot"/>