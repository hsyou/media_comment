<%@ page import="org.project.media_comment.domain.UserVO" %>
<%@ page import="org.springframework.security.core.userdetails.User" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- bootstrap -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"
            type="text/javascript"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <!-- favicon-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>영상 업로드</title>
    <style>
        .col-centered {
            float: none;
            margin: 0 auto;
        }

        .player {
            max-width: 100%
        }

        .main_frame {
            margin-top: 100px;
        }

        .divide {
            border-bottom: 1px solid #ddd;
        }

        .img_div {
            max-width: 100%;
        }

        .like {
            margin: 3px;
        }

        .preview_img {
            width: 100%;
        }

        #reply_content {
            margin: 10px;
        }

        .panel {
            margin-top: 5px;
        }

        iframe {
            max-width: 100%;
        }

        .row {
            margin: 2px;
        }

        hr {
            margin: auto;
        }

        #tag {
            color: #2a803d;
        }

        #float_reply {
            font-weight: bold;

        }
    </style>
</head>
<body style="background-color:#9da6a9">
<%UserVO vo = (UserVO) session.getAttribute("login");%>
<div class="col-md-6 col-md-offset-3 main_frame">
    <div class="panel panel-default">
        <div class="panel-body row">
            <span id="float_reply"></span>
        </div>
    </div>
    <iframe width="854" height="480" id="player" src="https://www.youtube.com/embed/${videoVO.video_code}?enablejsapi=1"
            frameborder="0"
            allowfullscreen></iframe>


    <div class="panel panel-default">
        <div class="panel-body row">
            <span id="tag"><c:forEach var="hash" items="${hash}"><a href="#">#${hash.hashtag}</a>&nbsp;</c:forEach></span>
            <h1>${videoVO.video_title}</h1>
            <h3>${videoVO.user_id}</h3>
                <h3>  조회수 : ${videoVO.video_hit}회</h3>
            <div class="pull-right">

                <%if (vo != null) {%>
                <input type="hidden" class="user_id" value="<%=vo.getUser_id()%>">
                <input type="hidden" class="video_id" value="${videoVO.video_id}">
                <button type="button"
                        <c:choose>
                            <c:when test="${videoVO.video_vote_flag eq 1}">class="btn btn-primary video_thumb_up"</c:when>
                            <c:otherwise>class="btn btn-default video_thumb_up"</c:otherwise>
                        </c:choose>><i class="fa fa-thumbs-o-up"></i>
                </button>
                <span class="like_count">${videoVO.video_like_count}</span>
                <button type="button"
                        <c:choose>
                            <c:when test="${videoVO.video_vote_flag eq -1}">class="btn btn-primary video_thumb_down"</c:when>
                            <c:otherwise>class="btn btn-default video_thumb_down"</c:otherwise>
                        </c:choose>><i class="fa fa-thumbs-o-down"></i></button>
                <span class="dislike_count">${videoVO.video_dislike_count}</span>
                <input type="hidden" class="reply_id" value="${videoVO.video_id}">

                <%} else {%>
                <button type="button" class="btn btn-default video_thumb_up" disabled><i
                        class="fa fa-thumbs-o-up"></i>
                </button>
                <span class="like_count">${videoVO.video_like_count}</span>
                <button type="button" class="btn btn-default video_thumb_down" disabled><i
                        class="fa fa-thumbs-o-down"></i></button>
                <span class="dislike_count">${videoVO.video_dislike_count}</span>
                <%}%>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-body row">
            <form method="post" action="/video/reply" id="frm_reply">
                <span id="p_time"></span>&nbsp;&nbsp;
                <input type="hidden" id="reply_playtime" name="reply_playtime"/>
                <input type="hidden" name="video_id" value="${videoVO.video_id}">
                <button type="button" class="btn btn-default" onclick="refresh()"><span
                        class="glyphicon glyphicon-refresh" aria-hidden="true"></span></button>

                <%
                    if (vo != null) {
                %>
                <textarea class="form-control" rows="3" id="reply_content" name="reply_content"></textarea>
                <div class="pull-right">
                    <input type="hidden" name="user_id" value="<%=vo.getUser_id()%>">
                    <button type="submit" class="btn btn-primary">등록</button>
                        <%}else{%>
                    <textarea class="form-control" rows="3" id="reply_content" name="reply_content"
                              readonly>로그인이 필요합니다</textarea>
                    <div class="pull-right">
                        <button type="submit" class="btn btn-primary" disabled>등록</button>
                        <%}%>
                    </div>
            </form>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">


            <c:forEach var="reply" items="${list}">
                <div class="div_reply row">
                    <h4>${reply.user_id}</h4>
                    <a onclick="seek(${reply.reply_playtime})">${reply.reply_playtime}</a>
                    <p> ${reply.reply_content}</p>
                    <div class="pull-right">
                        <%if (vo != null) {%>
                        <input type="hidden" class="user_id" value="<%=vo.getUser_id()%>">
                        <button type="button"
                                <c:choose>
                                    <c:when test="${reply.reply_vote_flag eq 1}">class="btn btn-primary thumb_up"</c:when>
                                    <c:otherwise>class="btn btn-default thumb_up"</c:otherwise>
                                </c:choose>><i class="fa fa-thumbs-o-up"></i>
                        </button>
                        <span class="like_count">${reply.reply_like_count}</span>
                        <button type="button"
                                <c:choose>
                                    <c:when test="${reply.reply_vote_flag eq -1}">class="btn btn-primary thumb_down"</c:when>
                                    <c:otherwise>class="btn btn-default thumb_down"</c:otherwise>
                                </c:choose>><i class="fa fa-thumbs-o-down"></i></button>
                        <span class="dislike_count">${reply.reply_dislike_count}</span>
                        <input type="hidden" class="reply_id" value="${reply.reply_id}">
                        <%} else {%>
                        <button type="button" class="btn btn-default thumb_up" disabled><i
                                class="fa fa-thumbs-o-up"></i>
                        </button>
                        <span class="like_count">${reply.reply_like_count}</span>
                        <button type="button" class="btn btn-default thumb_down" disabled><i
                                class="fa fa-thumbs-o-down"></i></button>
                        <span class="dislike_count">${reply.reply_dislike_count}</span>
                        <%}%>
                    </div>
                </div>
                <hr>
            </c:forEach>
        </div>
    </div>


    <script>
        var player;

        //api ready
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('player');
            var offset = $("#player").offset();
            $("#float_reply").offset = ({left: offset.left + 200, top: offset.top + 100});
            $("#float_reply").hide();


            //리플 띄울시간 계산 (예제)
            setInterval(function () {
                var time = Math.floor(player.getCurrentTime());
                <c:forEach var="best" items="${best}">
                    if (time == ${best.reply_playtime}) {
                        $("#float_reply").text("${best.reply_content}");
                        showReply();
                    }
                </c:forEach>
            }, 100);
        }

        //댓글 입력 플래그
        var flag = 0;

        //현재 재생시간 리프레시
        function refresh() {
            var time = player.getCurrentTime();
            $("#p_time").text(Math.floor(time));
        }

        //댓글 입력시 현재 재생시간 띄우기
        $("#reply_content").keydown(function () {
            var time = player.getCurrentTime();
            if (flag == 0) {
                $("#p_time").text(Math.floor(time));
                flag = 1;
            }
        });

        //리플 5초간 띄우기
        function showReply() {
            $("#float_reply").show();
            setTimeout(function () {
                $("#float_reply").hide();
            }, 5000);
        }

        //재생시간 이동
        function seek(time) {
            var offset = $("#player").offset();
            player.seekTo(time - 1, true);
            player.pauseVideo();
            $('html, body').animate({scrollTop: offset.top - 60}, 400);
        }

        //리플 등록
        $("#frm_reply").submit(function () {
            var playtime = $("#p_time").text();
            $("#reply_playtime").val(playtime);
            return true;
        });

        //영상 추천
        $('.video_thumb_up').on('click', function () {

            var id = $(this).siblings('.user_id').val();
            var video_id = $(this).siblings('.video_id').val();
            var params = {"user_id": id, "video_id": video_id, "video_vote_flag": "1"};

            console.log("id ,video,vote"+id+video_id);
            var btn = $(this);
            $.ajax({
                url: '/video/vote',
                type: 'POST',
                data: params,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                success: function (result) {
                    console.log("result : "+result);
                    var like_count = btn.siblings(".like_count");
                    var dislike_count = btn.siblings(".dislike_count");
                    switch (result) {
                        case "2"://dislike->like
                            btn.removeClass("btn-default").addClass("btn-primary");
                            btn.siblings(".video_thumb_down").removeClass("btn-primary").addClass("btn-default");
                            like_count.text(parseInt(like_count.text()) + 1);
                            dislike_count.text(parseInt(dislike_count.text()) - 1);
                            break;
                        case "1"://default->like
                            btn.removeClass("btn-default").addClass("btn-primary");
                            btn.siblings(".video_thumb_down").removeClass("btn-primary").addClass("btn-default");
                            like_count.text(parseInt(like_count.text()) + 1);
                            break;
                        default://like 취소
                            btn.removeClass("btn-primary").addClass("btn-default");
                            like_count.text(parseInt(like_count.text()) - 1);
                            break;
                    }
                }
            });

        });
        //영상 비추
        $('.video_thumb_down').on('click', function () {

            var id = $(this).siblings('.user_id').val();
            var video_id = $(this).siblings('.video_id').val();
            var params = {"user_id": id, "video_id": video_id, "video_vote_flag": "-1"};
            var btn = $(this);
            $.ajax({
                url: '/video/vote',
                type: 'POST',
                data: params,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                success: function (result) {
                    var like_count = btn.siblings(".like_count");
                    var dislike_count = btn.siblings(".dislike_count");
                    switch (result) {
                        case "-2"://like->dislike
                            btn.removeClass("btn-default").addClass("btn-primary");
                            btn.siblings(".video_thumb_up").removeClass("btn-primary").addClass("btn-default");
                            like_count.text(parseInt(like_count.text()) - 1);
                            dislike_count.text(parseInt(dislike_count.text()) + 1);
                            break;
                        case "-1"://default->dislike
                            btn.removeClass("btn-default").addClass("btn-primary");
                            btn.siblings(".video_thumb_up").removeClass("btn-primary").addClass("btn-default");
                            dislike_count.text(parseInt(dislike_count.text()) + 1);
                            break;
                        default://dislike 취소
                            btn.removeClass("btn-primary").addClass("btn-default");
                            dislike_count.text(parseInt(dislike_count.text()) - 1);
                            break;
                    }
                }
            });
        });

        //추천
        $('.thumb_up').on('click', function () {

            var id = $(this).siblings('.user_id').val();
            var reply_id = $(this).siblings('.reply_id').val();
            var params = {"user_id": id, "reply_id": reply_id, "reply_vote_flag": "1"};
            var btn = $(this);
            $.ajax({
                url: '/video/reply/vote',
                type: 'POST',
                data: params,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                success: function (result) {
                    var like_count = btn.siblings(".like_count");
                    var dislike_count = btn.siblings(".dislike_count");
                    switch (result) {
                        case "2"://dislike->like
                            btn.removeClass("btn-default").addClass("btn-primary");
                            btn.siblings(".thumb_down").removeClass("btn-primary").addClass("btn-default");
                            like_count.text(parseInt(like_count.text()) + 1);
                            dislike_count.text(parseInt(dislike_count.text()) - 1);
                            break;
                        case "1"://default->like
                            btn.removeClass("btn-default").addClass("btn-primary");
                            btn.siblings(".thumb_down").removeClass("btn-primary").addClass("btn-default");
                            like_count.text(parseInt(like_count.text()) + 1);
                            break;
                        default://like 취소
                            btn.removeClass("btn-primary").addClass("btn-default");
                            like_count.text(parseInt(like_count.text()) - 1);
                            break;
                    }
                }
            });

        });
        //비추
        $('.thumb_down').on('click', function () {

            var id = $(this).siblings('.user_id').val();
            var reply_id = $(this).siblings('.reply_id').val();
            var params = {"user_id": id, "reply_id": reply_id, "reply_vote_flag": "-1"};
            var btn = $(this);
            $.ajax({
                url: '/video/reply/vote',
                type: 'POST',
                data: params,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                success: function (result) {
                    var like_count = btn.siblings(".like_count");
                    var dislike_count = btn.siblings(".dislike_count");
                    switch (result) {
                        case "-2"://like->dislike
                            btn.removeClass("btn-default").addClass("btn-primary");
                            btn.siblings(".thumb_up").removeClass("btn-primary").addClass("btn-default");
                            like_count.text(parseInt(like_count.text()) - 1);
                            dislike_count.text(parseInt(dislike_count.text()) + 1);
                            break;
                        case "-1"://default->dislike
                            btn.removeClass("btn-default").addClass("btn-primary");
                            btn.siblings(".thumb_up").removeClass("btn-primary").addClass("btn-default");
                            dislike_count.text(parseInt(dislike_count.text()) + 1);
                            break;
                        default://dislike 취소
                            btn.removeClass("btn-primary").addClass("btn-default");
                            dislike_count.text(parseInt(dislike_count.text()) - 1);
                            break;
                    }
                }
            });
        });
    </script>
    <script src="https://www.youtube.com/iframe_api"></script>

</div>
</body>
</html>