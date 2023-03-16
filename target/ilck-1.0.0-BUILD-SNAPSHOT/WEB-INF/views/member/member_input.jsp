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
	    height:800px;
		margin:auto;
		text-align:center;
	}
	h2 {
		font-weight:700;
		font-size:25px;
	}
	table {
		border-collapse:separate;
		border-spacing: 0 10px;
		border-top:2px solid black;
		border-bottom:1px solid black;
	}
	section table input[type=text] {
		width:320px;
		height:43px;
	    border:1px solid #cccccc;
	    padding-left:10px;
	    border-radius:3px;
	}
	section table input[type=password] {
	    width:320px;
		height:43px;
	    border:1px solid #cccccc;
	    padding-left:10px;
	    border-radius:3px;
	}
    section table input[type=button] {
	    width:110px;
		height:50px;
	    border:1px solid #4776b4;
	    border-radius:3px;
	    background:white;
	    color:#4776b4;
	    font-weight:900;
	    cursor:pointer;
	    valign:center;
	}
	section input[type=submit] {
      width:230px;
      height:55px;
      border:1px solid #4776b4; 
      background:#4776b4;
      color:white;
      font-weight:bold;
      font-size:15px;
      cursor:pointer;
      border-radius:3px;
   }
   
   	section #umsg {
   		padding-left:20px;
   		font-size:12px;
   	}
   	section #pmsg1 {
   		padding-left:20px;
   		font-size:12px;
   	}
   	section #pmsg2 {
   		padding-left:20px;
   		font-size:12px;
   	}
   	section #emsg {
   		padding-left:20px;
   		font-size:12px;
   	}
</style>
<script>
var uchk=0;
function userid_check()
{
	var userid=document.pkc.userid.value;
	if(userid.length < 6)
	{
		alert("아이디의 길이는 6자 이상이여야 합니다");
	}
	else
	{
		var chk=new XMLHttpRequest();
		
		chk.onload=function()
		{
			if(chk.responseText=="0")
			{
				document.getElementById("umsg").innerText="사용 할 수 있는 아이디 입니다";
				document.getElementById("umsg").style.color="#4776b4";
				uchk=1;
			}
			else
			{
				document.getElementById("umsg").innerText="사용 불가능한 아이디 입니다";
				document.getElementById("umsg").style.color="red";
				uchk=0;
			}
		}
		
		chk.open("get","userid_check?userid="+userid);
		chk.send();
	}	
}

function pwd_check1()
{
	var pwd=document.pkc.pwd.value;
	document.getElementById("pmsg1").innerText="최소 10자 이상 입력"
	document.getElementById("pmsg1").style.color="red";
	
	if(pwd.length > 9)
	{
		document.getElementById("pmsg1").innerText=""
	}
}

var pchk=0;
function pwd_check2()
{
	var pwd=document.pkc.pwd.value;
	var pwd2=document.pkc.pwd2.value;
	document.getElementById("pmsg2").innerText="동일한 비밀번호를 입력"
    document.getElementById("pmsg2").style.color="red";
	
	if(pwd==pwd2)
	{
		document.getElementById("pmsg2").innerText=""
	}
	pchk=1;
}

var echk=0;
function email_check()
{
    var chk=new XMLHttpRequest();
	var email=document.pkc.email.value;
		
	chk.onload=function()
	{
		if(chk.responseText=="0")
		{
			document.getElementById("emsg").innerText="사용 할 수 있는 이메일 입니다";
			document.getElementById("emsg").style.color="#4776b4";
			echk=1;
		}
		else
		{
			document.getElementById("emsg").innerText="중복된 이메일 입니다";
			document.getElementById("emsg").style.color="red";
			echk=0;
		}
	}
		
		chk.open("get","email_check?email="+email);
		chk.send();	
}

function form_check()
{
	if(uchk==0)
	{
		alert("아이디 중복확인을 하세요");
		return false;
	}
	else if(pchk==0)
	{
		alert("비밀번호가 일치하지 않습니다");
		return false;
	}
	else if(echk==0)
	{
		alert("이메일 중복확인을 하세요");
		return false;
	}
	else
	{
		return ture;
	}
}
</script>
</head>
<body>
	<section>
		<form name="pkc" method="post" action="member_input_ok" onsubmit="return form_check()">
			<h2> 회원가입</h2>
			<br>
			<br>
			<br>
			<table align="center" style="width:600px">
				<tr>
					<td align="left" style="font-weight:bold;font-size:14px;"> 아이디 </td>
					<td> <input type="text" name="userid" placeholder="아이디를 입력해주세요"> </td>
					<td> <input type="button" onclick="userid_check()" value="중복확인"> </td>
				</tr>
				<tr>
					<td> </td>
					<td align="left" id="umsg"> </td>
					<td> </td>
				</tr>
				<tr>
					<td align="left" style="font-weight:bold;font-size:14px;"> 비밀번호 </td>
					<td> <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요" oninput="pwd_check1()"> </td>
				</tr>
				<tr>
					<td> </td>
					<td align="left" id="pmsg1"> </td>
					<td> </td>
				</tr>
				<tr>
					<td align="left" style="font-weight:bold;font-size:14px;"> 비밀번호확인 </td>
					<td> <input type="password" name="pwd2" placeholder="비밀번호를 한번 더 입력해주세요" oninput="pwd_check2()"></td>
				</tr>
				<tr>
					<td> </td>
					<td align="left" id="pmsg2"> </td>
					<td> </td>
				</tr>
				<tr>
					<td align="left" style="font-weight:bold;font-size:14px;"> 이름 </td>
					<td> <input type="text" name="name" placeholder="이름을 입력해 주세요"> </td>
				</tr>
				<tr>
					<td align="left" style="font-weight:bold;font-size:14px;"> 이메일 </td>
					<td> <input type="text" name="email" placeholder="예: market@market.com"> </td>
					<td> <input type="button" onclick="email_check()" value="중복확인"></td>
				</tr>
				<tr>
					<td> </td>
					<td align="left" id="emsg"> </td>
					<td> </td>
				</tr>
				<tr>
					<td align="left" style="font-weight:bold;font-size:14px;"> 휴대폰 </td>
					<td> <input type="text" name="phone" placeholder="숫자만 입력해주세요"> </td>
					<td> <input type="button" value="인증번호 받기"> </td>
				</tr>
			</table>
			<br>
			<br>
			<div> <input type="submit" value="가입하기"> </div>
		</form>	
	</section>
</body>
</html>