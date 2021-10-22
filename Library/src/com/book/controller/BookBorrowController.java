package com.book.controller;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.*;

import com.book.service.MemberService;
import com.book.vo.BookVO;
import com.book.vo.MemberVO;

public class BookBorrowController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String bookName = request.getParameter("bookName");
		String info = request.getParameter("info");
		String id = request.getParameter("id");
		
		MemberService service = MemberService.getInstance();
		
		
		ArrayList<BookVO> list = service.bookList();
		
		
		if (info.equals("o")) {
			request.setAttribute("list", list);
			request.setAttribute("result", "이미 대여중인 도서입니다.");
			HttpUtil.forward(request, response, "/book_search.jsp");
			return;
		}

		Date date2 = new Date();
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(simple.format(date2));
		
		MemberVO member = service.memberSearch(id);
		BookVO book = new BookVO();
		book.setBookName(bookName);
		book.setInfo("o");
		book.setUser(id);
		book.setBorrowedAt(simple.format(date2));
		
		if((member.getBook1()).equals(" ")) {
			member.setBook1(bookName);
			service.memberBook1Borrow(member);
		}
		else if((member.getBook2()).equals(" ")) {
			member.setBook2(bookName);
			service.memberBook2Borrow(member);
		}
		else if((member.getBook3()).equals(" ")) {
			member.setBook3(bookName);
			service.memberBook3Borrow(member);
		}else {
			request.setAttribute("list", list);
			request.setAttribute("result", "대여는 3권까지만 가능합니다.");
			HttpUtil.forward(request, response, "/book_search.jsp");
			return;
		}
		
		service.bookBorrow(book);

		request.setAttribute("list", list);
		request.setAttribute("member", member);
		request.setAttribute("book", book);
		request.setAttribute("bookName", bookName);
		
		HttpUtil.forward(request, response, "/result/bookBorrowOutput.jsp");
		return;

	}
}

