package com.book.controller;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import com.book.service.MemberService;
import com.book.vo.BookVO;
import com.book.vo.MemberVO;

public class MemberClickController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		
		MemberService service = MemberService.getInstance();
		String path = null;
			path = "/member_list.jsp";	
		
		if (id.isEmpty()) {
			request.setAttribute("error", "ID를 입력해주세요.");
			HttpUtil.forward(request, response, path);
			return;
		}

		MemberVO member2 = service.memberSearch(id);

		if (member2 == null) request.setAttribute("result", "검색된 정보가 없습니다.");
		request.setAttribute("member2", member2);
		
		ArrayList<MemberVO> list = service.memberList();
		
		request.setAttribute("list", list);
		HttpUtil.forward(request, response, path);
		return;
		
	}
}
