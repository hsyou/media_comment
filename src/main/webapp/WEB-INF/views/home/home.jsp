<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>메인 페이지</title>
	
	<link rel="stylesheet" type="text/css" href="resources/assets/main.css" media="all"/>
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
    <!-- <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
	
	<script>		// 버튼 클릭 시 동영상 필터링
		$(document).ready(function(){
	
		    $(".filter-button").click(function(){
		        var value = $(this).attr('data-filter');
		        
		        if(value == "all")
		        {
		            //$('.filter').removeClass('hidden');
		            $('.filter').show('1000');
		        }
		        else
		        {
	//	            $('.filter[filter-item="'+value+'"]').removeClass('hidden');
	//	            $(".filter").not('.filter[filter-item="'+value+'"]').addClass('hidden');
		            $(".filter").not('.'+value).hide('3000');
		            $('.filter').filter('.'+value).show('3000');
		            
		        }
		    });
		    
		    if ($(".filter-button").removeClass("active")) {
				$(this).removeClass("active");
			}
			$(this).addClass("active");
	
		});
	</script>
</head>
<body>
	 <div class="">
        <div class="row">
	        <div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
	            <h1 class="gallery-title">media_comment</h1>
	        </div>
	        
	        <div class="user_btn" align="center">
	        	<button type="button">회원가입</button>
	        	<button type="button">로그인</button>
	        </div>
	        
	        <div class="main_search" align="center">
	        	<form>
					<input type="text" size="80">
					<input type="submit" value="검색">
				</form>
	        </div>
			
	        <div align="center">
	            <button class="btn btn-default filter-button" data-filter="all">		전체				</button>
	            <button class="btn btn-default filter-button" data-filter="hdpe">		실시간 인기순위		</button>
	            <button class="btn btn-default filter-button" data-filter="sprinkle">	가장 재미있는 댓글 영상	</button>
	            <button class="btn btn-default filter-button" data-filter="spray">		즐겨찾기  모음		</button>
	            <button class="btn btn-default filter-button" data-filter="irrigation">	축구				</button>
	        </div>
        	<br/>
        	
			
            <c:forEach items="${list }" var="vo" varStatus="status">
            	<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter spray">
            		<div> video_code : ${vo.video_code }</div>
            		
            		<a href="video/play" target="_black">
            			<img alt="동영상" src="https://img.youtube.com/vi/${vo.video_code }/hqdefault.jpg" width="480" height="270">
            		</a>
            		
            		<div>
	                	<span>동영상 제목 : ${vo.video_title }</span>
	                </div>
	                <div>
	                	<span>업로드한 사람 / </span>
	                	<span>좋아요 수</span>
	                </div>
	                <div>
	                	<span>조회수 / </span>
	                	<span>업로드 날짜</span>
	                </div>
            	</div>
            </c:forEach>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                <!-- <img src="http://fakeimg.pl/365x365/" class="img-responsive"> 640/360-->
                <iframe id="player" type="text/html" width="480" height="270"
                		src="http://www.youtube.com/embed/M7lc1UVf-VE?enablejsapi=1&origin=http://example.com" frameborder="0"></iframe>
                <div>
                	<span>동영상 제목</span>
                </div>
                <div>
                	<span>업로드한 사람 / </span>
                	<span>좋아요 수</span>
                </div>
                <div>
                	<span>조회수 / </span>
                	<span>업로드 날짜</span>
                </div>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter sprinkle">
                <!-- <img src="http://fakeimg.pl/365x365/" class="img-responsive"> -->
                <iframe id="player" type="text/html" width="480" height="270" src="https://www.youtube.com/embed/ANR5UgNyafw" frameborder="0" allowfullscreen></iframe>
                <div>
                	<span>동영상 제목</span>
                </div>
                <div>
                	<span>업로드한 사람 / </span>
                	<span>좋아요 수</span>
                </div>
                <div>
                	<span>조회수 / </span>
                	<span>업로드 날짜</span>
                </div>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                <!-- <img src="http://fakeimg.pl/365x365/" class="img-responsive"> -->
                <iframe id="player" type="text/html" width="480" height="270" src="https://www.youtube.com/embed/Z1pGxkXyDvc" frameborder="0" allowfullscreen></iframe>
                <div>
                	<span>동영상 제목</span>
                </div>
                <div>
                	<span>업로드한 사람 / </span>
                	<span>좋아요 수</span>
                </div>
                <div>
                	<span>조회수 / </span>
                	<span>업로드 날짜</span>
                </div>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation">
                <!-- <img src="http://fakeimg.pl/365x365/" class="img-responsive"> -->
                <!--  
	                <img alt=""
	                 onload="; window.__ytRIL &amp;&amp; __ytRIL(this)"
	                 src="https://i.ytimg.com/vi/hLcoqsGbWdo/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&amp;rs=AOn4CLCdn7w3G1TWe545k74jdwePUP_Zew"
	                 data-ytimg="1"
	                 data-mouseover-src="https://i.ytimg.com/an_webp/hLcoqsGbWdo/mqdefault_6s.webp?du=3000&amp;sqp=CITR4csF&amp;rs=AOn4CLDfAe_qhTGgSn-bAHs22ubgO2BaiQ"
	                 width="196" height="110">
                -->
                  
                <!-- 7sdNuQUXrew 	https://www.youtube.com/watch?v=7sdNuQUXrew -->
                <!-- <iframe width="640" height="360" src="https://www.youtube.com/embed/7sdNuQUXrew" frameborder="0" allowfullscreen></iframe> -->
                <!-- <img
                 alt="" width="196" height="110"
                 data-mouseover-src="https://i.ytimg.com/an_webp/7sdNuQUXrew/mqdefault_6s.webp?du=3000&amp;sqp=CIin4csF&amp;rs=AOn4CLD_DLlIe3XKmObHAg4MDztYdtZVyw"
                 src=				"https://i.ytimg.com/vi		/7sdNuQUXrew/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&amp;rs=AOn4CLB4rniQ1oKPrjDzK-Cn7BwK8tlB6A"
                 data-ytimg="1"
                 onload=";window.__ytRIL &amp;&amp; __ytRIL(this)"> -->
                 
                <img alt="동영상" src="https://img.youtube.com/vi/동영상아이디/hqdefault.jpg" width="480" height="270">
                
                <iframe width="480" height="270" src="https://www.youtube.com/embed/ovJ1eWy-5vA" frameborder="0" allowfullscreen></iframe>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter spray">
                <!-- <img src="http://fakeimg.pl/365x365/" class="img-responsive"> -->
                <iframe width="480" height="270" src="https://www.youtube.com/embed/Ktcxy0L4mOA" frameborder="0" allowfullscreen></iframe>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation">
                <!-- <img src="http://fakeimg.pl/365x365/" class="img-responsive"> -->
                <iframe width="480" height="270" src="https://www.youtube.com/embed/oUDg9_iSsts" frameborder="0" allowfullscreen></iframe>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter spray">
                <!-- <img src="http://fakeimg.pl/365x365/" class="img-responsive"> -->
                <iframe width="480" height="270" src="https://www.youtube.com/embed/pF_rqav38Z4" frameborder="0" allowfullscreen></iframe>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation">
                <!-- <img src="http://fakeimg.pl/365x365/" class="img-responsive"> -->
                <iframe width="480" height="270" src="https://www.youtube.com/embed/8A2t_tAjMz8" frameborder="0" allowfullscreen></iframe>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter irrigation">
                <!-- <img src="http://fakeimg.pl/365x365/" class="img-responsive"> -->
                <iframe width="480" height="270" src="https://www.youtube.com/embed/d61aBKQc7nI" frameborder="0" allowfullscreen></iframe>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                <!-- <img src="http://fakeimg.pl/365x365/" class="img-responsive"> -->
                <iframe width="480" height="270" src="https://www.youtube.com/embed/xr75FagSONM" frameborder="0" allowfullscreen></iframe>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter spray">
                <!-- <img src="http://fakeimg.pl/365x365/" class="img-responsive"> -->
                <iframe width="480" height="270" src="https://www.youtube.com/embed/d9IxdwEFk1c" frameborder="0" allowfullscreen></iframe>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter sprinkle">
                <!-- <img src="http://fakeimg.pl/365x365/" class="img-responsive"> -->
                <iframe width="480" height="270" src="https://www.youtube.com/embed/VRZu94q_PRE" frameborder="0" allowfullscreen></iframe>
            </div>
        </div>
    </div>
    

</body>
</html>