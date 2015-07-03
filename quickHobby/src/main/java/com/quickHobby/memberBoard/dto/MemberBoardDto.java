package com.quickHobby.memberBoard.dto;

import java.util.Date;

public class MemberBoardDto {
	private int board_num;
	private int board_writer;
	private String board_subject;
	private String board_content;
	private Date board_createdate;
	private Date board_modifydate;
	private String board_filename;
	private String board_filepath;
	private String board_filesize;
	private int board_visible;
	
	private int board_readcount;
	
	
	
	
	
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(int board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_createdate() {
		return board_createdate;
	}
	public void setBoard_createdate(Date board_createdate) {
		this.board_createdate = board_createdate;
	}
	public Date getBoard_modifydate() {
		return board_modifydate;
	}
	public void setBoard_modifydate(Date board_modifydate) {
		this.board_modifydate = board_modifydate;
	}
	public String getBoard_filename() {
		return board_filename;
	}
	public void setBoard_filename(String board_filename) {
		this.board_filename = board_filename;
	}
	public String getBoard_filepath() {
		return board_filepath;
	}
	public void setBoard_filepath(String board_filepath) {
		this.board_filepath = board_filepath;
	}
	public String getBoard_filesize() {
		return board_filesize;
	}
	public void setBoard_filesize(String board_filesize) {
		this.board_filesize = board_filesize;
	}
	public int getBoard_visible() {
		return board_visible;
	}
	public void setBoard_visible(int board_visible) {
		this.board_visible = board_visible;
	}

	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

}
