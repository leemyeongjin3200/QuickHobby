package com.quickHobby.message.dao;

import java.util.List;

import com.quickHobby.message.dto.MessageDto;

public interface MessageDao {
	public int send(MessageDto messageDto);
	public int delete(String message_num);
	public int getMessageCount();
	public List<MessageDto> getMessageList(int startRow, int endRow);
	public int getNewMessage(int memberNum);
	public int readChange(int message_num);
}
