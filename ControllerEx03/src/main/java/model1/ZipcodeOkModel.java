package model1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

public class ZipcodeOkModel implements ZipcodeModel {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String strDong = request.getParameter("dong");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 출력 결과를 담아주기 위한 변수 선언
		ArrayList<String> lists = new ArrayList<String>();
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
			
			conn = dataSource.getConnection();
			
			String sql = "select zipcode, sido, gugun, dong, ri, bunji from zipcode where dong like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strDong + "%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String zipcode = rs.getString("zipcode");
				String sido = rs.getString("sido");
				String gugun = rs.getString("gugun");
				String dong = rs.getString("dong");
				String ri = rs.getString("ri");
				String bunji = rs.getString("bunji");
				
				String address = String.format("[%s] %s %s %s %s %s", zipcode, sido, gugun, dong, ri, bunji);
				//System.out.println( zipcode );
				
				lists.add(address);
			}
			
		} catch (NamingException e) {
			System.out.println("[에러 : ]" + e.getMessage());
		} catch (SQLException e) {
			System.out.println("[에러 : ]" + e.getMessage());
		} finally {
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
		}
		
		// request의 setAttribute를 이용한 값 전달.
		// setAttribute ( key : value ) 를이용한다.
		request.setAttribute("lists", lists);
	}
}