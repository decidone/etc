<%@page import="com.book.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<style>
table, td, th {    
    border: 1px solid #ddd;
    text-align: center;
}

table {
    border-collapse: collapse;
    width: 50%;
}

th,td {
    padding: 15px;
}
th {
	background-color:lightgray;
}
td {
	background-color:white;
}
</style>
<title>회원 정보</title>
</head>
<body>

<%  ArrayList<MemberVO> list = (ArrayList<MemberVO>) request.getAttribute("list"); 
    if(!list.isEmpty()) {  %>
	   <table border="1">
	   		<tr><th>ID</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>도서1</th><th>도서2</th><th>도서3</th></tr>
			
			<%   for(int i=0; i<list.size(); i++){   
			       MemberVO member = list.get(i);   %>
			       
			        <tr><td><%=member.getId() %></td>
			            <td><%=member.getPasswd() %></td>
			            <td><%=member.getName() %></td>
			            <td><%=member.getMail() %></td>
			            <td><%=member.getBook1() %></td>
			            <td><%=member.getBook2() %></td>
			            <td><%=member.getBook3() %></td>
			       </tr>
			       
			<%   }
       }else{
    	   out.print("<h3>등록된 회원 정보가 없습니다.</h3>");
       }
	%>
	  </table>

<%@ include file="home.jsp" %> 
</body>
</html>