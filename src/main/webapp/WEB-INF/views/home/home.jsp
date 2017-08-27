<%@ page import="org.project.media_comment.domain.UserVO" %>
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
    <!-- custom css-->
    <link rel="stylesheet" href="/resources/assets/home.css">


</head>
<body>

<%UserVO vo = (UserVO) session.getAttribute("login");%>
<div class="content">
    <div class="content hssa m-left">
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                    <div class="ads-bg-top">
                        <%if(vo!=null){%>
                            <a href="/user/logout" class="btn btn-primary">로그아웃</a>
                            <a href="/video/upload" class="btn btn-primary">업로드</a>
                        <%}else{%>
                            <a href="/user/login" class="btn btn-primary">로그인</a>
                        <%}%>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search for...">
                                    <span class="input-group-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
                                </div><!-- /input-group -->
                            </div><!-- /.col-lg-6 -->
                        </div><!-- /.row -->
                    </div>
                    <div class="title-topic">
                        <span>토픽</span>
                    </div>
                    <ul class="list-unstyled video-list-thumbs row">
                        <c:forEach items="${list}" var="vo">
                            <li class="col-lg-3 col-sm-4 col-xs-6">
                                <a href="video/${vo.video_id}">
                                    <img src="https://img.youtube.com/vi/${vo.video_code}/hqdefault.jpg"
                                         class="img-responsive" height="130px"/>
                                        ${vo.video_title}
                                    <i class="fa fa-play-circle-o"></i>
                                    <span class="duration">03:15</span>
                                    <span class="time">1 ㄴ</span>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>

                </div>
            </div>
            <div class="tool-ft hidden-lg">
                <button id="dbClickft" onclick="controlSiderBar()" type="button"
                        class="btn btn-primary btn-circle btn-lg"><i class="fa fa-bars"></i></button>
            </div>
        </div>
    </div>
</div>

<script>
    (function ($) {
        $(window).on("load", function () {
            $(".my-sideber").mCustomScrollbar({theme: "dark-3"});
        });
    })(jQuery);

    function controlSiderBar() {
        $(".sidebar.left").css({"display": "none"});
        $(".hssa").removeClass("m-left");
        $(".changer").removeClass("fa-times").addClass("fa-bars");
        //Star
        //$(".col-md-10").removeClass( "col-md-10" ).addClass("col-md-12");
        //End
        $('#dbClick').dblclick(function () {
            $(".sidebar.left").css({"display": "block"});
            $(".hssa").addClass("m-left");
            $(".changer").removeClass("fa-bars").addClass("fa-times");
            //Star
            //$(".col-md-12").removeClass( "col-md-10" ).addClass("col-md-10");
            //End
        });
        $('#dbClickft').dblclick(function () {
            $(".sidebar.left").css({"display": "block"});
            $(".hssa").addClass("m-left");
        });
    }
</script>

</body>
</html>