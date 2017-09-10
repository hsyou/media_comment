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

    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

    <!-- bootstrap -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"
            type="text/javascript"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
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

        .reply_box {
            position: absolute;
            z-index: 999;
            padding: 25px;
        }

        .float_reply {
            width: 100%;
            font-weight: bold;
            padding: 2px;
            background-color:white;
        }
    </style>
</head>
<body style="background-color:#9da6a9">
<%UserVO vo = (UserVO) session.getAttribute("login");%>
<div class="col-md-6 col-md-offset-3 main_frame">
    <%if (vo == null) {%>
    <a href="/user/login">로그인</a>
    <%} else {%>
    <a href="/user/logout">로그아웃</a>
    <%}%>
    <div id="video_box">
        <iframe width="854" height="480" id="player"
                src="https://www.youtube.com/embed/${videoVO.video_code}?enablejsapi=1"
                frameborder="0"
                allowfullscreen></iframe>
    </div>

    <div class="panel panel-default">
        <div class="panel-body row">
            <span id="tag"><c:forEach var="hash" items="${hash}"><a
                    href="#">#${hash.hashtag}</a>&nbsp;</c:forEach></span>
            <h1>${videoVO.video_title}</h1>
            <h3>${videoVO.user_id}</h3>
            <h3> 조회수 : ${videoVO.video_hit}회</h3>
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

        Map = function () {

            this.map = new Object();

        };

        Map.prototype = {

            put: function (key, value) {

                this.map[key] = value;

            },

            get: function (key) {

                return this.map[key];

            },

            containsKey: function (key) {

                return key in this.map;

            },

            containsValue: function (value) {

                for (var prop in this.map) {

                    if (this.map[prop] == value) return true;

                }

                return false;

            },

            isEmpty: function () {

                return (this.size() == 0);

            },

            clear: function () {

                for (var prop in this.map) {

                    delete this.map[prop];

                }

            },

            remove: function (key) {

                delete this.map[key];

            },

            keys: function () {

                var keys = new Array();

                for (var prop in this.map) {

                    keys.push(prop);

                }

                return keys;

            },

            values: function () {

                var values = new Array();

                for (var prop in this.map) {

                    values.push(this.map[prop]);

                }

                return values;

            },

            size: function () {

                var count = 0;

                for (var prop in this.map) {

                    count++;

                }

                return count;

            }

        };


        var player;

        var time;

        var counter_flag = true;

        //api ready
        function onYouTubeIframeAPIReady() {
            player = new YT.Player('player');
            player.addEventListener('onStateChange', function (e) {
                switch (e.data) {
                    case 0://종료
                        break;
                    case 1://재생중
                        counter_flag = true;
                        break;
                    case 2://일시정지
                        counter_flag = false;
                }
            });
            var offset = $("#player").offset();
            //타이머
            setInterval(function () {
                if (counter_flag) {
                    time = Math.floor(player.getCurrentTime());
                    <c:forEach var="best" items="${best}">
                    if (time >=${best.reply_playtime} && time <= ${best.reply_playtime}+5) {
                        callReply(${best.reply_id}, "${best.reply_content}", ${best.reply_x}, ${best.reply_y}, ${best.reply_playtime});
                    } else {
                        hideReply(${best.reply_id});
                    }
                    </c:forEach>

                }
            }, 1000);

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

        var reply_map = new Map();

        //리플 관리
        function callReply(id, comment, x, y) {
            if (reply_map.containsKey(id)) {
                showReply(id);
                reply_map.put(id, 1);
            } else {
                //create
                reply_map.put(id, 1);

                $('<div id="reply_box' + id + '" class="reply_box"><span id="float_reply' + id + '" class="float_reply">' + comment + '</span></div>').appendTo("#video_box").draggable({
                    containment: $("#video_box")// 부모요소 안에 종속
                });

                $("#reply_box" + id).offset({left: $("#player").offset().left + x, top: $("#player").offset().top + y});

            }

        }

        //리플 감추기
        function hideReply(id) {
            if (reply_map.get(id) === 1) {
                reply_map.put(id, 0);
                console.log("hide!");
                console.log("offset x : " + $("#reply_box" + id).position().left + ", offset y : " + $("#reply_box" + id).position().top);
                $("#reply_box" + id).hide();
            }
        }

        //리플 보여주기
        function showReply(id) {
            $("#reply_box" + id).show();
            reply_map.put(id, 1);
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