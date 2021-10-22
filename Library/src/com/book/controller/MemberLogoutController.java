package com.book.controller;


import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import com.book.service.MemberService;
import com.book.vo.MemberVO;

public class MemberLogoutController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		session.invalidate();
		
		HttpUtil.forward(request, response, "/result/logoutOutput.jsp");
		return;
	}
}
