package com.book.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	String charset = null;
	HashMap<String, Controller> list = null;

	@Override
	public void init(ServletConfig sc) throws ServletException {

		charset = sc.getInitParameter("charset");

		list = new HashMap<String, Controller>();
		list.put("/memberInsert.do", new MemberInsertController());
		list.put("/memberSearch.do", new MemberSearchController());
		list.put("/memberUpdate.do", new MemberUpdateController());
		list.put("/memberDelete.do", new MemberDeleteController());
		list.put("/memberList.do", new MemberListController());
		list.put("/memberLogin.do", new MemberLoginController());
		list.put("/memberLogout.do", new MemberLogoutController());
		list.put("/bookInsert.do", new BookInsertController());
		list.put("/bookDelete.do", new BookDeleteController());
		list.put("/bookList.do", new BookListController());
		list.put("/bookSearch.do", new BookSearchController());
		list.put("/bookUpdate.do", new BookUpdateController());
		list.put("/bookBorrow.do", new BookBorrowController());
		list.put("/borrowList.do", new BookBorrowListController());
		list.put("/bookReturn.do", new BookReturnController());
		list.put("/bookClick.do", new BookClickController());
		list.put("/memberClick.do", new MemberClickController());
	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding(charset);

		String url = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = url.substring(contextPath.length());

		Controller subController = list.get(path);
		subController.execute(request, response);
	}
}
