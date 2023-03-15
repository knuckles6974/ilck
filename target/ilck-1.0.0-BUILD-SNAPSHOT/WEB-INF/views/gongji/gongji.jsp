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
        }

        section #guan
        {
            width:120px;
            height:30px;
            border:1px solid purple;
            margin-top:50px;
            padding-top:9px;
            text-align:center;
            display:inline-block;
            margin-left:20px;
        }

        section a
        {
            text-decoration:none;
            color:black;
        }

        section #content:hover
        {
            color:#ff4400;
            text-decoration:underline;
        }

    </style>
</head>
<body>
<section>

    <div align="center"><h3> 신고 관리 </h3></div>

    <table width="1000" border="1" align="center">
        <tr align="center">
            <td>제 목</td>
            <td>조회수</td>
            <td>작성일</td>
        </tr>
        <c:if test="${glist.size()==0}">
            <td colspan="4" align="center">공지가 없습니다.</td>
        </c:if>
        <c:forEach items="${glist}" var="gvo">
            <tr align="center" height="35">
                <td width="700">
                    <c:if test="${gvo.important==1}">
                        <span style="color:#ff4400; font-size:16px;">[중요]</span>
                    </c:if>

                    <a href="../gongji/readnum?page=${page}&id=${gvo.id}" id="content" style="font-size:16px;">${gvo.title}</a>
                </td>
                <td>${gvo.readnum}</td>
                <td>${gvo.writeday}</td>
            </tr>
        </c:forEach>

        <tr>
            <td colspan="3" align="center">
                <c:if test="${pstart!=1}">
                    <span onclick="location='../gongji/gongji?page=${pstart-1}'" style="cursor:pointer;"> ◀ </span>
                </c:if>

                <c:if test="${page!=1}">
                    <span onclick="location='../gongji/gongji?page=${page-1}'" id="prev" style="cursor:pointer;"> < </span>
                </c:if>


                <c:forEach begin="${pstart}" end="${pend}" var="i">
                    <c:if test="${page==i}">
                        <c:set var="page_color" value="style='color:#ff0000;'"/>
                    </c:if>
                    <c:if test="${page!=i}">
                        <c:set var="page_color" value=""></c:set>
                    </c:if>

                    <span id="page" ${page_color} onclick="location='../gongji/gongji?page=${i}'">${i}</span>

                </c:forEach>


                <c:if test="${page!=chong and chong!=0}">
                    <span onclick="location='../gongji/gongji?page=${page+1}'" id="back" style="cursor:pointer;"> > </span>
                </c:if>

                <c:if test="${!(pend>=chong)}">
                    <span onclick="location='../gongji/gongji?page=${pend+1}'" style="cursor:pointer;"> ▶ </span>
                </c:if>

            </td>
        </tr>
    </table>

    <c:if test="${userid=='admin'}">
        <div align="center">
            <div id="guan">
                <a href="../gongji/gongji_write"> 글쓰기 </a>
            </div>
            <div id="guan">
                <a href="../admin/admin_page"> 관리자 페이지 </a>
            </div>
        </div>
    </c:if>

</section>
</body>
</html>