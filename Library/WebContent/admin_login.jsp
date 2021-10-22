<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/login.css">
<link href="https://fonts.googleapis.com/css?family=Cabin|Dosis|Gamja+Flower|Nanum+Gothic" rel="stylesheet">

<title>도서관리 페이지</title>
</head>
<body class="backgrounds">
    <div class="slide show" style="background-image: linear-gradient(rgba(47,23,15,.45),rgba(47,23,15,.45)),url('images/bgad1.jpg');"></div>
    <div class="slide" style="background-image: linear-gradient(rgba(47,23,15,.45),rgba(47,23,15,.45)),url('images/bgad2.jpg');"></div>
    <div class="slide" style="background-image: linear-gradient(rgba(47,23,15,.45),rgba(47,23,15,.45)),url('images/bgad3.jpg');"></div>
      <div class="form">
        <ul class="tab-group">
          <li class="tab"><a href="login.jsp">일반 로그인</a></li>
          <li class="tab active"><a>관리자 로그인</a></li>
        </ul>
      <div class="tab-content">
        <div id="login">
          <h1>용인대학교 도서관</h1>
        
          <form action="memberLogin.do" method="post">
            <div class="field-wrap">
              <input type="text"  name="id" placeholder="Username" required autocomplete="off"/>
            </div>
            <div class="field-wrap">
              <input type="password" name="passwd" placeholder="password"required autocomplete="off"/>
            </div>
            <button type="submit" class="button button-block">로그인</button>
          </div>
          </form>
        <p class="register"></p>
      </div>
    </div>
  
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
    </script>
  </body>
</html>