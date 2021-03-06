package com.quickHobby.message.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int send(MessageDto messageDto){
		return sqlSession.insert("message.dao.mapper.messageSend", messageDto);
	}
	
	public int delete(String message_num){
		int messageNum=Integer.parseInt(message_num);
		return sqlSession.delete("message.dao.mapper.messageDelete", messageNum);
	}

	@Override
	public int getMessageCount() {
		return sqlSession.selectOne("getMessageCount");
	}

	@Override
	public List<MessageDto> getMessageList() {
//		Map<String,Integer>map=new HashMap<String, Integer>();
//		map.put("startRow", startRow);
//		map.put("endRow", endRow);
		return sqlSession.selectList("getMessageList");
	}
	
	@Override
	public int getNewMessage(int memberNum) {
		return sqlSession.selectOne("message.dao.mapper.getNewMessage", memberNum);
	}

	@Override
	public int readChange(int message_num) {
		return sqlSession.update("message.dao.mapper.readChange", message_num);
	}
}
