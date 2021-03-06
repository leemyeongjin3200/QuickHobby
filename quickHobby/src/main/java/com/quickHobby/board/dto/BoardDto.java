package com.quickHobby.board.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.quickHobby.boardReply.dto.BoardReplyDto;

public class BoardDto {
	private int rnum;
	private int boardNum;
	private int boardWriter;
	private String boardSubject;
	private String boardContent;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private String boardFileName;
	private String boardFilePath;
	private String boardFileSize;
	
	private int boardVisible;
	private int boardRecommand;
	private int boardReadCount;
	
	private String boardSection;
	
	private List<BoardReplyDto> boardReplyList = new ArrayList<BoardReplyDto>();
	
	private int boardReplyCount;
	
	private String memberNickName;
	
	public int getBoardNum() {
		return boardNum;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(int boardWriter) {
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
	public String getBoardFileSize() {
		return boardFileSize;
	}
	public void setBoardFileSize(String boardFileSize) {
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
	public String getBoardSection() {
		return boardSection;
	}
	public void setBoardSection(String boardSection) {
		this.boardSection = boardSection;
	}
	public List<BoardReplyDto> getBoardReplyList() {
		return boardReplyList;
	}
	public void setBoardReplyList(List<BoardReplyDto> boardReplyList) {
		this.boardReplyList = boardReplyList;
	}
	public int getBoardReplyCount() {
		return boardReplyCount;
	}
	public void setBoardReplyCount(int boardReplyCount) {
		this.boardReplyCount = boardReplyCount;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
}
