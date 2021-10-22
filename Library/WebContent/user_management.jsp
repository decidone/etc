<%@page import="com.book.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/main.css?ver=1">
<link rel="stylesheet" href="css/book.css?ver=1">
<link rel="stylesheet" href="css/recommend.css?ver=1">
<link href="https://fonts.googleapis.com/css?family=Cabin|Dosis|Gamja+Flower|Nanum+Gothic" rel="stylesheet">
<style>

body{
font-family: 'Nanum Gothic', sans-serif;
}
.cell{
	width:700px;
	float:left;
	display: inline-block;
}
.cell table, .cell td, .cell th {    
    border: 1px solid #ddd;
    text-align: center;
}
.cell table {
    border-collapse: collapse;
    width: 100%;
}
.cell th, .cell td {
    padding: 12px;
}
.cell th {
	background-color:lightgray;
}
.cell td {
	background-color:white;
}
.choice:hover {
    background-color: lightgreen;
    color: black;
}
.choice:link, .choice:visited {
    text-decoration: none;
    color: red;
}
.main10{
	width:1080px;
}
td:hover {background-color: #f5f5f5;}

.wrapper9{
	width:350px; 
	background-color:rgba(255,255,255,.95);
	border:2px black;
	border-radius: 3px;
	margin-bottom:10px;
	padding-bottom:10px;
	display: inline-block;
}
.field ul {
	list-style:none;
}
.field li {
	list-style:none;
	margin:10px;
}
li label {
	width:65px;
	float:left;
	text-align:right;
	padding-right:5px;
	font-family: 'Nanum Gothic', sans-serif;
}
input[type="date"]{
	width: 168px;
}
.field{
	width:350px;
    padding:10px; 
}

submit,#submit2,#add,#cancel,#del,#fix,#register,button{
	width:70px;
	height:32px;
	padding:auto;
	background-color:#4CAA00;
	border:none;
	opacity: 0.8;
	transition: opacity 0.2s;
	font:12px verdana;
	cursor: pointer;
	color:#fff;
	border:none;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
	margin-top:2px;
	margin-right:10px;
}
.butt{
float:right;
margin-right:25px;
}
</style>
<script type="text/javascript">
  function mySubmit(index) {
    if (index == 1) {
      document.myForm.action='memberInsert.do';
    }
    if (index == 2) {
      document.myForm.action='memberDelete.do';
    }
    if (index == 3) {
        document.myForm.action='memberUpdate.do';
      }
    document.myForm.submit();
  }
</script>
<title>회원관리 페이지</title>
</head>
<body class="backgrounds">
    <div class="slide show" style="background-image: linear-gradient(rgba(47,23,15,.45),rgba(47,23,15,.45)),url('images/bgad7.jpg');"></div>
    <div class="slide" style="background-image: linear-gradient(rgba(47,23,15,.45),rgba(47,23,15,.45)),url('images/bgad8.jpg');"></div>
    <div class="slide" style="background-image: linear-gradient(rgba(47,23,15,.45),rgba(47,23,15,.45)),url('images/bgad9.jpg');"></div>
    <audio src="audio/pageswitch.mp3" autoplay></audio>
    <h1 class="head">
    	<%String sess = (String)session.getAttribute("id");
            if(sess==null) {%>
            <script type="text/javascript">
	    	alert("로그인 정보가 없습니다.");
	    	location.href = "login.jsp";
	    	</script><%} else{%>
       <br>
       <a href="home.jsp" class="homeover">용인대학교 도서관</a>
    </h1>
    <div class="menu-wrap">
            <nav class="menu">
            
                <ul><%if(session.getAttribute("id").equals("admin")){ %>
                    <li>
                        <a href="#">관리자 메뉴<span class="arrow">&#9660;</span></a>
                        <audio id="beep0">
                            <source src="audio/thisone.mp3" ></source>
                        </audio>
                        <ul class="sub-menu">
                            <li><a href="book_management.jsp">도서 추가</a>
                            <audio id="beep1">
                                <source src="audio/thisone.mp3" ></source>
                            </audio>
                            </li>
                             <li><a href="memberList.do">회원 관리</a>
                            <audio id="beep2">
                                <source src="audio/thisone.mp3" ></source>
                            </audio>
                            </li>
                            <li><a href="bookList.do?job=A">도서 관리</a>
                            <audio id="beep2">
                                <source src="audio/thisone.mp3" ></source>
                            </audio>
                            </li>
                        </ul>
                    </li><%}else{ %>
                    <li><a href="user_info_change.jsp">회원정보 변경</a>
                        <audio id="beep4">
                            <source src="audio/thisone.mp3" ></source>
                        </audio>
                    </li><%} %>
                    <li><a href="bookList.do?job=B">도서 대여</a>
                        <audio id="beep3">
                            <source src="audio/thisone.mp3" ></source>
                        </audio>
                    </li>
                    <li><a href="bookList.do?job=info">도서 반납</a>
                        <audio id="beep4">
                            <source src="audio/thisone.mp3" ></source>
                        </audio>
                    </li>
                    <li><a href="book_recommend.jsp">추천 도서</a>
                        <audio id="beep5">
                            <source src="audio/thisone.mp3" ></source>
                        </audio>
                    </li>
                    <li><a href="memberLogout.do">로그아웃</a>
                        <audio id="beep6">
                            <source src="audio/thisone.mp3" ></source>
                        </audio>
                    </li>
                </ul>
         
            </nav>
        </div>
<center>
<div class="wrapper">
    <h1>회원 관리</h1>
    <form action="memberSearch.do" method="post">
        <div class="search">
            <li>
                <label for="search2">회원 검색</label>
                <input type="text" name="id" id="search2" required>
            </li>
            	<input type="hidden" name="job" value="update" />
                <input type="submit" value="검색" id="submit2">
        </div>
        </form>
            <fieldset>
            <% MemberVO member = (MemberVO)request.getAttribute("member");
   			if(member != null) { %>
                <legend>회원정보 수정</legend>
                <form name='myForm' method='post'>
                    <ul>
                    	<li>
                            <label for="userID">ID</label>
                            <input type="text" name = "id" id="username" readonly  value="${member.id}" >
                        </li>
                        <li>
                            <label for="userPW">비밀번호</label>
                            <input type="text" name = "passwd" id="username" value="${member.passwd}" required>
                        </li>
                        <li>
                            <label for="username">이름</label>
                            <input type="text" name = "name" id="username" value="${member.name}" required>
                        </li>
                        <li>
                            <label for="mail">메일 주소</label>
                            <input type="email" name ="mail" id="mail" id="mail" value="${member.mail}" required>
                        </li>
                        
                    <input type="button" value="추가" id="add"/>
                    <input type="reset" value="취소" id="cancel"/>
                    <input type="button" onclick='mySubmit(2)' value="삭제" id="del"/>
                    <input type="button" onclick='mySubmit(3)' value="수정" id="fix"/>
                </form>
		</fieldset>             
</div>
<%}else{ %>
     ${result} <br>
     <legend>회원정보 수정</legend>
                <form name='myForm' method='post'>
                    <ul>
                    	<li>
                            <label for="userID">ID</label>
                            <input type="text" name = "id" id="username" required autocomplete="off">
                        </li>
                        <li>
                            <label for="userPW">비밀번호</label>
                            <input type="text" name = "passwd" id="username" required autocomplete="off">
                        </li>
                        <li>
                            <label for="username">이름</label>
                            <input type="text" name = "name" id="username" required autocomplete="off">
                        </li>
                        <li>
                            <label for="mail">메일 주소</label>
                            <input type="email" name ="mail" id="mail" placeholder="Honggildong@gmail.com" required autocomplete="off">
                        </li>
                        
                    <input type="button" onclick='mySubmit(1)' value="추가" id="add"/>
                    <input type="reset" value="취소" id="cancel"/>
                    <input type="button" value="삭제" id="del"/>
                    <input type="button" value="수정" id="fix"/>
                </form>
        </fieldset>             
</div>
<%} %>
<div class="wrapper6"></div>
<footer>all right reserved</footer>
</center>
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script>
      function cycleBackgrounds() {
      var index = 0;
      $imageEls = $('.backgrounds .slide');
      setInterval(function () {
        index = index + 1 < $imageEls.length ? index + 1 : 0;
        $imageEls.eq(index).addClass('show');
        $imageEls.eq(index - 1).removeClass('show');
          }, 4000);
        };
      $(function () {
        cycleBackgrounds();
      });

      $(".menu a")
        .each(function(i) {
            if (i != 0) {
            $("#beep")
                .clone()
                .attr("id", "beep" + i)
                .appendTo($(this).parent());
            }
            $(this).data("beeper", i);
        })
        .mouseenter(function() {
            $("#beep" + $(this).data("beeper"))[0].play();
        });
        $("#beep").attr("id", "beep");
    </script>
    <%} %>
</body>
</html>