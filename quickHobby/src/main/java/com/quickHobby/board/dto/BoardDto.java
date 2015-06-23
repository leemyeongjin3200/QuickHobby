package com.quickHobby.board.dto;

import java.util.Date;

public class BoardDto {
	private int boardNum;
	private String boardWriter;
	private String boardSubject;
	private String boardContent;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private String boardFileName;
	private String boardFilePath;
	private long boardFileSize;
	
	private int boardVisible;
	private int boardRecommand;
	private int boardReadCount;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardSubject() {
		return boardSubject;
	}
	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardCreateDate() {
		return boardCreateDate;
	}
	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}
	public Date getBoardModifyDate() {
		return boardModifyDate;
	}
	public void setBoardModifyDate(Date boardModifyDate) {
		this.boardModifyDate = boardModifyDate;
	}
	public String getBoardFileName() {
		return boardFileName;
	}
	public void setBoardFileName(String boardFileName) {
		this.boardFileName = boardFileName;
	}
	public String getBoardFilePath() {
		return boardFilePath;
	}
	public void setBoardFilePath(String boardFilePath) {
		this.boardFilePath = boardFilePath;
	}
	public long getBoardFileSize() {
		return boardFileSize;
	}
	public void setBoardFileSize(long boardFileSize) {
		this.boardFileSize = boardFileSize;
	}
	public int getBoardVisible() {
		return boardVisible;
	}
	public void setBoardVisible(int boardVisible) {
		this.boardVisible = boardVisible;
	}
	public int getBoardRecommand() {
		return boardRecommand;
	}
	public void setBoardRecommand(int boardRecommand) {
		this.boardRecommand = boardRecommand;
	}
	public int getBoardReadCount() {
		return boardReadCount;
	}
	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}
}
