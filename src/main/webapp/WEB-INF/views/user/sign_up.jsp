<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- bootstrap -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"
            type="text/javascript"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

    <!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="/resources/assets/reset.css">
    <link rel="stylesheet" href="/resources/assets/supersized.css">
    <link rel="stylesheet" href="/resources/assets/style.css">


    <title>Commentube</title>


</head>
<body>
<div class="page-container">
    <h1>Commentube</h1>
    <br/>
    <h3>Sign up your account</h3>
</div>
<div>
    <form method="post">
        <input type="text" name="user_email" required class="id" oninput="checkId()" placeholder="ID" id="useremail">
        <input type="text" name="user_nickname" required class="id" placeholder="NICKNAME" id="nickname">
        <input type="password" name="user_password" required class="password" placeholder="Password">
        <input type="password" name="user_password2" required class="password" placeholder="Password" id="repwd">

        <button type="submit" id="signUpBtn">Sign up</button>
        <div class="error"><span>+</span></div>
    </form>
</div>
<script>

    //     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var pwdCheck = 0;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    function checkId() {
        var inputed = $('.id').val();
        console.log(inputed)
        $.ajax({
            data : {
                id : inputed
            },
            url : "checkId",
            type : "get",
            success : function(data) {
                console.log(data);
                if(inputed=="" && data=='0') {
                    $("#signUpBtn").prop("disabled", true);
                    $("#signUpBtn").css("background", "#aaaaaa");
                    $("#useremail").css("background", "#FFCECE");
                    idCheck = 0;
                } else if (data == '0') {
                    $("#useremail").css("background", "#B0F6AC");
                    idCheck = 1;
                    if(idCheck==1 && pwdCheck == 1) {
                        $("#signUpBtn").prop("disabled", false);
                        $("#signUpBtn").css("background", "#4CAF50");
                        signupCheck();
                    }
                } else if (data == '1') {
                    $("#signUpBtn").prop("disabled", true);
                    $("#signUpBtn").css("background", "#aaaaaa");
                    $("#useremail").css("background", "#FFCECE");
                    idCheck = 0;
                }
            }
        });
    }
    function checkPwd() {
        var inputed = $('.password').val();
        var reinputed = $('#repwd').val();
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
            $("#signUpBtn").prop("disabled", true);
            $("#signUpBtn").css("background", "#aaaaaa");
            $("#repwd").css("background", "#FFCECE");
        }
        else if (inputed == reinputed) {
            $("#repwd").css("background", "#B0F6AC");
            pwdCheck = 1;
            if(idCheck==1 && pwdCheck == 1) {
                $("#signUpBtn").prop("disabled", false);
                $("#signUpBtn").css("background", "#4CAF50");
                signupCheck();
            }
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $("#signUpBtn").prop("disabled", true);
            $("#signUpBtn").css("background", "#aaaaaa");
            $("#repwd").css("background", "#FFCECE");

        }
    }
    //닉네임과 이메일 입력하지 않았을 경우 가입버튼 비활성화
    function signupCheck() {
        var nickname = $("#nickname").val();
        var email = $("#useremail").val();
        if(nickname=="" || email=="") {
            $("#signUpBtn").prop("disabled", true);
            $("#signUpBtn").css("background", "#aaaaaa");
        } else {
        }
    }
    //캔슬버튼 눌렀을 눌렀을시 인풋박스 클리어
    $(".cancelbtn").click(function(){
        $(".id").val(null);
        $(".password").val('');
        $("#signUpBtn").prop("disabled", true);
        $("#signUpBtn").css("background", "#aaaaaa");
    });
</script>
</body>
</html>