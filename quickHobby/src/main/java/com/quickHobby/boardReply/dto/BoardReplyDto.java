package com.quickHobby.boardReply.dto;

import java.util.Date;

public class BoardReplyDto {
	private int boardReplyNum;
	private int boardReplyWriter;
	private int boardReplyBoardNum;
	private String boardReplyContent;
	private Date boardReplyCreateDate;
	private Date boardReplyModifyDate;
	private String memberNickName;
	
	public int getBoardReplyNum() {
		return boardReplyNum;
	}
	public void setBoardReplyNum(int boardReplyNum) {
		this.boardReplyNum = boardReplyNum;
	}
	public int getBoardReplyWriter() {
		return boardReplyWriter;
	}
	public void setBoardReplyWriter(int boardReplyWriter) {
		this.boardReplyWriter = boardReplyWriter;
	}
	public int getBoardReplyBoardNum() {
		return boardReplyBoardNum;
	}
	public void setBoardReplyBoardNum(int boardReplyBoardNum) {
		this.boardReplyBoardNum = boardReplyBoardNum;
	}
	public String getBoardReplyContent() {
		return boardReplyContent;
	}
	public void setBoardReplyContent(String boardReplyContent) {
		this.boardReplyContent = boardReplyContent;
	}
	public Date getBoardReplyCreateDate() {
		return boardReplyCreateDate;
	}
	public void setBoardReplyCreateDate(Date boardReplyCreateDate) {
		this.boardReplyCreateDate = boardReplyCreateDate;
	}
	public Date getBoardReplyModifyDate() {
		return boardReplyModifyDate;
	}
	public void setBoardReplyModifyDate(Date boardReplyModifyDate) {
		this.boardReplyModifyDate = boardReplyModifyDate;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
}
