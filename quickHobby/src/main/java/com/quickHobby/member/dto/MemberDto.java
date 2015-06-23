package com.quickHobby.member.dto;

public class MemberDto {
	private int memberNum;
	private String memberId;
	private String memberPassword;
	private String memberLevel;
	private String memberSNS;
	private int memberReport;
	private String memberFileName;
	private String memberFilePath;
	private String memberFileSize;

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}

	public String getMemberSNS() {
		return memberSNS;
	}

	public void setMemberSNS(String memberSNS) {
		this.memberSNS = memberSNS;
	}

	public int getMemberReport() {
		return memberReport;
	}

	public void setMemberReport(int memberReport) {
		this.memberReport = memberReport;
	}

	public String getMemberFileName() {
		return memberFileName;
	}

	public void setMemberFileName(String memberFileName) {
		this.memberFileName = memberFileName;
	}

	public String getMemberFilePath() {
		return memberFilePath;
	}

	public void setMemberFilePath(String memberFilePath) {
		this.memberFilePath = memberFilePath;
	}

	public String getMemberFileSize() {
		return memberFileSize;
	}

	public void setMemberFileSize(String memberFileSize) {
		this.memberFileSize = memberFileSize;
	}
}
