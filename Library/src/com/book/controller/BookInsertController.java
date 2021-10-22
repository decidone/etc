package com.book.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.book.service.MemberService;
import com.book.vo.BookVO;
import com.book.vo.MemberVO;

public class BookInsertController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String bookName = request.getParameter("bookName");
		String publisher = request.getParameter("publisher");
		String author = request.getParameter("author");
		String year = request.getParameter("year");
		String number = request.getParameter("number");
		
		if (bookName.isEmpty() || publisher.isEmpty() || author.isEmpty()||year.isEmpty()||number.isEmpty()) {
			request.setAttribute("error", "모든 항목을 입력해주시기 바랍니다.");
			HttpUtil.forward(request, response, "/book_management.jsp");
			return;
		}

		BookVO book = new BookVO();
		book.setBookName(bookName);
		book.setPublisher(publisher);
		book.setAuthor(author);
		book.setYear(year);
		book.setNumber(number);
		
		MemberService service = MemberService.getInstance();
		service.bookInsert(book);

		request.setAttribute("bookName", bookName);
		HttpUtil.forward(request, response, "/result/bookInsertOutput.jsp");
		return;
	}
}
