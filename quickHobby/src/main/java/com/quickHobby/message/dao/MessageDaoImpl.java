package com.quickHobby.message.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.message.dto.MessageDto;

/*
 * @name        : MessageDaoImpl
 * @date        : 2015. 6. 25.
 * @author      : ���α�
 * @description : Message Table DAO
 */
@Component
public class MessageDaoImpl implements MessageDao {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int send(MessageDto messageDto){
		return sqlSession.insert("messageSend", messageDto);
	}
	
	public List<MessageDto> getReceiveList(int message_receiver){
		return sqlSession.selectList("messageReceiveList", message_receiver);
	}

	public List<MessageDto> getSendList(int message_sender){
		return sqlSession.selectList("messageSendList", message_sender);
	}
	
	public MessageDto getMessageDto(int message_num){
		return sqlSession.selectOne("getMessageDto", message_num);
	}
	
	public int delete(int message_num){
		return sqlSession.delete("messageDelete", message_num);
	}

	@Override
	public int getMessageCount() {
		return sqlSession.selectOne("getMessageCount");
	}

	@Override
	public List<MessageDto> getMessageList(int startRow, int endRow) {
		Map<String,Integer>map=new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("getMessageList", map);
	}
}
