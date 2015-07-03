package com.java.jesus.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.jesus.dao.JesusDao;
import com.java.jesus.dto.JesusDto;
/**
*@name : JesusServiceImpl
 *@date:2015. 7. 2.
*@author:염상아
*@description: request로 board_writer의 값과 groupboard_writer의 값을 받아서 이 두 값들을 getSumlist함수를 통해 dao에 넘겨준다.  
                   dao에 넘겨준 값들은 mapper에 들어가 sql문을 실행 시키게 된다. 그리고 mapper에서 얻어낸 sql 결과 값들을 list로 받아서 dto에 저장한 다음 그 저장된 값들을 List로 뽑아 온 다음에 jsp에 값들을 넘겨줘서 board table에 있는 board_Writer에 해당 하는 값들과 groupboard table에 있는 groupboard_writer에 해당하는 값들을 뿌려준다.

 */
@Component
public class JesusServiceImpl implements JesusService{
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	@Autowired
	private JesusDao jesusDao;
	
	
	
	
	@Override
	public void boardWrite(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int board_writer=Integer.parseInt(request.getParameter("board_writer"));
		int groupboard_writer=Integer.parseInt(request.getParameter("groupboard_writer"));
		logger.info("board_writer:"+board_writer);
		logger.info("groupboard_writer:"+groupboard_writer);
		
	//여기서 부터 
		//*****************************************8888
		//int count=jesusDao.getBoardCount();
		//logger.info("boardcount:"+count);
		
		//그룹******
		//int countt=jesusDao.getGroupCount();
//	logger.info("groupcount:"+countt);
	//	List<JesusDto>groupList=null;
	 //  groupList=jesusDao.getGroupList(groupboard_writer);
//	logger.info("groupList:"+groupList.size());
  
		//**************여기까지 잘된것 주석처리
//list로 합치기 그리고 시간 순서대로 정렬하기.
	
	List<JesusDto>jesusList=null;
jesusList=jesusDao.getSumlist(board_writer,groupboard_writer);
	
logger.info("jesusList:"+jesusList.size());
 mav.addObject("jesusList",jesusList);
	
	
	
		//여기서부터 잘된것 주석처리
		//*********보드******************
//		List<JesusDto>boardList=null;
	//boardList=jesusDao.getBoardList(board_writer);
	
//	logger.info("boardList:"+boardList.size());
//		mav.addObject("boardList",boardList);
  // mav.addObject("groupList",groupList);
		//mav.addObject("groupList::",groupList);
	
	mav.setViewName("board/list");
	//***********************************88
	 // JesusDto jesusDto=jesusDao.list(board_writer);
	//	logger.info("boardSelect:"+jesusDto);
//list
		
		
	 //  JesusDto jesusDto1=jesusDao.list1(groupboard_writer);
	//	logger.info("groupboardSelect:"+jesusDto1);	
		
		/*
		 * 
		 
		List<JesusDto>boardList=null;
		boardList=jesusDao.getBoardList(board_writer);
		logger.info("boardList:"+boardList);
		logger.info("boardListSize:"+boardList.size());
		mav.addObject("boardList",boardList);
	    mav.setViewName("board/list");
		
		 * 
		 * 
		 * 
		 * */
		
		//guestList=guestDao.getGuestList(startRow,endRow);
	}

}
