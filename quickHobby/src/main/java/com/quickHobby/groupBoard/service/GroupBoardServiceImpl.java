package com.quickHobby.groupBoard.service;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.groupBoard.dao.GroupBoardDao;
import com.quickHobby.groupBoard.dto.GroupBoardDto;

/**
* @name : GroupBoardServiceImpl
* @date : 2015. 6. 25.
* @author : 차건강
* @description : Group Board 로직 부분
 */
@Component
public class GroupBoardServiceImpl implements GroupBoardService {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private GroupBoardDao groupBoardDao;
	
	/**
	* @name : groupBoardList
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board List 불러오기
	 */
	@Override
	public void groupBoardList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null)pageNumber="1";
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=groupBoardDao.getGroupBoardCount();
		logger.info("count:"+count);
		
		List<GroupBoardDto> groupBoardList=null;
		
		if(count>0){
			groupBoardList=groupBoardDao.getGroupBoardList(startRow, endRow);
		}
		logger.info("groupBoardList:"+groupBoardList.size());
		
		mav.addObject("groupBoardList", groupBoardList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("groupBoard/list");
		
	}

	/**
	* @name : groupBoardWriteForm
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board 글쓰기 페이지로
	 */
	@Override
	public void groupBoardWriteForm(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int groupBoardGroupNum=0;
		
		if(request.getParameter("groupBoardGroupNum")!=null){
			groupBoardGroupNum=Integer.parseInt(request.getParameter("groupBoardGroupNum"));
		}
		
		logger.info("groupBoardGroupNum:"+groupBoardGroupNum);
		
		mav.addObject("groupBoardGroupNum", groupBoardGroupNum);
		
		mav.setViewName("groupBoard/writeForm");
	}

	/**
	* @name : groupBoardWrite
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board 글쓰기 버튼 누른 후
	 */
	@Override
	public void groupBoardWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		GroupBoardDto GroupBoardDto=(GroupBoardDto)map.get("GroupBoardDto");
		
		GroupBoardDto.setGroupBoardReadCount(0);
		
		int check=groupBoardDao.groupBoardWrite(GroupBoardDto);
		logger.info("check:"+check);
		
		mav.addObject("check", check);
		mav.setViewName("groupBoard/writeOk");
		
	}

	/**
	* @name : groupBoardRead
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board 글 제목 눌렀을 때
	 */
	@Override
	public void groupBoardRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int groupBoardNum=Integer.parseInt(request.getParameter("groupBoardNum"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		logger.info("groupBoardNum:"+groupBoardNum);
		logger.info("pageNumber:"+pageNumber);
		
		GroupBoardDto groupBoardDto=groupBoardDao.groupBoardRead(groupBoardNum);
		logger.info("groupBoardDto:"+groupBoardDto);
		
		mav.addObject("groupBoard", groupBoardDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("groupBoard/read");
	}

	/**
	* @name : groupBoardDelete
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board 글의 visible 값 0으로 바꿔서 화면상에서 delete
	 */
	@Override
	public void groupBoardDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int groupBoardNum=Integer.parseInt(request.getParameter("groupBoardNum"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		int check=groupBoardDao.boardDelete(groupBoardNum);
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("groupBoardNum", groupBoardNum);
		mav.setViewName("groupBoard/deleteOk");
	}

	/**
	* @name : groupBoardUpdateForm
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board updateForm 불러오기
	 */
	@Override
	public void groupBoardUpdateForm(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int groupBoardNum=Integer.parseInt(request.getParameter("groupBoardNum"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		GroupBoardDto groupBoardDto=groupBoardDao.groupBoardRead(groupBoardNum);
		
		mav.addObject("groupBoardNum", groupBoardNum);
		mav.addObject("groupBoard", groupBoardDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("groupBoard/updateForm");
	}

	/**
	* @name : groupBoardUpdate
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board 수정한 내용 db에 저장
	 */
	@Override
	public void groupBoardUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		GroupBoardDto groupBoardDto=(GroupBoardDto)map.get("GroupBoardDto");
		// logger.info("boardSubject:"+request.getParameter("boardSubject"));

		int groupBoardNum=Integer.parseInt(request.getParameter("groupBoardNum"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));

		int check=groupBoardDao.groupBoardUpdate(groupBoardDto);
		
		mav.addObject("groupBoardNum", groupBoardNum);
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("groupBoard/updateOk");
		
	}
}
