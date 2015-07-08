package com.quickHobby.group.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.group.dao.GroupDao;
import com.quickHobby.group.dto.GroupDto;

@Component
public class GroupServiceImpl implements GroupService {
private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private GroupDao groupDao;

	@Override
	public void createForm(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
//		MemberDto member=(MemberDto)request.getSession().getAttribute("member");
//		String groupHost=member.getMemberId();
		
		String groupHost="hahaha";
				
		logger.info("groupHost:"+groupHost);
		
		mav.addObject("groupHost", groupHost);
		
		mav.setViewName("group/createForm");
	}

	@Override
	public void createGroup(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		GroupDto groupDto=(GroupDto)map.get("GroupDto");
		
		int cost=Integer.parseInt(request.getParameter("groupCost"));
		logger.info("cost:"+cost);
		
		try {
			String textDate=request.getParameter("groupDate1");
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date = (Date)format.parse(textDate);
			
			groupDto.setGroupDate(date);
		} catch (ParseException e) {
			logger.info("GroupDate Error");
			e.printStackTrace();
		}
//		int check=groupDao.createGroup(groupDto);
//		logger.info("check:"+check);
//		
//		mav.addObject("check", check);
//		mav.setViewName("group/createOk");
	}
}
