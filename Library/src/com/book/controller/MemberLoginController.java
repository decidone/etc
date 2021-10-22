package com.book.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.service.MemberService;
import com.book.vo.MemberVO;

public class MemberLoginController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		HttpSession session = request.getSession();
		
		MemberService service = MemberService.getInstance();
		MemberVO member = service.memberSearch(id);

		if (member == null) {request.setAttribute("result", "검색된 정보가 없습니다.");}
		
		else {if(!passwd.equals(member.getPasswd()))
				request.setAttribute("result", "비밀번호가 틀립니다.");
		}
		request.setAttribute("member", member);
		session.setAttribute("id", id);
		HttpUtil.forward(request, response, "/result/memberLoginOutput.jsp");
		return;
	}	
}
