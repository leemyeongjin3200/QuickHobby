package com.quickHobby.groupBoard.dto;

import java.util.Date;

public class GroupBoardDto {
	private int groupBoardNum;
	private int groupBoardGroupNum;
	private int groupBoardWriter;
	private String groupBoardSubject;
	private String groupBoardContent;
	private Date groupBoardCreateDate;
	private Date groupBoardModifyDate;
	private String groupBoardFileName;
	private String groupBoardFilePath;
	private long groupBoardFileSize;
	private int groupBoardVisible;
	private int groupBoardReadCount;
	private String groupBoardWriterNick;
	private int groupBoardReplyCount;
	
	public int getGroupBoardNum() {
		return groupBoardNum;
	}
	public void setGroupBoardNum(int groupBoardNum) {
		this.groupBoardNum = groupBoardNum;
	}
	public int getGroupBoardGroupNum() {
		return groupBoardGroupNum;
	}
	public void setGroupBoardGroupNum(int groupBoardGroupNum) {
		this.groupBoardGroupNum = groupBoardGroupNum;
	}
	public int getGroupBoardWriter() {
		return groupBoardWriter;
	}
	public void setGroupBoardWriter(int groupBoardWriter) {
		this.groupBoardWriter = groupBoardWriter;
	}
	public String getGroupBoardSubject() {
		return groupBoardSubject;
	}
	public void setGroupBoardSubject(String groupBoardSubject) {
		this.groupBoardSubject = groupBoardSubject;
	}
	public String getGroupBoardContent() {
		return groupBoardContent;
	}
	public void setGroupBoardContent(String groupBoardContent) {
		this.groupBoardContent = groupBoardContent;
	}
	public Date getGroupBoardCreateDate() {
		return groupBoardCreateDate;
	}
	public void setGroupBoardCreateDate(Date groupBoardCreateDate) {
		this.groupBoardCreateDate = groupBoardCreateDate;
	}
	public Date getGroupBoardModifyDate() {
		return groupBoardModifyDate;
	}
	public void setGroupBoardModifyDate(Date groupBoardModifyDate) {
		this.groupBoardModifyDate = groupBoardModifyDate;
	}
	public String getGroupBoardFileName() {
		return groupBoardFileName;
	}
	public void setGroupBoardFileName(String groupBoardFileName) {
		this.groupBoardFileName = groupBoardFileName;
	}
	public String getGroupBoardFilePath() {
		return groupBoardFilePath;
	}
	public void setGroupBoardFilePath(String groupBoardFilePath) {
		this.groupBoardFilePath = groupBoardFilePath;
	}
	public long getGroupBoardFileSize() {
		return groupBoardFileSize;
	}
	public void setGroupBoardFileSize(long groupBoardFileSize) {
		this.groupBoardFileSize = groupBoardFileSize;
	}
	public int getGroupBoardVisible() {
		return groupBoardVisible;
	}
	public void setGroupBoardVisible(int groupBoardVisible) {
		this.groupBoardVisible = groupBoardVisible;
	}
	public int getGroupBoardReadCount() {
		return groupBoardReadCount;
	}
	public void setGroupBoardReadCount(int groupBoardReadCount) {
		this.groupBoardReadCount = groupBoardReadCount;
	}
	public String getGroupBoardWriterNick() {
		return groupBoardWriterNick;
	}
	public void setGroupBoardWriterNick(String groupBoardWriterNick) {
		this.groupBoardWriterNick = groupBoardWriterNick;
	}
	public int getGroupBoardReplyCount() {
		return groupBoardReplyCount;
	}
	public void setGroupBoardReplyCount(int groupBoardreplyCount) {
		this.groupBoardReplyCount = groupBoardreplyCount;
	}
}