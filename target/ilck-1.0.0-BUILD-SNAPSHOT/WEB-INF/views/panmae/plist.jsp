<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

    <script>
        function filter_product(n)
        {
            location="liststate?n="+n+"&pcode=${fpcode}";

        }
    </script>
</head>

<style>
 section #table td {
     position: absolute;
     top:0px;
     left:0px;
     width:100%;
     height:100%;
     border: 1px solid white;
 }

section #table div{
    margin-left:20px;
    padding:0px;
    border:0px;
    font:inherit;
    vertical-align: baseline;

}
 #title{
     width:180px;
     height:80px;
     padding-bottom: 15px;
     padding-top: 10px;
     padding-right: 10px;
     padding-left: 10px;
     border: 1px;
 }
 .pname{
    position:relative;
     font-size: 13px;
     padding-bottom: 20px;
     text-overflow: ellipsis;
     white-space: nowrap;
     overflow-x: hidden;
     overflow-y: hidden;

 }
 .won{
     display: flex;
     -webkit-box-pack: justify;
     justify-content: space-between;
     -webkit-box-align: center;
     align-items: center;
     height:20px;

 }

 .loca{
     height:40px;
     border-top:1px solid white;
     font-size: 12px;
     display:block;
     padding-top: 14px;
     padding-right: 10px;
     padding-bottom: 14px;
     padding-left: 35px;
     color:grey;
     width:100%;
     overflow-y: hidden;
     overflow-x: hidden;
     text-overflow: ellipsis;
     white-space: nowrap;
     position: relative;
 }

</style>
<body>
<div style="display: flex; justify-content: flex-end; margin-top: 30px;">
    <div style="margin-left: auto; margin-right:auto;">
        <input type="hidden" name="pcode" value="${pvo.pcode}">
        <input type="hidden" name="writeday" value="${pvo.writeday}">
        <input type="hidden" name="price" value="${pvo.price}">
        <input type="hidden" name="pid" value="${pvo.pid}">
        <span onclick="filter_product(1)" style="margin-right: 10px; color: red; cursor: pointer;">최신순</span>
        <span onclick="filter_product(2)" style="margin-right: 10px;cursor: pointer;">저가순</span>
        <span onclick="filter_product(3)" style="margin-right: 10px;cursor: pointer;">고가순</span>

    </div>
</div>
<section>
    <!--cimg, title,price, loca -->

<table align="center" width="900" id="table">
    <tr>
        <c:forEach items="${plist}" var="pvo" varStatus="sts">
            <td width="220" onclick="location='readnum?pcode=${pvo.pcode}'">
                <div align="center" >
                    <img src="../resources/pro/${pvo.cimg}" width="220" height="180">
                </div>
                <div id="title">
                    <div class="pname"  width="174" height="30">${pvo.title}</div>

               <!-- <div class ="price">-->
                    <div class="won"><fmt:formatNumber value="${pvo.price}" type="number" pattern="#,###"/>원 </div>
                </div>

                <div class="loca">
                        ${pvo.loca}
                </div>

            </td>
        <c:if test="${sts.count%4==0}">
        </tr>
        <tr>
        </c:if>
        </c:forEach>
    </tr>

    <tr>
      <td align="center" colspan="4" style="height:40px;border:none">
        <c:if test="${pstart != 1}">
          <a href="plist?pcode=${pcode}&page=${pstart-1}"> << </a>
            </c:if>
        <c:if test="${pstart == 1}">
            <<
            </c:if>
        <c:if test="${page != 1}">
            <a href="plist?pcode=${pcode}&page=${page-1}"> < </a>
            </c:if>
        <c:if test="${page == 1}">
            <
            </c:if>

        <c:forEach var="i" begin="${pstart}" end="${pend}">
            <c:if test="${page != i}">
            <a href="plist?pcode=${pcode}&page=${i}">${i} </a>
            </c:if>
            <c:if test="${page == i}">
            <span style="color:red;">${i}</span>

            </c:if>
            </c:forEach>

        <c:if test="${page != chong}">
            <a href="plist?pcode=${pcode}&page=${page+1}"> > </a>
            </c:if>
         <c:if test="${page == chong}">
            >
            </c:if>

        <c:if test="${pend != chong}">
            <a href="plist?pcode=${pcode}&page=${pend+1}"> >> </a>

            </c:if>
        <c:if test="${pend == chong}">
            >>
            </c:if>
      </td>
    </tr>
</table>
</section>
</body>
</html>
