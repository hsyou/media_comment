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

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">

            <a class="navbar-brand" href="./">
                <img class="img-logo" src="data:image/png;base64,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">
            </a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li id="open-sidebar" style="">
                    <a id="dbClick" onclick="controlSiderBar()"><i class="changer fa fa-bars"></i></a>
                </li>

            </ul>
            <form class="navbar-form navbar-left form-search hidden-xs" role="search" method="get" action="">
                <div class="input-group">
                    <input type="text" class="form-control form-search search-ip" placeholder="Search   " name="" />
                    <div class="input-group-btn">
                        <button class="btn btn-default btn-search" type="submit"><i class="fa fa-search"></i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</nav>
<div class="mn-top">
    <p class="hidden-xs">
        <a class="active-mn-top" href="./">탭1</a>
        <a href="#">탭2</a>
        <a href="#">탭3</a>
    </p>
</div>
<div class="content">
    <div class="sidebar left ">
        <div class="my-sideber">
            <div>
                <div class="m-t-60"></div>
                <div class="p-10">
                    <a href="./">
                        <div class="id-ctgr actv-side">
                            <i class="fa fa-home"></i>
                            사이드
                        </div>
                    </a>
                    <a href="#">
                        <div class="id-ctgr item-sub">
                            <i class="fa fa-home"></i>
                            아이템 서브
                        </div>
                    </a>
                    <h5><i class="fa fa-folder-open"></i> 오픈형</h5>
                    <hr class="style10">
                    <a href="#">
                        <div class="id-ctgr item-sub">
                            <i class="fa fa-play"></i>
                            아이템 서브
                        </div>
                    </a>
                    <a href="#">
                        <div class="id-ctgr item-sub">
                            <i class="fa fa-play"></i>
                            아이템 서브
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="content hssa m-left">
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                    <div class="ads-bg-top">
                        <a target="_blank" href="#">
                            <img class="img-responsive" width="970" height="250" src="http://placehold.it/970x250">
                        </a>
                    </div>
                    <div class="title-topic">
                        <span>토픽</span>
                    </div>
                    <ul class="list-unstyled video-list-thumbs row">
                        <c:forEach items="${list}" var="vo">
                        <li class="col-lg-3 col-sm-4 col-xs-6">
                            <a href="video/${vo.video_id}">
                                <img src="https://img.youtube.com/vi/${vo.video_code}/hqdefault.jpg" class="img-responsive" height="130px" />
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
                <button id="dbClickft" onclick="controlSiderBar()" type="button" class="btn btn-primary btn-circle btn-lg"><i class="fa fa-bars"></i></button>
            </div>
        </div>
    </div>
</div>

<script>
    (function($){
        $(window).on("load",function(){
            $(".my-sideber").mCustomScrollbar({theme:"dark-3"});
        });
    })(jQuery);
    function controlSiderBar() {
        $(".sidebar.left").css({"display": "none"});
        $(".hssa").removeClass( "m-left" );
        $(".changer").removeClass( "fa-times" ).addClass("fa-bars");
        //Star
        //$(".col-md-10").removeClass( "col-md-10" ).addClass("col-md-12");
        //End
        $('#dbClick').dblclick(function () {
            $(".sidebar.left").css({"display": "block"});
            $(".hssa").addClass( "m-left" );
            $(".changer").removeClass( "fa-bars" ).addClass("fa-times");
            //Star
            //$(".col-md-12").removeClass( "col-md-10" ).addClass("col-md-10");
            //End
        });
        $('#dbClickft').dblclick(function () {
            $(".sidebar.left").css({"display": "block"});
            $(".hssa").addClass( "m-left" );
        });
    }
</script>

</body>
</html>