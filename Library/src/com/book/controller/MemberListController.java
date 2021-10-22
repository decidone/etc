package com.book.controller;


import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import com.book.service.MemberService;
import com.book.vo.MemberVO;

public class MemberListController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService service = MemberService.getInstance();
		ArrayList<MemberVO> list = service.memberList();
		
		request.setAttribute("list", list);
		HttpUtil.forward(request, response, "/member_list.jsp");
		return;
	}
}
