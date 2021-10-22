package com.book.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.book.service.MemberService;

public class BookDeleteController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String bookName = request.getParameter("bookName");

		MemberService service = MemberService.getInstance();
		service.bookDelete(bookName);

		HttpUtil.forward(request, response, "/result/bookDeleteOutput.jsp");
		return;

	}
}
