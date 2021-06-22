package model1;

import java.util.ArrayList;

public class BoardListTO {
	// 게시판에 필요한 data들
	private int cpage;
	private int recordPerPage;
	private int blockPerPage;
	private int totalPage;
	private int totalRecord;
	private int startBlock;
	private int endBlock;
	private int totalDivPerPage;
	
	private ArrayList<BoardTO> boardLists;
	
	public BoardListTO() {
		// TODO Auto-generated constructor stub
		// 생성자 호출시 기본값 셋팅
		this.cpage = 1;
		this.recordPerPage = 10;
		this.blockPerPage = 5;
		this.totalPage = 1;
		this.totalRecord = 0;
	}

	public int getCpage() {
		return cpage;
	}

	public void setCpage(int cpage) {
		this.cpage = cpage;
	}

	public int getRecordPerPage() {
		return recordPerPage;
	}

	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}

	public int getBlockPerPage() {
		return blockPerPage;
	}

	public void setBlockPerPage(int blockPerPage) {
		this.blockPerPage = blockPerPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public ArrayList<BoardTO> getBoardLists() {
		return boardLists;
	}

	public void setBoardLists(ArrayList<BoardTO> boardLists) {
		this.boardLists = boardLists;
	}

	public int getTotalDivPerPage() {
		return totalDivPerPage;
	}

	public void setTotalDivPerPage(int totalDivPerPage) {
		this.totalDivPerPage = totalDivPerPage;
	}
	
}