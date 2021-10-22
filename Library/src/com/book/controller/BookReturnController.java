package com.book.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.book.service.MemberService;
import com.book.vo.BookVO;
import com.book.vo.MemberVO;

public class BookReturnController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String bookName = request.getParameter("bookName");
		String id = request.getParameter("id");
		
		MemberService service = MemberService.getInstance();
		MemberVO member = service.memberSearch(id);
		BookVO book = new BookVO();
		book.setBookName(bookName);
		book.setInfo("x");
		book.setUser(" ");
		book.setBorrowedAt(" ");
		
		if((member.getBook1()).equals(bookName)) {
			member.setBook1(" ");
			service.memberBook1Borrow(member);
		}
		else if((member.getBook2()).equals(bookName)) {
			member.setBook2(" ");
			service.memberBook2Borrow(member);
		}
		else if((member.getBook3()).equals(bookName)) {
			member.setBook3(" ");
			service.memberBook3Borrow(member);
		}else {
			request.setAttribute("result", "대여는 3권까지만 가능합니다.");
			HttpUtil.forward(request, response, "/book_search.jsp");
			return;
		}
		
		service.bookBorrow(book);
		
		request.setAttribute("member", member);
		request.setAttribute("book", book);
		request.setAttribute("bookName", bookName);
		
		HttpUtil.forward(request, response, "/result/bookReturnOutput.jsp");
		return;

	}
}

