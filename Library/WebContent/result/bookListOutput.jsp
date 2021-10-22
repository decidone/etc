<%@page import="com.book.vo.MemberVO"%>
<%@page import="com.book.vo.BookVO"%>
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

<%  ArrayList<BookVO> list = (ArrayList<BookVO>) request.getAttribute("list"); 
    if(!list.isEmpty()) { %>
	   <table border="1">
	   		<tr><th>도서 명</th><th>분야</th><th>출판사</th><th>저자</th><th>출판년도</th><th>관리번호</th><th>대여한 사람</th><th>대여중 여부</th></tr>
			
			<%   for(int i=0; i<list.size(); i++){   
			       BookVO book = list.get(i);   %>
			       
			        <tr><td><%=book.getBookName() %></td>
			            <td><%=book.getField() %></td>
			            <td><%=book.getPublisher() %></td>
			            <td><%=book.getAuthor() %></td>
			            <td><%=book.getYear() %></td>
			            <td><%=book.getNumber() %></td>
			            <td><%=book.getUser() %></td>
			            <td><%=book.getInfo() %></td>
			       </tr>
			       
			<%   }
       }else{
    	   out.print("<h3>등록된 도서 정보가 없습니다.</h3>");
       }
	%>
	  </table>

<%@ include file="home.jsp" %> 
</body>
</html>