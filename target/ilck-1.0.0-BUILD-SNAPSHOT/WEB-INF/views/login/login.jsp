<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:1000px;
		margin:auto;
		text-align:center;
	}
	h2 {
		font-size:20px;
	}
	section div {
		margin-top:10px;
	}
	section input[type=text] {
      width:300px;
      height:42px;
      border:1px solid #cccccc;
      padding-left:10px;
      border-radius:3px; 
   }
   section input[type=password] {
      width:300px;
      height:42px;
      border:1px solid #cccccc; 
      padding-left:10px; 
      border-radius:3px;
   }
   section input[type=submit] {
      width:300px;
      height:40px;
      border:1px solid #4776b4; 
      background:#4776b4;
      color:white;
      font-weight:bold;
      font-size:15px;
      cursor:pointer;
      border-radius:3px;
   }
    section #l1 {
      display:inline-block;
      width:90px;
      height:20px;
      font-size:12px;
      padding:10px;
      font-weight:500;
      cursor:pointer;
   }
    section #l2 {
      display:inline-block;
      width:90px;
      height:20px;
      font-size:12px;
      padding:10px;
      font-weight:500;
      cursor:pointer;
   }
   	section #l3 {
	  font-size:15px;
	  font-weight:700;    
   	}
   	
   	section #l4 {
   	  color:#4776b4;
   	  font-weight:bold;
   	  text-decoration:none;
   	} 	
   	
   	#popup {
	position: fixed;
	top: 0;
    right: 0;
	bottom: 0;
	left: 0;
	display:none;
}

.popup_layer {
	position: relative;
	left:785px;
	top:335px;
	width: 340px;
	height: 110px;
	padding-bottom: 40px;
	background: #fff;
	z-index: 10;
}

.text_area {
	padding: 30px 30px 30px;
	text-align: center;
	font-weight:bold;
	font-size:15px;
	color:#020202;
	background:#fff;
}

.btn_area {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	height: 50px;
	overflow: hidden;
}

.btn {
	width: 100%;
	height: 100%;
	font-size: 16px;
	color:#4776b4;
	font-weight: bold;
	border: 0;
	background: #f5f5f5;
	text-decoration:none;
}
.popup_dimmed {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: #000;
	opacity: 0.3;
}	
</style>
<script>	
	function close()
	{
		document.getElementById("popup").style.display="none";
	}
</script>
</head>	
<body>

<div id="popup">
	<div class="popup_layer">
		<div class="text_area">
			<strong class="title"></strong>
			<p class="text">아이디,비밀번호를 확인해주세요.</p>
		</div>
		<div class="btn_area">
			<button type="button" name="button" class="btn"><a href="javascript:close();" style="text-decoration:none;color:#4776b4;">확인</a></button>
		</div>
	</div>
	<div class="popup_dimmed"></div>
</div>



<section>
	<form method="post" action="login_ok">
		<h2> 로그인 </h2>
		<br>
		<div> <input type="text" name="userid" placeholder="아이디를 입력해주세요"> </div>
        <div> <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요"> </div>
        <span id="l1" onclick=""> 아이디 찾기 </span>|  
        <span id="l2" onclick=""> 비밀번호 찾기 </span>              
        <div> <input type="submit" value="로그인"> </div>
        <div class="or-seperator"><b>or</b></div>
        <div id="kakaologin">
        	<div class="kakaobtn">
        		<input type="hidden" name="kakaoemail" id="kakaoemail">
        		<input type="hidden" name="kakaoname" id="kakaoname">
        		<a href="">
        			<img src="../resources/img/kakao_login_medium_wide.png">
        		</a>
        	</div>
        </div>
        <br>
        <div id=l3>아직 회원이 아니신가요? <a href="../member/member_input" id="l4">회원가입 하러가기</a></div>
	</form>
	</section>
<script>
<c:if test="${chk == 1}">
document.getElementById("popup").style.display="block";
</c:if>
</script>
</body>
</html>

