<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 거래일정 달력 구현 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'prevYear,prev,next,nextYear', // addEventButton today
                    center: 'title',
                    right: 'dayGridMonth,dayGridWeek,dayGridDay',
                },
                /*
                // 일정추가 버튼 내용. 툴바의 left의 addEventButton
                customButtons:
                {
                    addEventButton: {
                      text: '일정 추가',
                      click: function()
                      {
                        var dateStr = prompt('Enter a date in YYYY-MM-DD format');
                        var date = new Date(dateStr + 'T00:00:00'); // will be in local time

                        if (!isNaN(date.valueOf()))
                        { // valid?
                          calendar.addEvent({
                            title: 'dynamic event',
                            start: date,
                            allDay: true
                          });
                          alert('Great. Now, update your database...');
                        }
                        else
                        {
                          alert('일정 추가 실패');
                        }
                      }
                    }
                },*/
                businessHours: true, // 주말부분 배경색 적용
                initialView: 'dayGridMonth',
                locale: "ko",
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                dayMaxEvents: true, // allow "more" link when too many events
                selectable: true,
                selectMirror: true,
                /*
                // 날짜 클릭시 이벤트 생성
                select: function(arg) {
                  var title = prompt('새 일정 추가:');
                  if (title) {
                    calendar.addEvent({
                      title: title,
                      start: arg.start,
                      end: arg.end,
                      //allDay: arg.allDay
                    })
                  }
                  calendar.unselect()
                },
                */
                /* 클릭시 이벤트 삭제
                eventClick: function(arg) {
                  if (confirm('정말 이 이벤트를 지우시겠습니까?')) {
                    arg.event.remove()
                  }
                },
                */
                events: [
                    <c:forEach items="${plist}" var="pvo">
                    {
                        <c:choose>
                        <c:when test="${fn:length(pvo.title) gt 7}">
                        title:'${fn:substring(pvo.title,0,6)}...',
                        </c:when>
                        <c:otherwise>
                        title:'${pvo.title}',
                        </c:otherwise>
                        </c:choose>
                        start:'${fn:replace(pvo.selltime,".0","")}',
                        url: '../bmap/bmap',
                        backgroundColor : "orange"
                    },
                    </c:forEach>
                    {
                        groupId: 999,
                        title: '구매 Event',
                        start: '2023-03-09T16:00:00'
                    },
                    {
                        groupId: 999,
                        title: '판매 Event',
                        start: '2023-03-16T16:00:00'
                    },
                    {
                        title: '거래가 가능한 일정',
                        start: '2023-03-11',
                        end: '2023-03-13',
                        backgroundColor : "gray",
                        borderColor : "blue",

                    },
                    {
                        title: '중고 cd팔..',
                        start: '2023-03-12T10:30:00',
                        end: '2023-03-12T12:30:00',
                        color : "#0000FF",
                        textColor : "red",

                    },
                    {
                        title: '판매',
                        start: '2023-03-12T12:00:00'

                    },
                    {
                        title: '구매',
                        start: '2023-03-12T14:30:00'
                    },
                    {
                        title: '거래 불가',
                        start: '2023-03-12T17:30:00'
                    },
                    {
                        title: '판매',
                        start: '2023-03-12T20:00:00'
                    },
                    {
                        title: '구매',
                        start: '2023-03-13T07:00:00'
                    },
                    {
                        title: 'Click for Google',
                        url: 'http://google.com/',
                        start: '2023-03-28'
                    }
                ]

            });
            calendar.setOption('height', 800);
            calendar.render();
        });

    </script>
    <!-- 탭 메뉴 스타일 -->
    <style>
        .container {
            height:900px;
        }
        @font-face {
            font-family: 'MICEGothic Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }
        /* 탭 메뉴 전체 */
        .container{
            width: 1000px;
            margin: 0 auto;
        }
        /* 탭 메뉴 ul의 tabs 클래스 */
        ul.tabs{
            margin: 0px;
            padding: 0px;
            list-style: none;
            width:1000px;
        }
        ul.tabs li{
            background: none;
            color: #222;
            display: inline-block;
            padding: 10px 15px;
            cursor: pointer;
            width:300px;
        }

        ul.tabs li.current{
            background: #4667B4;
            color: white;

        }
        .tab-content{
            display: none;
            /*background: #ededed; 탭 내용부분 배경색*/
            padding: 15px;
            margin-top:30px;
        }

        .tab-content.current{
            display: inherit; /* 부모요소의 display속성을 따라감 */
        }

        section #proline {
            border:0px;
            height:1px;
            background-color:#cccccc;
            margin-top:100px;

        }
        /* 일정달력 클래스. 카테고리 아래로 보내기 */
        .fc-event {
            z-index: 0;
        }
        #mygumae {
            margin-top:50px;
        }

        section td span {
            border:1px solid purple;
            padding:2px;
            cursor:pointer;
        }
    </style>
    <script>
        // 탭 메뉴
        $(document).ready(function(){

            $('ul.tabs li').click(function(){
                var tab_id = $(this).attr('data-tab');

                $('ul.tabs li').removeClass('current'); 	// ul의 tabs클래스(탭 클릭3개부분)에서 li의 current 스타일을 없앰.=파란배경 하얀글씨
                $('.tab-content').removeClass('current');	// tab-content클래스(탭 내용)에서 current 스타일을 없앰.= display=none;

                $(this).addClass('current');				// ul의 tabs클래스(탭 클릭3개부분)에서 클릭한 li에 파란배경 하얀글씨 적용
                $("#"+tab_id).addClass('current');			// data-tab의 #tab-1,2,3중 클릭한 곳에 display:block함

            })

        })
        function maincheck(my)
        {
            //alert(my.checked);
            var csub=document.getElementsByClassName("csub");
            var len=csub.length;// 상품의 개수

            if(my.checked)//전체선택이 되있는 경우
            {
                // 선택되었다면 모두 선택되도록
                for(i=0;i<len;i++)
                {
                    csub[i].checked=true;
                }
                document.getElementById("up").checked=true;
                document.getElementById("down").checked=true;

            }
            else// 아닌경우
            {
                // 선택되지 않았으면 모두 해제
                for(i=0;i<len;i++)
                {
                    csub[i].checked=false;
                }
                document.getElementById("up").checked=false;
                document.getElementById("down").checked=false;
            }
        }
        function subcheck()
        {
            var csub=document.getElementsByClassName("csub");
            var len=csub.length;

            // 상품의 체크박스가 얼마나 체크되었는지 확인
            var n=0;
            for(i=0;i<len;i++)
            {
                if(csub[i].checked)
                    n++; // 체크가 된 상품의 개수
            }

            if(len==n)
            {
                document.getElementById("up").checked=true;
                document.getElementById("down").checked=true;
            }
            else
            {
                document.getElementById("up").checked=false;
                document.getElementById("down").checked=false;
            }
        }

        function wishdel()
        {
            var id="";
            var csub=document.getElementsByClassName("csub");
            var len=csub.length;

            for(i=0;i<len;i++)
            {
                if(csub[i].checked)
                    id=id+csub[i].value+",";
            }
            // alert(id);

            // 하나 이상의 상품의 wish테이블의 id를 ,로 구분하여 전달
            if(id!="") // 보낼 아이디가 비어있지 않다면 실행
                location="wishdel?id="+id;
        }


    </script>
</head>

<section>
    <hr id="proline"> <!-- 프로필 밑 탭메뉴 위 라인 -->
    <!-- 탭 영역  -->
    <c:if test="${ww == '0'}">
        <c:set var="a1" value="current"/>
        <c:set var="a2" value=""/>
        <c:set var="a3" value=""/>
        <c:set var="s1" value="0"/>
    </c:if>
    <c:if test="${ww == '1'}">
        <c:set var="a1" value="current"/>
        <c:set var="a2" value=""/>
        <c:set var="a3" value=""/>
        <c:set var="s1" value="1"/>
    </c:if>
    <c:if test="${ww == '2'}">
        <c:set var="a1" value=""/>
        <c:set var="a2" value="current"/>
        <c:set var="a3" value=""/>
        <c:set var="s1" value="1"/>
    </c:if>
    <c:if test="${ww == '3'}">
        <c:set var="a1" value=""/>
        <c:set var="a2" value=""/>
        <c:set var="a3" value="current"/>
        <c:set var="s1" value="1"/>
    </c:if>
    <div class="container">
        <ul class="tabs">
            <li class="tab-link ${a1}" data-tab="tab-1" onclick="location='mypage?ww=1'">거래일정</li>
            <li class="tab-link ${a2}" data-tab="tab-2" onclick="location='mypage?ww=2'">내 상점 관리</li>
            <li class="tab-link ${a3}" data-tab="tab-3" onclick="location='mypage?ww=3'">찜 목록</li>
        </ul>
        <!-- 1번 탭 거래일정 -->
        <div id="tab-1" class="tab-content ${a1}">
            <form method="post" action="il_ok" align="center" width="1000">
                <div id="calendar"></div>
            </form>
        </div>
        <!-- 2번 탭 내 글 보기 -->
        <div id="tab-2" class="tab-content ${a2}">

            <form id="mypanmae">
                <table width="900" align="center" id="mypanmae">
                    <tr><h4>내 판매</h4></tr>
                    <c:forEach items="${plist}" var="pvo">
                        <tr>
                            <td></td>
                            <td>판매물품</td>
                            <td>제목</td>
                            <td>판매가격</td>
                            <td>판매등록일</td>
                            <td>판매상태</td>
                            <td>진행상태</td>
                            <td>삭제하기</td>
                        </tr>
                        <c:if test="${plist.size()==0}">
                            <td colspan="6" align="center">판매내역이 없습니다.</td>
                        </c:if>
                        <tr>
                            <td> <input type="checkbox" class="csub" onclick="subcheck()" value="${pvo.id}">
                            <td><img src="../resources/img/${pvo.pimg}" width="100"></a></td>
                            <td>${pvo.title}</a> </td>
                            <td> <fmt:formatNumber value="${pvo.price}" type="number"/> </td>
                            <td> ${pvo.writeday} </td>
                            <c:if test="${pvo.sstate==0}">
                                <c:set var="sstate" value="판매등록"/>
                            </c:if>
                            <c:if test="${pvo.sstate==1}">
                                <c:set var="sstate" value="판매중"/>
                            </c:if>
                            <c:if test="${pvo.sstate==2}">
                                <c:set var="sstate" value="판매완료"/>
                            </c:if>
                            <td> ${sstate} </td>
                            <td>
                                <!-- state에 따른 변경상태 표시 -->
                                <c:if test="${pvo.sstate==0}">
                                    <span onclick="location='chgstate?sstate=1&id=${pvo.id}&ww=2'"> 판매진행 </span>
                                </c:if>
                                <c:if test="${pvo.sstate==1}">
                                    <span onclick="location='chgstate?sstate=0&id=${pvo.id}&ww=2'"> 판매취소 </span><hr>
                                </c:if>
                                <c:if test="${pvo.sstate==1}">
                                    <span onclick="location='chgstate?sstate=2&id=${pvo.id}&ww=2'"> 판매완료 </span>
                                </c:if>
                                <c:if test="${pvo.sstate==2}">
                                    <div> 거래종료 </div>
                                </c:if>
                            </td>
                            <td>
                                <span style="margin-top:5px;" onclick="location='wishdel?id=${pvo.id}&ww=2'">삭제</span>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
            <hr>
            <!--
     <form id="mygumae">
     <table width="900" align="center">
     <tr><h4>내 구매</h4></tr>
     <c:if test="${plist.size()==0}">
			<td colspan="6" align="center">구매내역이 없습니다.</td>
	  </c:if>
     <c:forEach items="${plist}" var="pvo">
       <tr>
         <td> <input type="checkbox" class="csub" onclick="subcheck()" value="${pvo.id}">
         <td><img src="../resources/img/${pvo.pimg}" width="100"></a></td>
         <td>${pvo.title}</a> </td>
         <td> <fmt:formatNumber value="${pvo.price}" type="number"/> </td>
         <td> ${pvo.writeday} </td>
         <c:if test="${pvo.sstate==1}">
         	<c:set var="psstate" value="구매중"/>
         </c:if>
         <c:if test="${pvo.sstate==2}">
           	<c:set var="psstate" value="구매완료"/>
         </c:if>

         <td> ${psstate}</td>
         <td>
         <td>
         	<span style="margin-top:5px;" onclick="location='wishdel?id=${pvo.id }'">삭제</span>
         </td>
       </tr>
      </c:forEach>

     </table>
     </form>
     -->
        </div>
        <!-- 3번 탭 찜 목록 -->
        <div id="tab-3" class="tab-content ${a3}">
            <table width="900" align="center">
                <c:if test="${wlist.size()==0}">
                    <td colspan="6" align="center">찜한 물품이 없습니다.</td>
                </c:if>
                <c:if test="${wlist.size()!=0}">
                    <tr>
                        <td colspan="6" align="left">
                            <input type="checkbox" onclick="maincheck(this)" id="up">전체선택
                            <span id="sdel" style="cursor:pointer;" onclick="wishdel()">선택삭제</span>
                        </td>
                    </tr>
                </c:if>

                <c:forEach items="${wlist}" var="wvo">
                    <tr>
                        <td> <input type="checkbox" class="csub" onclick="subcheck()" value="${wvo.id}">
                        <td> <img src="../resources/img/${wvo.pimg}" width="100"></td>
                        <td> ${wvo.title} </td>
                        <td> <fmt:formatNumber value="${wvo.price}" type="number"/> </td>
                        <td> ${wvo.writeday} </td>
                        <td>
                            <span style="margin-top:5px;cursor:pointer;" onclick="location='wishdel?id=${wvo.id}'">삭제</span>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${wlist.size()!=0}">
                    <tr>
                        <td colspan="6" align="left">
                            <input type="checkbox" onclick="maincheck(this)" id="up">전체선택
                            <span id="sdel" style="cursor:pointer;" onclick="wishdel()">선택삭제</span>
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td colspan="6" align="center">
                        <!-- 11페이지 이후에서 1페이지 갈수있도록 표시 -->
                        <c:if test="${page>10}">
                            <a href="wlist?pid=${pid}&page=${1}" style="font-weight:900;">[${1}] ..</a>
                        </c:if>
                        <!-- 10페이지 뒤로 -->
                        <c:if test="${pstart!=1}">
                            <!-- 시작페이지가 1이 아니라면 10페이지 뒤로가기를 표시 -->
                            <a href="wlist?pid=${pid}&page=${page-10}">≪</a>
                        </c:if>
                        <c:if test="${pstart==1}">
                            <!-- 시작페이지가 1이면 10페이지 뒤로가기를 미표시 -->
                            <!-- 미표시 -->
                        </c:if>
                        <!-- 1페이지 뒤로 -->
                        <c:if test="${page>1}">
                            <!-- 현재페이지가 1보다 크면 1페이지 뒤로가기 표시 -->
                            <a href="wlist?pid=${pid}&page=${page-1}">◀</a>
                        </c:if>
                        <c:if test="${page==1}">
                            <!-- 현재페이지가 1이면 1페이지 뒤로가기를 미표시 -->
                            <!-- 미표시 -->
                        </c:if>
                        <!-- 현재페이지 표시 -->
                        <c:forEach begin="${pstart}" end="${pend}" var="i">
                            <c:if test="${page!=i}">
                                <a href="wlist?pid=${pid}&page=${i}">${i}</a>
                            </c:if>
                            <c:if test="${page==i}">
                                <span style="color:red;font-weight:900;"> ${i}</span>
                            </c:if>
                        </c:forEach>
                        <!-- 1페이지 앞으로 -->
                        <c:if test="${page<chong}">
                            <!-- 현재페이지가 총페이지보다 작으면 1페이지 앞으로 가기를 표시 -->
                            <a href="wlist?pid=${pid}&page=${page+1}">▶</a>
                        </c:if>
                        <c:if test="${page==chong}">
                            <!-- 현재페이지가 총페이지와 같으면 1페이지앞으로 가기를 미표시 -->
                            <!-- 미표시 -->
                        </c:if>
                        <!-- 10페이지 앞 -->
                        <c:if test="${pend!=chong}">
                            <!-- 끝페이지가 총페이지가 아니면 10페이지 뒤로가기를 표시 -->
                            <a href="wlist?pid=${pid}&page=${page+10}">≫</a>
                        </c:if>
                        <c:if test="${pend==chong}">
                            <!-- 끝페이지가 총페이지와 같으면 10페이지 뒤로가기를 미표시 -->
                            <!-- 미표시 -->
                        </c:if>
                        <c:if test="${page!=chong && pend>10}">
                            <a href="wlist?pid=${pid}&page=${chong}" style="font-weight:900;">.. [${chong}]</a>
                        </c:if>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</section>
<script>
    window.onload=function()
    {
        if(${s1==1})
        {
            window.scrollTo(0,500);
        }
        else
            window.scrollTo(0,0);
    }
</script>
</body>
</html>