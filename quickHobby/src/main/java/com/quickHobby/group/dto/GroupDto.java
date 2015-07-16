package com.quickHobby.group.dto;

import java.util.Date;

public class GroupDto {
	private int groupNum;
	private String groupCategory;
	private String groupInout;
	private String groupHost;
	private String groupSubject;
	private String groupSubtitle;
	private String groupLocation;
	private Date groupDate;
	private int groupCost;
	
	private String groupFileName;
	private String groupFilePath;
	private long groupFileSize;
	
	private int groupRecommend;
	
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
		System.out.println(groupNum);
	}
	public String getGroupCategory() {
		return groupCategory;
	}
	public void setGroupCategory(String groupCategory) {
		this.groupCategory = groupCategory;
	}
	public String getGroupInout() {
		return groupInout;
	}
	public void setGroupInout(String groupInout) {
		this.groupInout = groupInout;
	}
	public String getGroupHost() {
		return groupHost;
	}
	public void setGroupHost(String groupHost) {
		this.groupHost = groupHost;
	}
	public String getGroupSubject() {
		return groupSubject;
	}
	public void setGroupSubject(String groupSubject) {
		this.groupSubject = groupSubject;
	}
	public String getGroupSubtitle() {
		return groupSubtitle;
	}
	public void setGroupSubtitle(String groupSubtitle) {
		this.groupSubtitle = groupSubtitle;
	}
	public String getGroupLocation() {
		return groupLocation;
	}
	public void setGroupLocation(String groupLocation) {
		this.groupLocation = groupLocation;
	}
	public Date getGroupDate() {
		return groupDate;
	}
	public void setGroupDate(Date groupDate) {
		this.groupDate = groupDate;
	}
	public int getGroupCost() {
		return groupCost;
	}
	public void setGroupCost(int groupCost) {
		this.groupCost = groupCost;
	}
	public String getGroupFileName() {
		return groupFileName;
	}
	public void setGroupFileName(String groupFileName) {
		this.groupFileName = groupFileName;
	}
	public String getGroupFilePath() {
		return groupFilePath;
	}
	public void setGroupFilePath(String groupFilePath) {
		this.groupFilePath = groupFilePath;
	}
	public long getGroupFileSize() {
		return groupFileSize;
	}
	public void setGroupFileSize(long groupFileSize) {
		this.groupFileSize = groupFileSize;
	}
	public int getGroupRecommend() {
		return groupRecommend;
	}
	public void setGroupRecommend(int groupRecommend) {
		this.groupRecommend = groupRecommend;
	}
}
