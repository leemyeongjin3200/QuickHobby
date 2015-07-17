package com.quickHobby.report.dto;

public class ReportDto {
	private int report_num;
	private int report_sender;
	private int report_receiver;
	private String report_content;
	private int report_boardnum;
	private String report_boardtype;
	
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	public int getReport_sender() {
		return report_sender;
	}
	public void setReport_sender(int report_sender) {
		this.report_sender = report_sender;
	}
	public int getReport_receiver() {
		return report_receiver;
	}
	public void setReport_receiver(int report_receiver) {
		this.report_receiver = report_receiver;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public int getReport_boardnum() {
		return report_boardnum;
	}
	public void setReport_boardnum(int report_boardnum) {
		this.report_boardnum = report_boardnum;
	}
	public String getReport_boardtype() {
		return report_boardtype;
	}
	public void setReport_boardtype(String report_boardtype) {
		this.report_boardtype = report_boardtype;
	}
}
