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
	
	/**
	* @name : boardList
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board List
	 */
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
	* @name : boardWriteForm
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 글쓰기 페이지로
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

	/**
	* @name : boardWrite
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 글쓰기 버튼 누른 후
	 */
	@Override
	public void boardWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		BoardDto BoardDto=(BoardDto)map.get("BoardDto");
		
		BoardDto.setBoardReadCount(0);
		
		int check=boardDao.boardWrite(BoardDto);
		logger.info("check:"+check);
		
		mav.addObject("check", check);
		mav.setViewName("board/writeOk");
	}

	/**
	* @name : boardRead
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 글 제목 눌렀을 때
	 */
	@Override
	public void boardRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		logger.info("boardNum:"+boardNum);
		logger.info("pageNumber:"+pageNumber);
		
		BoardDto boardDto=boardDao.boardRead(boardNum);
		logger.info("boardDto:"+boardDto);
		
		mav.addObject("board", boardDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/read");
	}

	/**
	* @name : boardDelete
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 글의 visible 값 0으로 바꿔서 화면상에서 delete
	 */
	@Override
	public void boardDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		int check=boardDao.boardDelete(boardNum);
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("boardNum", boardNum);
		mav.setViewName("board/deleteOk");
	}

	/**
	* @name : boardUpdateForm
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board updateForm 불러오기
	 */
	@Override
	public void boardUpdateForm(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		BoardDto boardDto=boardDao.boardRead(boardNum);
		
		mav.addObject("boardNum", boardNum);
		mav.addObject("board", boardDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/updateForm");
		
	}

	/**
	* @name : boardUpdate
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 수정한 내용 db에 저장
	 */
	@Override
	public void boardUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		BoardDto boardDto=(BoardDto)map.get("BoardDto");
		// logger.info("boardSubject:"+request.getParameter("boardSubject"));

		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));

		int check=boardDao.boardUpdate(boardDto);
		
		mav.addObject("boardNum", boardNum);
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/updateOk");
		
	}
}
