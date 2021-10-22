package com.book.controller;


import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import com.book.service.MemberService;
import com.book.vo.BookVO;
import com.book.vo.MemberVO;

public class BookListController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService service = MemberService.getInstance();
		ArrayList<BookVO> list = service.bookList();
		String path = null;
		String job = request.getParameter("job");
		
		request.setAttribute("list", list);
		
		if(job.equals("info")) {
			path="/book_return.jsp";
		}else if(job.equals("B")) {
			path="/book_search.jsp";
		}
		else {
			path="/book_list.jsp";
		}
		HttpUtil.forward(request, response, path);
		return;
	}
}
