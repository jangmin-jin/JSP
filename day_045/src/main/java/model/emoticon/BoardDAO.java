package model.emoticon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	
	private DataSource dataSource;
	
	// 생성자
	public BoardDAO() {
		// TODO Auto-generated constructor stub
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource)envCtx.lookup("jdbc/mariadb");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		}
	}
	
	public int boardWriteOk( BoardTO to ) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		try{
			// 연결
			conn = this.dataSource.getConnection();
			
			// 데이터 삽입
			String sql = "insert into emot_board1 values (0, ?, ?, ?, ?, ?, ?, 0, ?, now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSubject());
			pstmt.setString(2, to.getWriter());
			pstmt.setString(3, to.getMail());
			pstmt.setString(4, to.getPassword());
			pstmt.setString(5, to.getContent());
			pstmt.setString(6, to.getEmot());
			pstmt.setString(7, to.getWip());
			
			if( pstmt.executeUpdate() == 1 ){
				flag = 0;
			};
			
		} catch (SQLException e){
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try{ conn.close(); } catch( SQLException e ) {}
		}
		// flag 리턴
		return flag;
	}
	
	
	public ArrayList<BoardTO> boardList() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardTO> datas = new ArrayList<BoardTO>();
		
		try{
			// 연결	
			conn = this.dataSource.getConnection();
			
			// 데이터 삽입
			String sql = "select emot, seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate,"
			+ " hit, datediff(now(), wdate) wgap from emot_board1 order by seq desc";
			
			// 게시글을 카운트 하기 위한 추가 선언
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardTO to = new BoardTO();
				
				to.setEmot(rs.getString("emot"));
				to.setSeq( rs.getString("seq") );
				to.setSubject( rs.getString("subject") );
				to.setWriter( rs.getString("writer") );
				to.setWdate( rs.getString("wdate") );
				to.setHit( rs.getString("hit") );
				to.setWgap( rs.getInt("wgap") );
				
				datas.add(to);
			}
			
		} catch (SQLException e){
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try{ conn.close(); } catch( SQLException e ) {}
			if( rs != null ) try{ rs.close(); } catch( SQLException e ) {}
		}
		// datas 리턴
		return datas;
	}
	
	public BoardTO boardView( BoardTO to ) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			// 연결
			conn = this.dataSource.getConnection();
			
			// 첫번째 쿼리 : 게시글을 볼때마다 조회수를 증가시킨다.
			String sql = "update emot_board1 set hit=hit+1 where seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			
			rs = pstmt.executeQuery();
			
			// 데이터 삽입
			// 두번째 쿼리 : view 실행을 위해 필요한 값을 전부 가져온다.
			sql = "select subject, writer, mail, wip, wdate, hit, content, emot from emot_board1 where seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
				to.setMail(rs.getString("mail"));
				to.setWip(rs.getString("wip"));
				to.setWdate(rs.getString("wdate"));
				to.setHit(rs.getString("hit"));
				to.setContent(rs.getString("content"));
				to.setEmot(rs.getString("emot"));
			}
			
		} catch (SQLException e){
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try{ conn.close(); } catch( SQLException e ) {}
			if( rs != null ) try{ rs.close(); } catch( SQLException e ) {}
		}
		// to 리턴
		return to;
	}
	public BoardTO boardModify( BoardTO to ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			// 연결
			conn = this.dataSource.getConnection();
			
			// 데이터 삽입
			String sql = "select writer, subject, content, mail, emot from emot_board1 where seq=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				to.setWriter(rs.getString("writer"));
				to.setSubject(rs.getString("subject"));
				to.setContent(rs.getString("content"));
				to.setMail(rs.getString("mail"));
				to.setEmot(rs.getString("emot"));
			}
			
		} catch (SQLException e){
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try{ conn.close(); } catch( SQLException e ) {}
			if( rs != null ) try{ rs.close(); } catch( SQLException e ) {}
		}
		// to 리턴
		return to;
	}
	public int boardModifyOk( BoardTO to ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 2;
		try{
			// 연결
			conn = this.dataSource.getConnection();
			
			// 데이터 삽입
			String sql = "update emot_board1 set subject=?, content=?, mail=?, emot=? where seq=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSubject());
			pstmt.setString(2, to.getContent());
			pstmt.setString(3, to.getMail());
			pstmt.setString(4, to.getEmot());
			pstmt.setString(5, to.getSeq());
			pstmt.setString(6, to.getPassword());
			
			// 0: 비밀번호 틀림, 1: 수정 성공, 2: 에러
			int result = pstmt.executeUpdate();
			if( result == 0){
				flag = 1;
			}else if( result == 1 ){
				flag = 0;
			};
			
		} catch (SQLException e){
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try{ conn.close(); } catch( SQLException e ) {}
		}
		// flag 리턴
		return flag;
	}
	public BoardTO boardDelete( BoardTO to ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			// 연결
			conn = this.dataSource.getConnection();
			
			// 데이터 삽입
			String sql = "select subject, writer from emot_board1 where seq=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
			}
			
		} catch (SQLException e){
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try{ conn.close(); } catch( SQLException e ) {}
			if( rs != null ) try{ rs.close(); } catch( SQLException e ) {}
		}
		// to 리턴
		return to;
	}
	
	public int boardDeleteOk( BoardTO to ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 2;
		try{
			// 연결
			conn = this.dataSource.getConnection();
			
			// 데이터 삽입
			String sql = "delete from emot_board1 where seq=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			pstmt.setString(2, to.getPassword());
			
			// 0: 비밀번호 틀림, 1: 삭제 성공, 2: 에러
			int result = pstmt.executeUpdate();
			if( result == 0){
				flag = 1;
			}else if( result == 1 ){
				flag = 0;
			};
			
		} catch (SQLException e){
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try{ conn.close(); } catch( SQLException e ) {}
		}
		// flag 리턴
		return flag;
	}
}
