<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<script type="text/javascript">
function test(){
alert("${id} 님 가입이 완료되었습니다!");
location.href = "login.jsp";
}
</script>
</head>
<body onload="test()">
</body>
</html>