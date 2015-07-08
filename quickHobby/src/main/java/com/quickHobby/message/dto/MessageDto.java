package com.quickHobby.message.dto;

import java.util.Date;

/*
 * @name        : MessageDto
 * @date        : 2015. 6. 25.
 * @author      : ���α�
 * @description : Message Table DTO
 */
public class MessageDto {
	private int message_num;
	private int message_sender;
	private int message_receiver;
	private String message_content;
	private Date message_date;
	private String message_read;
	
	public int getMessage_num() {
		return message_num;
	}
	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}
	public int getMessage_sender() {
		return message_sender;
	}
	public void setMessage_sender(int message_sender) {
		this.message_sender = message_sender;
	}
	public int getMessage_receiver() {
		return message_receiver;
	}
	public void setMessage_receiver(int message_receiver) {
		this.message_receiver = message_receiver;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public Date getMessage_date() {
		return message_date;
	}
	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}
	public String getMessage_read() {
		return message_read;
	}
	public void setMessage_read(String message_read) {
		this.message_read = message_read;
	}
}
