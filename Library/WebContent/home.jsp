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
<title>도서관리 페이지</title>
</head>
<body class="backgrounds">
    <div class="slide show" style="background-image: linear-gradient(rgba(47,23,15,.45),rgba(47,23,15,.45)),url('images/bgad4.jpg');"></div>
    <div class="slide" style="background-image: linear-gradient(rgba(47,23,15,.45),rgba(47,23,15,.45)),url('images/bgad5.jpg');"></div>
    <div class="slide" style="background-image: linear-gradient(rgba(47,23,15,.45),rgba(47,23,15,.45)),url('images/bgad6.jpg');"></div>
    <audio src="audio/welcomeuser.mp3" autoplay></audio>
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
        <div>
            <section class="section"><%=session.getAttribute("id") %>님 환영합니다.
                    <h2 class="home0">좋은 책을 읽는 것은 과거 몇 세기의 가장 훌륭한 사람들과 이야기를 나누는 것과 같다. 
                    
                        <div class="home1">-르네 데카르트-</div>
                    </h2>
                    <p class="maker">201433001 강민성, 201433006 김승주</p>
            </section>
        </div>
        
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
            })

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