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


</head>
<style>

    .video-list-thumbs {
    }

    .video-list-thumbs > li {
        margin-bottom: 12px;
    }

    .video-list-thumbs > li:last-child {
    }

    .video-list-thumbs > li > a {
        display: block;
        position: relative;
        background-color: #111;
        color: #fff;
        padding: 8px;
        border-radius: 3px
        transition: all 500ms ease-in-out;
        border-radius: 4px
    }

    .video-list-thumbs > li > a:hover {
        box-shadow: 0 2px 5px rgba(0, 0, 0, .3);
        text-decoration: none
    }

    .video-list-thumbs h2 {
        bottom: 0;
        font-size: 14px;
        height: 33px;
        margin: 8px 0 0;
    }

    .video-list-thumbs .glyphicon-play-circle {
        font-size: 60px;
        opacity: 0.6;
        position: absolute;
        right: 39%;
        top: 31%;
        text-shadow: 0 1px 3px rgba(0, 0, 0, .5);
        transition: all 500ms ease-in-out;
    }

    .video-list-thumbs > li > a:hover .glyphicon-play-circle {
        color: #fff;
        opacity: 1;
        text-shadow: 0 1px 3px rgba(0, 0, 0, .8);
    }

    .video-list-thumbs .duration {
        background-color: rgba(0, 0, 0, 0.4);
        border-radius: 2px;
        color: #fff;
        font-size: 11px;
        font-weight: bold;
        left: 12px;
        line-height: 13px;
        padding: 2px 3px 1px;
        position: absolute;
        top: 12px;
        transition: all 500ms ease;
    }

    .video-list-thumbs > li > a:hover .duration {
        background-color: #000;
    }

    @media (min-width: 320px) and (max-width: 480px) {
        .video-list-thumbs .glyphicon-play-circle {
            font-size: 35px;
            right: 36%;
            top: 27%;
        }

        .video-list-thumbs h2 {
            bottom: 0;
            font-size: 12px;
            height: 22px;
            margin: 8px 0 0;
        }
    }
    .header{
        margin:3%
    }
</style>
<body>

<div class="container header text-center"><a href="/user/login" class="btn btn-primary text-center">로그인</a></div>
<div class="container" style="margin-top: 5%;">
    <div class="col-md-6 col-md-offset-3">

        <!-- Search Form -->
        <form role="form">
            <!-- Search Field -->
            <div class="row">
                <h1 class="text-center">Thattube</h1>

                <div class="form-group">
                    <div class="input-group">
                        <input class="form-control" type="text" name="search" placeholder="Search" required/>
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="submit">
                                <span class="glyphicon glyphicon-search" aria-hidden="true">
                                    <span style="margin-left:10px;">Search</span></span></button>
                        </span>
                    </div>
                </div>
            </div>

        </form>
        <!-- End of Search Form -->

    </div>
    <div class="col-md-12 col-lg-12">
        <ul class="list-unstyled video-list-thumbs row">
            <c:forEach items="${list}" var="vo">
                <li class="col-lg-3 col-sm-4 col-xs-6">
                    <a href="video/${vo.video_id}">
                        <img class="img-responsive" alt="video" height="130px"
                             src="https://img.youtube.com/vi/${vo.video_code}/hqdefault.jpg">
                        <h2>${vo.video_title}</h2>
                        <span class="glyphicon glyphicon-play-circle"></span>
                        <span class="duration"></span>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
    <%--<div class="col-md-12 col-lg-12">--%>
    <%--<c:forEach items="${list}" var="vo">--%>
    <%--<div class="col-md-2 col-lg-2 list">--%>
    <%--<div></div>--%>

    <%--<a href="video/${vo.video_id}" target="_black">--%>
    <%--<img alt="동영상" src="https://img.youtube.com/vi/${vo.video_code}/hqdefault.jpg">--%>
    <%--</a>--%>

    <%--<div>--%>
    <%--<span>동영상 제목 : ${vo.video_title}</span>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</c:forEach>--%>
    <%--</div>--%>
</div>


</body>
</html>