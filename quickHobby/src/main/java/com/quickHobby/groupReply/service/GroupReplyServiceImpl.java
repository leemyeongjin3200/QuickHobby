package com.quickHobby.groupReply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.groupReply.dao.GroupReplyDao;
import com.quickHobby.groupReply.dto.GroupReplyDto;

/**
* @name : GroupReplyServiceImpl
* @date : 2015. 7. 18.
* @author : 차건강
* @description : GroupReply Dao 부분과 연결
 */
@Component
public class GroupReplyServiceImpl implements GroupReplyService {
	@Autowired
	private GroupReplyDao groupReplyDao;

	/**
	* @name : GroupReplyServiceImpl
	* @date : 2015. 7. 18.
	* @author : 차건강
	* @description : GroupReply 리스트 Dao에 요청
	 */
	@Override
	public List<GroupReplyDto> getGroupReplyList(int groupBoardNum) {
		return groupReplyDao.getGroupReplyList(groupBoardNum);	
	}

	/**
	* @name : GroupReplyServiceImpl
	* @date : 2015. 7. 18.
	* @author : 차건강
	* @description : GroupReply 작성한 내용 Dao에 전달
	 */
	@Override
	public int groupReplyWrite(GroupReplyDto groupReplyDto) {
		return groupReplyDao.groupReplyWrite(groupReplyDto);
	}

	/**
	* @name : GroupReplyServiceImpl
	* @date : 2015. 7. 18.
	* @author : 차건강
	* @description : GroupReply 삭제할 내용 Dao에 전달
	 */
	@Override
	public int groupReplyDelete(GroupReplyDto groupReplyDto) {
		return groupReplyDao.groupReplyDelete(groupReplyDto);
	}
}
