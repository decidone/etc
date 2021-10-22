package com.book.controller;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import com.book.service.MemberService;
import com.book.vo.BookVO;
import com.book.vo.MemberVO;

public class BookSearchController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String bookName = request.getParameter("bookName");
		String job = request.getParameter("job");
		
		MemberService service = MemberService.getInstance();
		String path = null;
		if (job.equals("search"))
			path = "/book_Search.jsp";
		else if (job.equals("update"))
			path = "/book_Search.jsp";
		
		
		if (bookName.isEmpty()) {
			request.setAttribute("error", "도서명을 입력해주세요.");
			HttpUtil.forward(request, response, "/book_search.jsp");
			return;
		}

		
		BookVO book2 = service.bookSearch(bookName);
		ArrayList<BookVO> list = service.bookList();

		if (book2 == null) {
			request.setAttribute("result", "검색된 정보가 없습니다.");
			request.setAttribute("info", "A");
			HttpUtil.forward(request, response, "/book_search.jsp");
			return;
		}else {
			
			
		request.setAttribute("list", list);
			
		request.setAttribute("book2", book2);
		
		request.setAttribute("info", book2.getInfo());
		
		HttpUtil.forward(request, response, path);
		return;
		
		
		}
	}
}

