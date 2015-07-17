package com.quickHobby.groupBoard.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.quickHobby.groupReply.dto.GroupReplyDto;

public class GroupBoardDto {
	private int groupRowNum;
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
	
	private List<GroupReplyDto> groupReplyList = new ArrayList<GroupReplyDto>();
	private int groupReplyCount;
	private String memberNickName;
	
	public int getGroupRowNum() {
		return groupRowNum;
	}
	public void setGroupRowNum(int groupRowNum) {
		this.groupRowNum = groupRowNum;
	}
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
	public List<GroupReplyDto> getGroupReplyList() {
		return groupReplyList;
	}
	public void setGroupReplyList(List<GroupReplyDto> groupReplyList) {
		this.groupReplyList = groupReplyList;
	}
	public int getGroupReplyCount() {
		return groupReplyCount;
	}
	public void setGroupReplyCount(int groupReplyCount) {
		this.groupReplyCount = groupReplyCount;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
}