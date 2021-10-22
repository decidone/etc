<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/main.css?ver=1">
<link rel="stylesheet" href="css/recommend.css?ver=1">
<link href="https://fonts.googleapis.com/css?family=Cabin|Dosis|Gamja+Flower|Nanum+Gothic" rel="stylesheet">

<title>도서관리 페이지</title>
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
<div class="container"><a href="http://book.naver.com/bookdb/book_detail.nhn?bid=7102772" target="_blank">
    <section class="section1">
        <img src="./images/namiya.jpg">
        <div class="book-re">
            아무도 살지 않는 오래된 잡화점에서 벌어지는 기묘하고 따뜻한 이야기<br><br>
            2012년 3월 일본에서 출간된 히가시노 게이고의 최신작이다. 이야기의 배경은 30여 년간 비어있던
            교외의 한 잡화점. 강도짓을 하고 경찰의 눈을 피해 달아나던 삼인조 좀도둑이 
            '나미야 잡화점'으로 숨어드는데......
        </div>
    </section></a><a href="http://book.naver.com/bookdb/book_detail.nhn?bid=12785223" target="_blank">
    <section class="section2">
        <img src="./images/paris.jpg">
        <div class="book-re">
            사랑과 감동의 마에스트로 기욤 뮈소의 중독적인 스릴러<br><br>
            『파리의 아파트』는 『브루클린의 소녀』와 마찬가지로 본격 스릴러의 범주에 포함된다. 
            천재화가의 신비스런 창작 세계, 예술가들의 고뇌와 열정을 엿볼 수 있는 소설이자 납치된 
            아들을 찾기 위한 아버지의 간절한 이야기......
        </div>
    </section></a><a href="http://book.naver.com/bookdb/book_detail.nhn?bid=6887073" target="_blank">
    <section class="section3">
        <img src="./images/paradise.jpg">
        <div class="book-re">
            베르베르가 이야기하는 있을 법한 미래, 있을 법한 과거!<br><br>
            여자들만 남고 남자들은 전설이 되어버린 세계, 과거를 기억하는 것이 금지된 사회, 
            출처를 알 수 없는 농담의 발원지를 추적하는 코미디언의 모험, 작가의 개인사를 엿볼 수 있는 
            이야기 등 17편의 이야기들......
        </div>
    </section></a>
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