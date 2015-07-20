package com.quickHobby.groupReply.dto;

import java.util.Date;

public class GroupReplyDto {
	private int groupReplyNum;
	private int groupReplyWriter;
	private int groupReplyBoardNum;
	private String groupReplyContent;
	private Date groupReplyCreateDate;
	private Date groupReplyModifyDate;
	private String memberNickName;
	private String memberFilePath;
	
	public int getGroupReplyNum() {
		return groupReplyNum;
	}
	public void setGroupReplyNum(int groupReplyNum) {
		this.groupReplyNum = groupReplyNum;
	}
	public int getGroupReplyWriter() {
		return groupReplyWriter;
	}
	public void setGroupReplyWriter(int groupReplyWriter) {
		this.groupReplyWriter = groupReplyWriter;
	}
	public int getGroupReplyBoardNum() {
		return groupReplyBoardNum;
	}
	public void setGroupReplyBoardNum(int groupReplyBoardNum) {
		this.groupReplyBoardNum = groupReplyBoardNum;
	}
	public String getGroupReplyContent() {
		return groupReplyContent;
	}
	public void setGroupReplyContent(String groupReplyContent) {
		this.groupReplyContent = groupReplyContent;
	}
	public Date getGroupReplyCreateDate() {
		return groupReplyCreateDate;
	}
	public void setGroupReplyCreateDate(Date groupReplyCreateDate) {
		this.groupReplyCreateDate = groupReplyCreateDate;
	}
	public Date getGroupReplyModifyDate() {
		return groupReplyModifyDate;
	}
	public void setGroupReplyModifyDate(Date groupReplyModifyDate) {
		this.groupReplyModifyDate = groupReplyModifyDate;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getMemberFilePath() {
		return memberFilePath;
	}
	public void setMemberFilePath(String memberFilePath) {
		this.memberFilePath = memberFilePath;
	}
}
