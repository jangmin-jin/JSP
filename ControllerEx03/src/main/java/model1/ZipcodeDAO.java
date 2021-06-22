package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ZipcodeDAO {
	private DataSource dataSource;
	
	// 생성자 호출과 동시에 연결 선언
	public ZipcodeDAO() {
		// TODO Auto-generated constructor stub
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		}
	}
	
	public ArrayList<ZipcodeTO> zipcodeList(ZipcodeTO to){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ZipcodeTO> lists = new ArrayList<ZipcodeTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql ="select zipcode, sido, gugun, dong, ri, bunji from zipcode where dong like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getDong() + "%");
			
			System.out.println(to.getDong());
			
			rs = pstmt.executeQuery();

			while(rs.next()){
				ZipcodeTO zto = new ZipcodeTO();
				zto.setZipcode(rs.getString("zipcode"));
				zto.setSido(rs.getString("sido"));
				zto.setGugun(rs.getString("gugun"));
				zto.setDong(rs.getString("dong"));
				zto.setRi(rs.getString("ri"));
				zto.setBunji(rs.getString("bunji"));
				
				lists.add(zto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if( conn!=null ) try { conn.close(); } catch(SQLException e) {}
			if( pstmt!=null ) try { pstmt.close(); } catch(SQLException e) {}
			if( rs!=null ) try { rs.close(); } catch(SQLException e) {}
		}
		
		return lists;
	}
}