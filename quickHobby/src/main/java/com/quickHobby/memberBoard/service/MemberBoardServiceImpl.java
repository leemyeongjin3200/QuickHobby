package com.quickHobby.memberBoard.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.board.dto.BoardDto;
import com.quickHobby.member.dto.MemberDto;
import com.quickHobby.memberBoard.dao.MemberBoardDao;


/**
*@name : JesusServiceImpl
 *@date:2015. 7. 2.
*@author:염상아
*@description: request로 board_writer의 값과 groupboard_writer의 값을 받아서 이 두 값들을 getSumlist함수를 통해 dao에 넘겨준다.  
                   dao에 넘겨준 값들은 mapper에 들어가 sql문을 실행 시키게 된다. 그리고 mapper에서 얻어낸 sql 결과 값들을 list로 받아서 dto에 저장한 다음 그 저장된 값들을 List로 뽑아 온 다음에 jsp에 값들을 넘겨줘서 board table에 있는 board_Writer에 해당 하는 값들과 groupboard table에 있는 groupboard_writer에 해당하는 값들을 뿌려준다.

 */
@Component
public class MemberBoardServiceImpl implements MemberBoardService{
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	@Autowired
	private MemberBoardDao memberBoardDao;
	
	@Override
	public void boardWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");

		MemberDto member=(MemberDto)request.getSession().getAttribute("member");

		List<BoardDto> memberBoardList=null;
		memberBoardList=memberBoardDao.getSumlist(member.getMemberNum());

		logger.info("memberBoardList:"+memberBoardList.size());
		
		mav.addObject("member", member);
		mav.addObject("memberBoardList",memberBoardList);

		mav.setViewName("memberBoard/list");		


	}
	
	public void load(ModelAndView mav) throws Throwable{
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");

		MemberDto member=(MemberDto)request.getSession().getAttribute("member");
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("memberNum", String.valueOf(member.getMemberNum()));
		hMap.put("current", (String)request.getParameter("current"));
		
		List<BoardDto> memberBoardList=memberBoardDao.getNextList(hMap);
		System.out.println("size : " + memberBoardList.size());
		
		if(memberBoardList.size() > 0) {
			PrintWriter out=response.getWriter();
			out.print(memberBoardList);
		}
	}
}