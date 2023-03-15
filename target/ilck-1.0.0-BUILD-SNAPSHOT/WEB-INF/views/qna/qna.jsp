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

        section .result_tr
        {
            display:none;
        }

        section #result_td
        {
            height:200px;
            vertical-align:top;
        }

        section #qna_content
        {
            height:88px;
            padding-left:15px;
            padding-top:10px;
        }

        section #result_content
        {
            height:88px;
            padding-left:15px;
            padding-top:10px;
        }

        section #re_con
        {
            cursor:pointer;
        }

        section #sta
        {
            cursor:pointer;
            color:red;
            width:100px;
            height:30px;
            border:1px solid black;
            background:white;
            margin:10px;
            padding-top:3px;
        }


    </style>

    <script>

        var change=0;
        function change_result(index)
        {
            if(change==0)
            {
                document.getElementsByClassName("result_tr")[index].style.display="table-row";
                change++;
            }
            else
            {
                document.getElementsByClassName("result_tr")[index].style.display="none";
                change=0;
            }
        }


        function num_change(id, id2, page)
        {
            location="../qna/num_change?id="+id+"&id2="+id2+"&page="+page;
        }


        <c:if test="${msg=='1'}">
        alert("순서를 바꿀 수 없습니다");
        </c:if>

    </script>

</head>
<body>
<section>

    <div align="center"><h3> 자주묻는 질문 </h3></div>

    <table width="800" border="1" align="center">
        <tr>
            <c:if test="${qlist.size()==0}">
                <td colspan="4" align="center">자주묻는 질문이 없습니다.</td>
            </c:if>
        </tr>

        <c:if test="${qlist.size()!=0}">

            <tr align="center">
                <td width="650"> 제 목 </td>
                <td> 작성일 </td>
            </tr>

            <c:forEach items="${qlist}" var="qvo" varStatus="imsi">
                <tr align="center">
                    <td height="50">
                        <div id="re_con" onclick="change_result(${imsi.index})">
                            <c:if test="${qvo.important==1}">
                                <span style="color:#ff4400; font-size:16px;">[중요]</span>
                            </c:if>

                                ${qvo.title}
                        </div>
                    </td>
                    <td>${qvo.writeday}</td>
                </tr>


                <c:if test="${userid!='admin'}">
                    <c:set var="td_set" value="colspan='2'"/>
                </c:if>

                <c:if test="${userid=='admin'}">
                    <c:set var="td_set" value=""/>
                </c:if>


                <tr class="result_tr">
                    <td id="result_td" ${td_set}>
                        <div id="result">
                            <div id="qna_content">
                                질문 : ${qvo.title}
                            </div>
                            <div id="result_content">
                                답변 : ${qvo.result}
                            </div>
                        </div>
                    </td>

                    <c:if test="${imsi.index==0}">
                        <c:set var="imsi2" value="0"/>
                    </c:if>

                    <c:if test="${imsi.index!=0}">
                        <c:set var="imsi2" value="${qlist.get(imsi.index-1).getId()}"/>
                    </c:if>

                    <c:if test="${imsi.index==qlist.size()-1}">
                        <c:set var="imsi3" value="0"/>
                    </c:if>

                    <c:if test="${imsi.index<qlist.size()-1}">
                        <c:set var="imsi3" value="${qlist.get(imsi.index+1).getId()}"/>
                    </c:if>

                    <c:if test="${userid=='admin'}">
                        <td align="center">
                            <div id="num_up"> <span onclick="num_change(${qvo.id}, '${imsi2}', '${page}')" style="cursor:pointer;">▲</span> </div>
                            <div id="sta"> <a href="../qna/qna_update?id=${qvo.id}&page=${page}">수 정</a> </div>
                            <div id="sta"> <a href="../qna/qna_delete?id=${qvo.id}&page=${page}">삭 제</a>  </div>
                            <div id="num_down"> <span onclick="num_change(${qvo.id}, '${imsi3}', '${page}')" style="cursor:pointer;">▼</span> </div>
                        </td>
                    </c:if>
                </tr>

            </c:forEach>


            <tr>
                <td colspan="3" align="center">
                    <c:if test="${pstart!=1 and pstart!=null}">
                        <span onclick="location='../qna/qna?page=${pstart-1}'" style="cursor:pointer;"> ◀ </span>
                    </c:if>

                    <c:if test="${page!=1 and page!=null}">
                        <span onclick="location='../qna/qna?page=${page-1}'" id="prev" style="cursor:pointer;"> < </span>
                    </c:if>


                    <c:forEach begin="${pstart}" end="${pend}" var="i">
                        <c:if test="${page==i}">
                            <c:set var="page_color" value="style='color:#ff0000;'"/>
                        </c:if>
                        <c:if test="${page!=i}">
                            <c:set var="page_color" value=""></c:set>
                        </c:if>

                        <c:if test="${page!=null}">
                            <span id="page" ${page_color} onclick="location='../qna/qna?page=${i}'">${i}</span>
                        </c:if>

                        <c:if test="${page==null}">
                            <span style="color:red;">1</span>
                        </c:if>

                    </c:forEach>


                    <c:if test="${page!=chong and chong!=0}">
                        <span onclick="location='../qna/qna?page=${page+1}'" id="back" style="cursor:pointer;"> > </span>
                    </c:if>

                    <c:if test="${!(pend>=chong)}">
                        <span onclick="location='../qna/qna?page=${pend+1}'" style="cursor:pointer;"> ▶ </span>
                    </c:if>

                </td>
            </tr>

        </c:if>

    </table>

    <c:if test="${userid=='admin'}">
        <div align="center">
            <div id="guan">
                <a href="../qna/qna_write"> 질문 추가하기 </a>
            </div>
            <div id="guan">
                <a href="../admin/admin_page"> 관리자 페이지 </a>
            </div>
        </div>
    </c:if>

</section>
</body>
</html>