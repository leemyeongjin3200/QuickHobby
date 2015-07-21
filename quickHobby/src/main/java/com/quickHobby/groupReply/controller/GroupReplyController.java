package com.quickHobby.groupReply.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quickHobby.groupReply.dto.GroupReplyDto;
import com.quickHobby.groupReply.service.GroupReplyService;
import com.quickHobby.member.dto.MemberDto;

/**
* @name : GroupReplyController
* @date : 2015. 7. 18.
* @author : 차건강
* @description : GroupBoard Reply Controller
 */
@Controller
public class GroupReplyController {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	@Autowired
	private GroupReplyService groupReplyService;
	
	/**
	* @name : groupReplyWrite
	* @date : 2015. 7. 18.
	* @author : 차건강
	* @description : groupReply 작성
	 */
	@RequestMapping(value = "/groupReply/groupReplyWrite.do", method = RequestMethod.POST)
	public @ResponseBody String groupReplyWrite(GroupReplyDto groupReplyDto, HttpServletRequest request) {

		int groupReplyBoardNum = Integer.parseInt(request.getParameter("groupBoardNum"));
		String groupReplyContent = request.getParameter("groupReplyContent");
		
		MemberDto member=(MemberDto)request.getSession().getAttribute("member");
		int groupReplyWriter=member.getMemberNum();
		logger.info("groupReplyWriter:"+groupReplyWriter);

		groupReplyDto.setGroupReplyWriter(groupReplyWriter);
		groupReplyDto.setGroupReplyBoardNum(groupReplyBoardNum);
		groupReplyDto.setGroupReplyContent(groupReplyContent);
		
		int check=groupReplyService.groupReplyWrite(groupReplyDto);
		
		if (check!=0) {
			try {
				String groupReplyList = getGroupReplyList(groupReplyBoardNum);
				logger.info("groupReplyList:"+groupReplyList);
				return groupReplyList;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	* @name : getGroupReplyList
	* @date : 2015. 7. 18.
	* @author : 차건강
	* @description : groupReply List 불러오기
	 */
	@RequestMapping(value ="/groupReply/getGroupReplyList.do", method = RequestMethod.POST)
	public @ResponseBody String getGroupReplyList(int groupBoardNum) throws Exception {
		logger.info("getGroupReplyList---------------------------------");
		
		List<GroupReplyDto> groupReplyList = new ArrayList<GroupReplyDto>();
		groupReplyList = groupReplyService.getGroupReplyList(groupBoardNum);
		for(int i=0; i<groupReplyList.size(); i++){
			String filePath=groupReplyList.get(i).getMemberFilePath();
			String fileName=null;
			if(filePath!=null){
				fileName=filePath.split("\\\\")[10];
			}else{
				fileName="default.PNG";
				filePath="C:\\Users\\KOSTA\\git\\QuickHobby\\quickHobby\\src\\main\\webapp\\pds\\default.PNG";
			}
			
			groupReplyList.get(i).setMemberFileName(fileName);
		}
		logger.info("groupReplyListSize:"+groupReplyList.size());
		ObjectMapper obj = new ObjectMapper();
		return URLEncoder.encode(obj.writeValueAsString(groupReplyList), "UTF-8");		
	}
	
	/**
	* @name : groupReplyModify
	* @date : 2015. 7. 18.
	* @author : 차건강
	* @description : groupReply 수정
	 */
	@RequestMapping(value = "groupReply/groupReplyModify.do", method = RequestMethod.POST)
	public @ResponseBody String groupReplyModify(GroupReplyDto groupReplyDto, HttpServletRequest request) {
		logger.info("groupReplyModify---------------------------------");
		
		int groupReplyNum = Integer.parseInt(request.getParameter("groupReplyNum"));
		int groupReplyBoardNum = Integer.parseInt(request.getParameter("groupReplyBoardNum"));
		String groupReplyContent = request.getParameter("groupReplyContent");
		
		MemberDto member=(MemberDto)request.getSession().getAttribute("member");
		int groupReplyWriter=member.getMemberNum();
		
		groupReplyDto.setGroupReplyWriter(groupReplyWriter);
		groupReplyDto.setGroupReplyBoardNum(groupReplyBoardNum);
		groupReplyDto.setGroupReplyNum(groupReplyNum);
		groupReplyDto.setGroupReplyContent(groupReplyContent);
		try {
			int check = groupReplyService.groupReplyModify(groupReplyDto);
			if (check!=0) {
				return getGroupReplyList(groupReplyBoardNum);
			}
		} catch (Exception e) {
			System.out.println("groupReply Controller Error");
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	* @name : groupReplyDelete
	* @date : 2015. 7. 18.
	* @author : 차건강
	* @description : groupReply 삭제
	 */
	@RequestMapping(value = "groupReply/groupReplyDelete.do", method = RequestMethod.POST)
	public @ResponseBody String groupReplyDelete(GroupReplyDto groupReplyDto, HttpServletRequest request) {
		logger.info("groupReplyDelete---------------------------------");
		
		int groupReplyNum = Integer.parseInt(request.getParameter("groupReplyNum"));
		int groupReplyBoardNum = Integer.parseInt(request.getParameter("groupReplyBoardNum"));
		MemberDto member=(MemberDto)request.getSession().getAttribute("member");
		int groupReplyWriter=member.getMemberNum();
		
		groupReplyDto.setGroupReplyWriter(groupReplyWriter);
		groupReplyDto.setGroupReplyBoardNum(groupReplyBoardNum);
		groupReplyDto.setGroupReplyNum(groupReplyNum);
		try {
			int check = groupReplyService.groupReplyDelete(groupReplyDto);
			if (check!=0) {
				return getGroupReplyList(groupReplyBoardNum);
			}
		} catch (Exception e) {
			System.out.println("groupReply Controller Error");
			e.printStackTrace();
		}
		return null;
	}
}
