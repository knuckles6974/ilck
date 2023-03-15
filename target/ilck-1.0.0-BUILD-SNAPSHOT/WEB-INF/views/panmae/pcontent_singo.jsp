<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
</head>
<style>
    #section {
        width:1000px;
        height:500px;
        margin:auto;
    }
    #section #title {
        width:440px;
        height:28px;
        border:1px solid purple;
        outline:none;
    }
    #section #content {
        width:440px;
        height:120px;
        border:1px solid purple;
        outline:none;
    }
    #section #submit {
        width:200px;
        height:32px;
        border:1px solid purple;
        outline:none;
        background:white;
        color:purple;
        font-size:15px;
        font-weight:900;
    }
</style>
<script>
    function submit()
    {

        alert("신고가 접수되었습니다.");

    }
    function add_form()
    {
        var size=document.getElementsByClassName("up").length;
        if(size<10)
        {
            var outer=document.getElementById("outer");
            outer.innerHTML=outer.innerHTML+"<p class='up'> <input type='file' name='fname"+(size+1)+"'> </p> ";

            document.getElementById("section").style.height=500+(size*30)+"px";
        }
    }
    function del_form()
    {
        // class='up'의 크기를 알수 있다
        //alert(document.getElementsByClassName("up").length);
        var size=document.getElementsByClassName("up").length;
        if(size!=1) // 하나만 남았을경우 삭제 중지
            document.getElementsByClassName("up")[size-1].remove();
    }
    function view_tag()
    {
        document.getElementById("vtag").innerText=document.getElementById("outer").innerHTML;

    }
</script>
<body>
<input type="button" onclick="view_tag()" value="태그확인">
<div id="section">
    <form method="post" action="singo_ok">
        <table width="600" align="center">
            <caption> <h3> 여행후기 작성 </h3></caption>
            <tr>
                <td> 제 목 </td>
                <td> <input type="text" name="title" id="title"> </td>
            </tr>

            <tr>
                <td> 내 용 </td>
                <td> <textarea name="content" id="content"></textarea> </td>
            </tr>
            
            <tr>
                <td colspan="2" align="center"> <input type="submit" value="신고하기" onclick="submit()"> </td>
            </tr>
        </table>
    </form>

    <div id="vtag"></div>

</div>
</body>
</html>



