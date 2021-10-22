<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<script type="text/javascript">
function test(){
alert("${bookName} 대여가 완료되었습니다!");
location.href = "home.jsp";
}
</script>
</head>
<body onload="test()">
</body>
</html>
