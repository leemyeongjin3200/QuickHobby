package com.quickHobby.group.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.group.service.GroupService;

/**
* @name : GroupController
* @date : 2015. 7. 2.
* @author : 이명진
* @description : myGroup메뉴 선택시 현재 로그인된 회원이 가입되어있는 그룹목록을 가져오기위한 controller
 */
@Controller
public class GroupController {
	@Autowired
	private GroupService groupService;

	/**
	* @name : myGroupList
	* @date : 2015. 7. 2.
	* @author : 이명진
	* @description : 현재 로그인된 회원의 그룹목록을 가져오기 위해 service에 접근한다
	 */
	@RequestMapping(value="/myGroup/myGroupList.do", method=RequestMethod.GET)
	public ModelAndView myGroupList(HttpServletRequest req){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", req);
		groupService.myGroupList(mav);
		
		return mav;
	}
}