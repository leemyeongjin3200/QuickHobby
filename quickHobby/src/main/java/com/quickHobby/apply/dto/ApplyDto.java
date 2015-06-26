package com.quickHobby.apply.dto;

import java.util.Date;

/*
 * @name        : ApplyDto
 * @date        : 2015. 6. 22.
 * @author      : º≠¿Œ±∏
 * @description : Apply Table DTO
 */
public class ApplyDto {
	private int apply_num;
	private int apply_host;
	private String apply_section;
	private String apply_filename;
	private String apply_filepath;
	private String apply_filesize;
	private String apply_content;
	private String apply_location;
	private String apply_subject;
	private String apply_subtitle;
	private Date apply_createdate;
	private Date apply_modifydate;
	private Date apply_closedate;
	private int apply_recommend;
	private int apply_readcount;
	
	public int getApply_num() {
		return apply_num;
	}
	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
	}
	public int getApply_host() {
		return apply_host;
	}
	public void setApply_host(int apply_host) {
		this.apply_host = apply_host;
	}
	public String getApply_section() {
		return apply_section;
	}
	public void setApply_section(String apply_section) {
		this.apply_section = apply_section;
	}
	public String getApply_filename() {
		return apply_filename;
	}
	public void setApply_filename(String apply_filename) {
		this.apply_filename = apply_filename;
	}
	public String getApply_filepath() {
		return apply_filepath;
	}
	public void setApply_filepath(String apply_filepath) {
		this.apply_filepath = apply_filepath;
	}
	public String getApply_filesize() {
		return apply_filesize;
	}
	public void setApply_filesize(String apply_filesize) {
		this.apply_filesize = apply_filesize;
	}
	public String getApply_content() {
		return apply_content;
	}
	public void setApply_content(String apply_content) {
		this.apply_content = apply_content;
	}
	public String getApply_location() {
		return apply_location;
	}
	public void setApply_location(String apply_location) {
		this.apply_location = apply_location;
	}
	public String getApply_subject() {
		return apply_subject;
	}
	public void setApply_subject(String apply_subject) {
		this.apply_subject = apply_subject;
	}
	public String getApply_subtitle() {
		return apply_subtitle;
	}
	public void setApply_subtitle(String apply_subtitle) {
		this.apply_subtitle = apply_subtitle;
	}
	public Date getApply_createdate() {
		return apply_createdate;
	}
	public void setApply_createdate(Date apply_createdate) {
		this.apply_createdate = apply_createdate;
	}
	public Date getApply_modifydate() {
		return apply_modifydate;
	}
	public void setApply_modifydate(Date apply_modifydate) {
		this.apply_modifydate = apply_modifydate;
	}
	public Date getApply_closedate() {
		return apply_closedate;
	}
	public void setApply_closedate(Date apply_closedate) {
		this.apply_closedate = apply_closedate;
	}
	public int getApply_recommend() {
		return apply_recommend;
	}
	public void setApply_recommend(int apply_recommend) {
		this.apply_recommend = apply_recommend;
	}
	public int getApply_readcount() {
		return apply_readcount;
	}
	public void setApply_readcount(int apply_readcount) {
		this.apply_readcount = apply_readcount;
	}
}