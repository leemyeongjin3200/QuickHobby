package com.quickHobby.message.dao;

import java.util.List;

import com.quickHobby.message.dto.MessageDto;

public interface MessageDao {
	public int send(MessageDto messageDto);
	public List<MessageDto> getReceiveList(int message_receiver);
	public List<MessageDto> getSendList(int message_sender);
	public MessageDto getMessageDto(int message_num);
	public int delete(int message_num);
}
