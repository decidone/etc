package com.book.service;

import java.util.ArrayList;

import com.book.dao.MemberDAO;
import com.book.vo.BookVO;
import com.book.vo.MemberVO;

public class MemberService {

	private static MemberService service = new MemberService();
	public MemberDAO dao = MemberDAO.getInstance();
	
	private MemberService(){}

	public static MemberService getInstance() {
		return service;
	}

	public void memberInsert(MemberVO member) {
		dao.memberInsert(member);
	}

	public MemberVO memberSearch(String id) {
		MemberVO member = dao.memberSearch(id);
		return member;
	}

	public void memberUpdate(MemberVO member) {
		dao.memberUpdate(member);
	}

	public void memberDelete(String id) {
		dao.memberDelete(id);
	}

	public ArrayList<MemberVO> memberList() {
		ArrayList<MemberVO> list = dao.memberList();
		return list;
	}
	
	public MemberVO memberLogin(String id) {
		MemberVO member = dao.memberLogin(id);
		return member;
	}
	
	public void bookInsert(BookVO book) {
		dao.bookInsert(book);
	}
	
	public BookVO bookSearch(String bookName) {
		BookVO book = dao.bookSearch(bookName);
		return book;
	}
	
	public void bookUpdate(BookVO book) {
		dao.bookUpdate(book);
	}
	
	public void bookDelete(String bookName) {
		dao.bookDelete(bookName);
	}
	
	public ArrayList<BookVO> bookList() {
		ArrayList<BookVO> list = dao.bookList();
		return list;
	}
	
	public void bookBorrow(BookVO book) {
		dao.bookBorrow(book);
	}

	public void memberBook1Borrow(MemberVO member) {
		dao.memberBook1Borrow(member);
	}
		public void memberBook2Borrow(MemberVO member) {
		dao.memberBook2Borrow(member);
	}
	public void memberBook3Borrow(MemberVO member) {
		dao.memberBook3Borrow(member);
	}
	
	
}
