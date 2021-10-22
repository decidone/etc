package com.book.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.book.service.MemberService;
import com.book.vo.MemberVO;

public class MemberSearchController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String job = request.getParameter("job");
		
		MemberService service = MemberService.getInstance();
		String path = null;
		if (job.equals("search"))
			path = "/memberSearch.jsp";
		else if (job.equals("update"))
			path = "/user_management.jsp";
		else if (job.equals("delete"))
			path = "/memberDelete.jsp";	
		
		if (id.isEmpty()) {
			request.setAttribute("error", "ID를 입력해주세요.");
			HttpUtil.forward(request, response, path);
			return;
		}

		
		MemberVO member = service.memberSearch(id);


		if (member == null) request.setAttribute("result", "검색된 정보가 없습니다.");
		request.setAttribute("member", member);
		if(job.equals("search")) path="/result/memberSearchOutput.jsp";
		HttpUtil.forward(request, response, path);
		return;

	}
}

