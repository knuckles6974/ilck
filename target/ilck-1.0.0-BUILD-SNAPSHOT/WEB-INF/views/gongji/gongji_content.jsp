<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style>

        section
        {
            width:1000px;
            height:800px;
            margin:auto;
            padding-top:50px;
        }

        section tr
        {
            text-align:center;
        }

        section #imsi
        {
            margin-top:30px;
        }

        section #guan
        {
            width:120px;
            height:30px;
            border:1px solid purple;
            padding-top:9px;
            text-align:center;
            display:inline-block;
            margin:15px;
        }

        section a
        {
            text-decoration:none;
            color:black;
        }

    </style>
</head>
<body>
<section>

    <table width="800" border="1" align="center">
        <tr>
            <td height="40">제 목</td>
            <td colspan="3">
                <c:if test="${gvo.important==1}">
                    <span style="color:#ff4400; font-size:16px;">[중요]</span>
                </c:if>
                ${gvo.title}
            </td>
        </tr>
        <tr>
            <td width="150">조회수</td>
            <td width="250">${gvo.readnum}</td>
            <td width="150">작성일</td>
            <td width="250">${gvo.writeday}</td>
        </tr>
        <tr>
            <td height="550">내용</td>
            <td colspan="3">${gvo.content}</td>
        </tr>
    </table>

    <div align="center" id="imsi">
        <div id="guan"> <a href="../gongji/gongji?page=${page}"> 목 록 </a></div>

        <c:if test="${userid=='admin'}">
            <div id="guan"> <a href="../gongji/gongji_update?id=${gvo.id}&page=${page}"> 수 정 </a></div>
            <div id="guan"> <a href="../gongji/gongji_delete?id=${gvo.id}&page=${page}"> 삭 제 </a></div>
        </c:if>

    </div>

</section>
</body>
</html>