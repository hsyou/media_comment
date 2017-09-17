<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- bootstrap -->
	<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<title>MediaComment</title>
	
	<style>
		body {
			text-align:center
		}
		
		div#header {
			text-align:right
		}
	</style>
</head>
<body>
	<c:import url="header.jsp" />
	
	<form>
		<input type="text">
		<input type="submit" value="검색">
	</form>
	
	<div class="alert alert-success" role="alert">
		<span>실시간 인기순위</span>
		<button type="button" class="btn btn-primary">더보기</button><br>

		<div class="no">
			<a href="/watch?v=Xvjnoagk6GU"><img height="200" src="https://i.ytimg.com/vi/Xvjnoagk6GU/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBSRdnPBv558TtaQcONWWKhtlFTYQ"></a><br>
			<a href="/watch?v=Xvjnoagk6GU" title="PSY - ‘I LUV IT’ M/V">PSY - ‘I LUV IT’ M/V</a>
			<p>사용자이름</p>
			<p>좋아요 수</p>
			<p>조회수</p>
			<p>업로드 날짜</p>
		</div>
		
		<div class="no">
			<a href="/watch?v=Xvjnoagk6GU"><img height="110" src="https://i.ytimg.com/vi/VQtonf1fv_s/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLC7_7ssp9cA7mxSwNeeGF4CRHa5Mw"></a><br>
			<a href="/watch?v=VQtonf1fv_s" title="TWICE(트와이스) &quot;SIGNAL&quot; M/V">TWICE(트와이스) "SIGNAL" M/V</a>
		</div>
	</div>
	
	<div class="alert alert-success" role="alert">
		<p>가장 재미있는 댓글 영상</p>
		<button type="button" class="btn btn-primary">더보기</button>
	</div>
	
	<div class="alert alert-success" role="alert">
		<p>전체영상</p>
		<button type="button" class="btn btn-primary">더보기</button>
	</div>
	
	<c:import url="footer.jsp" />
	
	
	<!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
    <div id="player"></div>
	
	<!-- 두번째 방법 -->
	<iframe id="player" type="text/html" width="640" height="360"
		src="http://www.youtube.com/embed/M7lc1UVf-VE?enablejsapi=1&origin=http://example.com" frameborder="0">
	</iframe>
	
	<script>
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '360',
          width: '640',
          videoId: 'M7lc1UVf-VE',
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, 3000);			// 3초 뒤에 동영상 정지
          done = true;
        }
      }
      function stopVideo() {
        player.stopVideo();
      }
    </script>
</body>
</html>
