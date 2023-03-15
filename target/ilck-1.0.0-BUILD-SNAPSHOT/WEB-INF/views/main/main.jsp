<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style>
		section {
			width:1000px;
			height:1000px;
			margin:auto;
		}
		section div {
			text-align:center;
		}
		#mimage {
			position:relative;
			top:-8px;
			width:1000px;
			height:310px;
			overflow:hidden;
			margin:auto;

		}
		#msub {
			width:3000px;
			height:300px;
			margin-left:0px;

		}
		#maintitle{
			position:relative;
			top:35px;
		}
		#mquality {
			position:relative;
			display:inline-block;
			left:3px;
			top:49px;
		}
		#table {
			position:relative;
			top:50px;
		}
		#table td {
			vertical-align:top;
			border:1px solid #cccccc;
			padding:0px;
			height:275px;
		}
		#table #ptitle {
			font-size:14px;
			display:inline-block;
			padding-top:5px;
			padding-left:5px;
			align:left;
		}
		#table #pprice {
			font-weight:bold;
			display:inline-block;
			padding-top:5px;
			padding-left:5px;
			align:left;
			font-size:15px;
		}
		#table #pwriteday {
			position:relative;
			left:47px;
			display:inline-block;
			align:right;
			flow:right;
			font-size:12px;
		}
	</style>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		$(function()
		{
			move();

			$("#mimage").mouseover(function()
			{
				clearInterval(ss);
			});
			$("#mimage").mouseout(function()
			{
				move();
			});
		});
		function move()
		{
			ss=setInterval(function()
			{
				$("#msub").animate(
						{
							marginLeft:"-1000px"
						},2000,function()
						{
							$("#msub > img").eq(0).insertAfter( $("#msub > img").eq(4) );
							$("#msub").css("margin-left","0px");
						});
			},4000);
		}

	</script>
</head>
<body>
<div id="mimage">
	<div id="msub">
		<img src="../resources/main/1.jpg" width="1000" height="310">
		<img src="../resources/main/2.jpg" width="1000" height="310">
		<img src="../resources/main/3.jpg" width="1000" height="310">
		<img src="../resources/main/4.jpg" width="1000" height="310">
		<img src="../resources/main/5.jpg" width="1000" height="310">
	</div>
</div>

<section>
	<div id="maintitle" style="font-size:25px;font-weight:bold;flow:left;display:inline-block;">오늘의 상품을 추천해드려요</div>
	<div id="mquality"><img src="../resources/main/quality.png" width="50" height="50"></div>
	<table align="center" width="1000" id="table">
		<tr>
			<c:forEach items="${plist}" var="pvo" varStatus="sts">
			<td width="220">
				<div align="center"><img src="../resources/pro/${pvo.pimg}" width="196" height="210"></div>
				<div id="ptitle"> ${pvo.title}</div>
				<div id="pprice"> <fmt:formatNumber value="${pvo.price}" type="number" pattern="#,###"/>원 </div>
				<div id="pwriteday">${pvo.writeday}</div>
			</td>
			<c:if test="${sts.count%5 == 0}">
		</tr>
		<tr>
			</c:if>
			</c:forEach>
		</tr>
	</table>
</section>
</body>
</html>