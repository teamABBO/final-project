package com.kosta.abbo.android.httpdata;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {

	ArrayList<UserDAO> list;

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.0.27:1521:XE";
	String userid = "Dream";
	String passwd = "Dream";

	public UserDAO() {

		try {
			list = new ArrayList<UserDAO>();
			Class.forName(driver);

		} catch (ClassNotFoundException e) {

			e.printStackTrace();

		} // end try~catch
	}// end 생성자

	
	
	
	
	/**
	 * 아이디 비밀번호 확인(로그인)
	 * 
	 * @param id
	 * @param pw
	 * @return
	 */
	public String ismember(String id, String pw) {

		UserDTO dto = new UserDTO();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String loginType;

		try {

			// Connection 맺기
			con = DriverManager.getConnection(url, userid, passwd);

			// sql 문 작성
			String sql = "SELECT id,pw,type FROM users WHERE id=? AND pw=?";

			// Statement 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			// sql 문 전송
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setType(rs.getString("type"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} // end try~catch

		finally {

			// 자원 반납
			try {

				rs.close();
				pstmt.close();
				con.close();

			} catch (SQLException se) {
				se.printStackTrace();
			}

		}
		System.out.println(dto.getType());
		loginType = dto.getType();
		return loginType;
		// db 연동 끝
	}// end select()

	
	
	
	
	
	/**
	 * 노말유저 회원가입
	 * 
	 * @param id
	 * @param pw
	 * @param name
	 * @param phone
	 * @param like
	 */
	public String normalJoinUs(String id, String pw, String name, int phone, int like_area) {

		UserDTO dto = new UserDTO();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			// Connection 맺기
			con = DriverManager.getConnection(url, userid, passwd);

			// sql 문 작성
			String sql = "INSERT into users(user_id,id,name,type,pw,phone,regdate,like_area) "
					+ "values (user_id_seq.NEXTVAL,?,?,'normal',?,?,sysdate,?)";

			// Statement 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, pw);
			pstmt.setInt(4, phone);
			pstmt.setInt(5, like_area);

			// sql 문 전송
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setPhone(phone);
				dto.setLikeArea(like_area);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} // end try~catch

		finally {

			// 자원 반납
			try {

				rs.close();
				pstmt.close();
				con.close();

			} catch (SQLException se) {
				se.printStackTrace();
			}

		}
		return "ok";
		// db 연동 끝
	}// end select()
}
