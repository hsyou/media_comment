<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.project.media_comment.domain.MypageVO" %>
<%@ page import="java.util.*" %>
<%@ page import="org.project.media_comment.domain.VideoVO" %>
<%@ page import="org.project.media_comment.domain.UserVO" %>
<%@ page import="org.springframework.security.core.userdetails.User" %>
<%@ page import="org.project.media_comment.domain.MyInfoVO" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title> New Document </title>

    <meta charset= "utf-8">
    <meta name="Generator" content="EditPlus">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">


    <!-- Bootstrap Core CSS -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/assets/mylists.css" rel="stylesheet">


    <script type="text/javascript">

        function govideo(videonum){
            var a= "/video/"+videonum.toString();
            location.href=a;

        }

    </script>


</head>

<body>

<div>
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
    <div class="mail-box">
        <aside class="sm-side">
            <%
                UserVO userVO=(UserVO)session.getAttribute("login");
            %>
            <!-- 유저정보 -->
            <div class="user-head">
                <a class="inbox-avatar" href="javascript:;">
                    <img  width="64" hieght="60" src="http://bootsnipp.com/img/avatars/ebeb306fd7ec11ab68cbcaa34282158bd80361a7.jpg">
                </a>
                <div class="user-name">
                    <h5><%=userVO.getUser_nickname()%>></h5>
                    <span><%=userVO.getUser_email()%></span>
                </div>
                <a class="mail-dropdown pull-right" >
                    <i class="fa fa-chevron-left"></i>
                </a>

            </div>

            <!--메뉴들-->
            <ul class="inbox-nav inbox-divider">
                <%
                    String type=(String)request.getAttribute("mypage");
                    if(type==null)type="";
                %>
                <%if(type.equals("myrecent")){%>
                <li class="active">
                        <%}else{%>
                <li>
                    <%}%>
                    <a href="/Mypage/mypage"><i class="fa fa-eye"></i> 최근 열람 게시글 </a>

                </li>
                <%if(type.equals("mypost")){%>
                <li class="active">
                        <%}else{%>
                <li>
                    <%}%>
                    <a href="/Mypage/mypost"><i class="fa fa-film"></i> 내 게시글 </a>
                </li>
                <%if(type.equals("myfavorite")){%>
                <li class="active">
                        <%}else{%>
                <li>
                    <%}%>
                    <a href="/Mypage/myfavorite"><i class="fa fa-film"></i> 즐겨찾기 </a>
                </li>
                <%if(type.equals("notice")){%>
                <li class="active">
                        <%}else{%>
                <li>
                    <%}%>
                    <a href="/Mypage/notice"><i class="fa fa-bookmark-o"></i> 새 알림 <span class="label label-danger pull-right">2</span> </a>
                </li>
                <%if(type.equals("setting")){%>
                <li class="active">
                        <%}else{%>
                <li>
                    <%}%>
                    <a href="/Mypage/setting"><i class=" fa fa-cog"></i> 개인설정 <span class="label label-info pull-right">30</span></a>
                </li>

            </ul>

            <!-- 아래 추가 메뉴
              <div class="inbox-body text-center">
                  <div class="btn-group">
                      <a class="btn mini btn-primary" href="javascript:;">
                          <i class="fa fa-plus"></i>
                      </a>
                  </div>
                  <div class="btn-group">
                      <a class="btn mini btn-success" href="javascript:;">
                          <i class="fa fa-phone"></i>
                      </a>
                  </div>
                  <div class="btn-group">
                      <a class="btn mini btn-info" href="javascript:;">
                          <i class="fa fa-cog"></i>
                      </a>
                  </div>
              </div>
            -->


        </aside>



        <aside class="lg-side">
            <div class="inbox-head">
                <h3>Media comment</h3>
                <form action="#" class="pull-right position">
                    <div class="input-append">
                        <input type="text" class="sr-input" placeholder="Search video">
                        <button class="btn sr-btn" type="button"><i class="fa fa-search"></i></button>
                    </div>
                </form>
            </div>
            <div class="inbox-body">
                <%=type%>
                <table class="table table-inbox table-hover">
                    <tbody>


                    <%

                        if(type.equals("setting")) {
                            MyInfoVO myinfo = (MyInfoVO)request.getAttribute("myinfo");
                            List<String> hashlist = (List<String>)request.getAttribute("li");
                            if(myinfo==null) myinfo=new MyInfoVO();
                            if(hashlist==null) hashlist=new ArrayList();

                    %>
                    <tr>
                        <td >
                            <%=userVO.getUser_nickname()%>
                        </td>
                        <td>
                            [exp: <%=userVO.getUser_exp()%>]
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">email: <%=userVO.getUser_email()%></td>
                    </tr>
                    <tr>
                        <td>total post: <%=myinfo.getVideoCnt()%></td>
                        <td>total reply: <%=myinfo.getReplyCnt()%></td>
                    </tr>
                    <tr>
                        <td colspan="2">Hashtags:</td>
                    </tr>
                    <tr>
                        <td><%for(String tmp:hashlist){%> <span> <%=tmp%> </span> <%}%></td>
                        <td> <p> edit </p> </td>
                    </tr>

                    <tr>
                        <td>닉네임변경</td><td>패스워드변경</td>
                    </tr>
                    <%
                    }
                    else if(type.equals("notice")){

                    }
                    else{
                        List list=(List)request.getAttribute("views");

                        if(list!=null && list.size()>0){
                            for(Object obj : list){
                                String videoName="";
                                int videoId=0;
                                String videoContent="";
                                Date videoDate= new Date();
                                String videoCode="";
                                if(obj instanceof MypageVO){
                                    videoName=((MypageVO) obj).getVideo_title();
                                    videoId=((MypageVO) obj).getVideo_id();
                                    videoContent = ((MypageVO) obj).getVideo_content();
                                    videoDate= ((MypageVO) obj).getView_log_date();
                                    videoCode=((MypageVO) obj).getVideo_code();
                                }
                                else if( obj instanceof VideoVO){
                                    videoName=((VideoVO) obj).getVideo_title();
                                    videoId=((VideoVO) obj).getVideo_id();
                                    videoContent = ((VideoVO) obj).getVideo_content();
                                    videoDate= ((VideoVO) obj).getVideo_post_date();
                                    videoCode=((VideoVO) obj).getVideo_code();
                                }
                    %>

                    <tr class="unread" onclick="govideo(<%= videoId %>)">

                        <td class="view-sumnail"> <img class= "sumnail" src="https://img.youtube.com/vi/<%=videoCode%>/2.jpg" /></td>

                        <td class="view-message  dont-show"><%=videoName%></td>
                        <td class="view-message "><%=videoContent%></td>

                        <td class="view-message  text-right"><%=videoDate%></td>

                        <td class="inbox-small-cells">
                            <i class="fa fa-trash"></i>
                        </td>

                    </tr>
                    <%
                        }}
                    else {
                    %>

                    <tr class="unread" >

                        <td text-align="middle">
                            Nothing to show.
                        </td>

                    </tr>

                    <%
                            }
                        }
                    %>
                    <!--
                  <tr class="unread">
                      <td class="view-sumnail"> <img class= "sumnail" src="https://img.youtube.com/vi/nVCubhQ454c/2.jpg" /></td>

                      <td class="view-message  dont-show">비디오 이름</td>
                      <td class="view-message ">베스트 댓글 </td>

                      <td class="view-message  text-right">9:27 AM</td>

                      <td class="inbox-small-cells">
                          <i class="fa fa-trash"></i>
                      </td>
                  </tr>
                  <tr class="">
                      <td class="view-sumnail"> <img class= "sumnail" src="https://img.youtube.com/vi/nVCubhQ454c/2.jpg" /></td>

                      <td class="view-message  dont-show">비디오 이름</td>
                      <td class="view-message ">베스트 댓글 </td>

                      <td class="view-message  text-right">9:27 AM</td>

                      <td class="inbox-small-cells">
                          <i class="fa fa-trash"></i>
                      </td>
                  </tr>
                  -->

                    </tbody>
                </table>
            </div>
        </aside>
    </div>
</div>



</body>
</html>
