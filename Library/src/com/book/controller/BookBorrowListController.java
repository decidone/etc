package com.book.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.book.service.MemberService;
import com.book.vo.MemberVO;

public class BookBorrowListController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		
		
		MemberService service = MemberService.getInstance();
		MemberVO member = service.memberSearch(id);
		
		request.setAttribute("member", member);
		
		request.setAttribute("book1", member.getBook1());
		request.setAttribute("book2", member.getBook2());
		request.setAttribute("book3", member.getBook3());
		
		HttpUtil.forward(request, response, "/book_return.jsp");
		return;

	}
}

