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

public class BoardDAO {
	private DataSource dataSource;
	
	public BoardDAO() {
		
		try {
			// 연결을 위한 설정
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource)envCtx.lookup("jdbc/mariadb");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		}
	}
	
	public void boardWrite() {
		
	}
	
	public int boardWriteOk(BoardTO to) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
			DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb" );
			
			conn = dataSource.getConnection();
			
			String sql = "insert into board1 values ( 0, ?, ?, ?, ?, ?, 0, ?, now() ) ";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSubject() );
			pstmt.setString( 2, to.getWriter() );
			pstmt.setString( 3, to.getMail() );
			pstmt.setString( 4, to.getPassword() );
			pstmt.setString( 5, to.getContent() );
			pstmt.setString( 6, to.getWip() );	
	
			int result = pstmt.executeUpdate();
			if( result == 1 ) {
				flag = 0;
			}
		} catch( NamingException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try{ conn.close(); } catch( SQLException e ) {}
		}
		
		return flag;
	}
	
	public BoardListTO boardList(BoardListTO listTO) {
		// 연결을 위한 설정
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// BoardListTO에서 값을 가져온다.
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();
		
		try {
			// 연결
			conn = this.dataSource.getConnection();
			
			String sql = "select seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from board1 order by seq desc";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			rs = pstmt.executeQuery();
			
			// 총 게시글 수 계산
			rs.last();
			listTO.setTotalRecord( rs.getRow() );
			rs.beforeFirst();
			
			// System.out.println(listTO.getTotalRecord());
			// System.out.println(recordPerPage);
			
			// 총 페이지수 계산
			listTO.setTotalPage( ( (listTO.getTotalRecord() -1) /recordPerPage ) +1);
			
			// 게시글은 10개만 화면에 표시한다.
			int skip = ( cpage -1 )*recordPerPage;
			if( skip != 0 ) rs.absolute( skip );
			
			// blockPerPage(현재 5)만큼 얼마나 나누어져 있나를 구한다.
			// ex) 총28개의 페이지일때 (5)페이지씩 표시되는 상황이면 총 totalDivPage는 총 (6)덩어리
			int totalPage = listTO.getTotalPage();
			int totalDivPage = ( totalPage / blockPerPage ) - 1 ;
			if( totalPage % blockPerPage > 0){
				totalDivPage ++;
			}
			
			// 값을 전달.
			listTO.setTotalDivPerPage(totalDivPage);
			
			// System.out.println(skip);
			
			// BoardTO에 sql문 결과를 집어넣는다.
			ArrayList<BoardTO> boardlists = new ArrayList<BoardTO>();
			for(int i=0; i<recordPerPage && rs.next(); i++) {
				BoardTO to = new BoardTO();
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
				to.setWdate(rs.getString("wdate"));
				to.setHit(rs.getString("hit"));
				to.setWgap(rs.getInt("wgap"));
				
				boardlists.add(to);
			}
			
			// ArrayList<BoardTO> 형태의 데이터를 전달.
			listTO.setBoardLists(boardlists);
			
			// 이게 뭔 역할을 하는 거였더라 ...?
			listTO.setStartBlock(((cpage -1)/blockPerPage)*blockPerPage +1);
			listTO.setEndBlock(((cpage -1)/blockPerPage)*blockPerPage +blockPerPage);
			if(listTO.getEndBlock() >= listTO.getTotalPage()) {
				listTO.setEndBlock(listTO.getTotalPage());
			}
			
		}catch(SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		}finally {
			if( conn!=null) try { conn.close(); } catch(SQLException e) {}
			if( pstmt!=null) try { pstmt.close(); } catch(SQLException e) {}
			if( rs!=null) try { rs.close(); } catch(SQLException e) {}
		}
		
		// BoardListTO 리턴.
		return listTO;
	}

	public BoardTO boardView( BoardTO to ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
			DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb" );
			
			conn = dataSource.getConnection();
			
			String sql = "update board1 set hit = hit + 1 where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );

			pstmt.executeUpdate();
			
			sql = "select subject, writer, mail, wip, wdate, hit, content from board1 where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setSubject(rs.getString( "subject" ));
				to.setWriter(rs.getString( "writer" ));
				to.setMail(rs.getString( "mail" ));
				to.setWip(rs.getString( "wip" ));
				to.setWdate(rs.getString( "wdate" ));
				to.setHit(rs.getString( "hit" ));
				to.setContent(rs.getString( "content" ));
			}
			
		} catch( NamingException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try{ conn.close(); } catch( SQLException e ) {}
			if( rs != null ) try{ rs.close(); } catch( SQLException e ) {}
		}
		
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
			String sql = "select writer, subject, content, mail from board1 where seq=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				to.setWriter(rs.getString("writer"));
				to.setSubject(rs.getString("subject"));
				to.setContent(rs.getString("content"));
				to.setMail(rs.getString("mail"));
			}
			
		} catch (SQLException e){
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try{ conn.close(); } catch( SQLException e ) {}
			if( rs != null ) try{ rs.close(); } catch( SQLException e ) {}
		}
		
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
			String sql = "update board1 set subject=?, content=?, mail=? where seq=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSubject());
			pstmt.setString(2, to.getContent());
			pstmt.setString(3, to.getMail());
			pstmt.setString(4, to.getSeq());
			pstmt.setString(5, to.getPassword());
			
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
			String sql = "select subject, writer from board1 where seq=?";
			
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
			String sql = "delete from board1 where seq=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			pstmt.setString(2, to.getPassword());
			
			// 데이터 확인
			//System.out.println(password);
			//System.out.println(seq);
			
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