package com.quickHobby.group.service;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.group.dao.GroupDao;
import com.quickHobby.group.dto.GroupDto;
import com.quickHobby.member.dto.MemberDto;

/**
* @name : GroupServiceImpl
* @date : 2015. 7. 31.
* @author : 이명진
* @description : 그룹목록을 관리하는 service
 */
@Component
public class GroupServiceImpl implements GroupService {	
	@Autowired
	private GroupDao groupDao;

	/**
	* @name : myGroupList
	* @date : 2015. 7. 31.
	* @author : 이명진
	* @description : 회원번호를 dao로 넘겨 그룹목록을 가져온다
	 */
	@Override
	public void myGroupList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		
		HttpServletRequest req=(HttpServletRequest)map.get("request");
		MemberDto member=(MemberDto)req.getSession().getAttribute("member");
		
		List<GroupDto> groupList=groupDao.myGroupList(member.getMemberNum());
		for(int i=0; i<groupList.size(); i++){
			String filePath=groupList.get(i).getGroupFilePath();
			String fileName=null;
			if(filePath==null){
				fileName="default.jpg";
			}else{
				fileName=groupList.get(i).getGroupFileName();
			}
			groupList.get(i).setGroupFileName(fileName);
		}
		
		mav.addObject("groupList", groupList);
		mav.setViewName("myGroup/myGroupList");
	}
}
