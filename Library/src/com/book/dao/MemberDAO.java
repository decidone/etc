package com.book.dao;

import java.sql.*;
import java.util.ArrayList;

import com.book.vo.BookVO;
import com.book.vo.MemberVO;
import com.mysql.jdbc.Connection;
import com.book.service.MemberService;

public class MemberDAO {

	private static MemberDAO dao = new MemberDAO();
	private MemberDAO(){}

	public static MemberDAO getInstance() {
		return dao;
	}

	public Connection connect() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/library12";
			String user = "root";
			String pwd = "cs1234";
			conn = (Connection) DriverManager.getConnection(url,user,pwd);
			
		} catch (Exception ex) {
			System.out.println("error 1 : " + ex);
		}
		return conn;
	}

	public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception ex) {
				System.out.println("error 2 : " + ex);				
			}
		}
		close(conn, ps);
	}

	public void close(Connection conn, PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception ex) {
				System.out.println("error 3 : " + ex);				
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (Exception ex) {
				System.out.println("error 4 : " + ex);				
			}
		}
	}

	public void memberInsert(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getMail());
			pstmt.setString(5, " ");
			pstmt.setString(6, " ");
			pstmt.setString(7, " ");
		
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("error 5 : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}

	public MemberVO memberSearch(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		MemberVO member = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setMail(rs.getString(4));
				member.setBook1(rs.getString(5));
				member.setBook2(rs.getString(6));
				member.setBook3(rs.getString(7));
			}
		} catch (Exception ex) {
			System.out.println("error 6 : " + ex);
		} finally {
			close(conn, pstmt, rs);
		}
		return member;
	}

	public void memberUpdate(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("update member set passwd=?,name=?,mail=? where id=?");
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getMail());
			pstmt.setString(4, member.getId());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("error 7 : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}

	public void memberDelete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("delete from member where id=?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("error 8 : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}

	public ArrayList<MemberVO> memberList() {

		ArrayList<MemberVO> list = new ArrayList<MemberVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		MemberVO member = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from member");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setMail(rs.getString(4));
				member.setBook1(rs.getString(5));
				member.setBook2(rs.getString(6));
				member.setBook3(rs.getString(7));
				list.add(member);
			}

		} catch (Exception ex) {
			System.out.println("error 9 : " + ex);
		} finally {
			close(conn, pstmt, rs);
		}

		return list;
	}
	public MemberVO memberLogin(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		MemberVO member = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString(1));
				member.setPasswd(rs.getString(2));
				member.setName(rs.getString(3));
				member.setMail(rs.getString(4));
			}
		} catch (Exception ex) {
			System.out.println("error 10 : " + ex);
		} finally {
			close(conn, pstmt, rs);
		}
		return member;
	}
	
	public void bookInsert(BookVO book) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("insert into book values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, book.getBookName());
			pstmt.setString(2, book.getPublisher());
			pstmt.setString(3, book.getAuthor());
			pstmt.setString(4, book.getYear());
			pstmt.setString(5, book.getNumber());
			pstmt.setString(6, " ");
			pstmt.setString(7, "x");
			pstmt.setString(8, " ");
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("error 11 : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}
	
	public BookVO bookSearch(String bookName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		BookVO book = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from book where bookName=?");
			pstmt.setString(1, bookName);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				book = new BookVO();
				book.setBookName(rs.getString(1));
				book.setPublisher(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setYear(rs.getString(4));
				book.setNumber(rs.getString(5));
				book.setUser(rs.getString(6));
				book.setInfo(rs.getString(7));
				book.setBorrowedAt(rs.getString(8));
			}
		} catch (Exception ex) {
			System.out.println("error 12 : " + ex);
		} finally {
			close(conn, pstmt, rs);
		}
		return book;
	}
	
	public void bookUpdate(BookVO book) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("update book set publisher=?,author=?,year=?,number=? where bookName=?");
			pstmt.setString(1, book.getPublisher());
			pstmt.setString(2, book.getAuthor());
			pstmt.setString(3, book.getYear());
			pstmt.setString(4, book.getNumber());
			pstmt.setString(5, book.getBookName());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("error 13 : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}
	
	public void bookDelete(String bookName) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("delete from book where bookName=?");
			pstmt.setString(1, bookName);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("error 14 : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}
	
	public ArrayList<BookVO> bookList() {

		ArrayList<BookVO> list = new ArrayList<BookVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		BookVO book = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("select * from book");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				book = new BookVO();
				book.setBookName(rs.getString(1));
				book.setPublisher(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setYear(rs.getString(4));
				book.setNumber(rs.getString(5));
				book.setUser(rs.getString(6));
				book.setInfo(rs.getString(7));
				book.setBorrowedAt(rs.getString(8));
				list.add(book);
			}

		} catch (Exception ex) {
			System.out.println("error 15 : " + ex);
		} finally {
			close(conn, pstmt, rs);
		}

		return list;
	}
	
	public void bookBorrow(BookVO book) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("update book set user=?,info=?,borrowedAt=? where bookName=?");
			pstmt.setString(1, book.getUser());
			pstmt.setString(2, book.getInfo());
			pstmt.setString(3, book.getBorrowedAt());
			pstmt.setString(4, book.getBookName());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("error 16 : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}
	
	public void memberBook1Borrow(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("update member set book1=? where id=?");
			pstmt.setString(1, member.getBook1());
			pstmt.setString(2, member.getId());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("error 17 : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}
	public void memberBook2Borrow(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("update member set book2=? where id=?");
			pstmt.setString(1, member.getBook2());
			pstmt.setString(2, member.getId());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("error 18 : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}
	public void memberBook3Borrow(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("update member set book3=? where id=?");
			pstmt.setString(1, member.getBook3());
			pstmt.setString(2, member.getId());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("error 19 : " + ex);
		} finally {
			close(conn, pstmt);
		}
	}
}
