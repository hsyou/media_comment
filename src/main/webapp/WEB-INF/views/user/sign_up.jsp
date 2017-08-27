<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- bootstrap -->
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"
            type="text/javascript"></script>

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
    <form method="post" id="frm">
        <input type="text" name="user_email" required class="id" placeholder="ID" id="useremail">
        <input type="text" name="user_nickname" required class="id" placeholder="NICKNAME" id="nickname">
        <input type="password" name="user_password" required class="password" placeholder="Password">
        <input type="password" name="user_password2" required class="password" placeholder="Password" id="repwd">

        <button type="button" onclick="signUp()">Sign up</button>
        <div class="error"><span>+</span></div>
    </form>
</div>
<script>
    var flag =0;
    var flag2=0;
    var flag3=0;
    function signUp() {

        checkId();


    }


    //     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var pwdCheck = 0;
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    function valid_email(email){
        re=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if(email.length < 6 || !re.test(email)){
            alert("메일 형식이 맞지 않습니다. \n 다시 입력해주세요. \n");

            email.select();
            email.focus();
             return false;
        }else {
            return true;
        }
    }
    function checkId() {
        var inputed = $('.id').val();
        $.ajax({
            data: {
                id: inputed
            },
            url: "checkId",
            type: "get",
            success: function (data) {


                if (inputed == "" && data == '0') {
                    alert("이메일을 기입ㄹ하세요");
                    flag = 0;
                } else if (data == '0') {
                    flag = 1;
                    signupCheck();
                } else if (data == '1') {
                    alert("이메일 중복");
                    flag = 0;
                }
            }
        });
    }
    function checkPwd() {
        console.log("777777777777");
        var inputed = $('.password').val();
        var reinputed = $('#repwd').val();
        if (reinputed == "" && (inputed != reinputed || inputed == reinputed)) {
            flag2=0;
            alert("비밀번호 입력하세요");
        }
        else if (inputed == reinputed) {
            flag2=1;
            if(flag==1&&flag2==1&&flag3==1) {
                console.log("실행됩니다.");
                if(valid_email($("#useremail").val())){
                    $("#frm").submit();
                }
            }
        } else if (inputed != reinputed) {
            alert("비번 다릅니다");
            flag2=0;
        }
    }
    //닉네임과 이메일 입력하지 않았을 경우 가입버튼 비활성화
    function signupCheck() {
        var nickname = $("#nickname").val();
        var email = $("#useremail").val();
        if (nickname == "" || email == "") {
           flag3=0;
            alert("닉네임,이메일 쓰세요");
        } else {
            flag3=1;
            checkPwd();
        }
    }
</script>
</body>
</html>