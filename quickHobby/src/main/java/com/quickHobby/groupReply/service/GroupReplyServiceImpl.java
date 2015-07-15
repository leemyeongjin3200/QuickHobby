package com.quickHobby.groupReply.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.quickHobby.groupReply.dao.GroupReplyDao;

@Component
public class GroupReplyServiceImpl implements GroupReplyService {
	@Autowired
	private GroupReplyDao groupReplyDao;
}
