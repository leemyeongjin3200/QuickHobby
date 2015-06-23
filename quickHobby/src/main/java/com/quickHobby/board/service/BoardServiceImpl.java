package com.quickHobby.board.service;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.board.dao.BoardDao;
import com.quickHobby.board.dto.BoardDto;


/**
* @name : BoardServiceImpl
* @date : 2015. 6. 22.
* @author : 차건강
* @description : Tip & Review Board 로직 부분
 */

@Component
public class BoardServiceImpl implements BoardService {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public void boardList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null)pageNumber="1";
		
		int boardSize=10;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=boardDao.getBoardCount();
		logger.info("count:"+count);
		
		List<BoardDto> boardList=null;
		if(count>0){
			boardList=boardDao.getBoardList(startRow, endRow);
		}
		logger.info("boardList:"+boardList.size());
		
		mav.addObject("boardList", boardList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board/list");
	}

	/**
	* @name : BoardServiceImpl
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board Write
	 */
	@Override
	public void boardWriteForm(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardNum=0;
		
		if(request.getParameter("boardNum")!=null){
			boardNum=Integer.parseInt(request.getParameter("boardNum"));
		}
		
		logger.info("boardNum:"+boardNum);
		
		mav.addObject("boardNum", boardNum);
		
		mav.setViewName("board/writeForm");
	}

	@Override
	public void boardWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		BoardDto BoardDto=(BoardDto)map.get("BoardDto");
		
		BoardDto.setBoardReadCount(0);
		
		int check=boardDao.insert(BoardDto);
		logger.info("check:"+check);
		
		mav.addObject("check", check);
		mav.setViewName("board/writeOk");
	}
}
