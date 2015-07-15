package com.quickHobby.groupReply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.quickHobby.groupReply.service.GroupReplyService;

@Controller
public class GroupReplyController {
	@Autowired
	private GroupReplyService groupReplyService;
}
