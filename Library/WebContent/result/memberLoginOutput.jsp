<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>검색 결과</title>
</head>
<body>
	<h3>검색 결과</h3>
	
	<%
	    String result = (String)request.getAttribute("result");
	    if(result!=null) {
	    	%><script type="text/javascript">
	    	alert("${result}");
	    	location.href = "login.jsp";
	    	</script><%
	    }else{
		%><script type="text/javascript">
	    	alert("${member.id } 님 로그인되었습니다!");
	    	location.href = "home.jsp";
	    	</script>
    <%} %>
</body>
</html>