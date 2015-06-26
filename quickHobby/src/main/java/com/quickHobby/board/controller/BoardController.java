package com.quickHobby.board.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.board.dto.BoardDto;
import com.quickHobby.board.service.BoardService;



/**
* @name : BoardController
* @date : 2015. 6. 22.
* @author : 차건강
* @description : Tip & Review Board Controller
 */
@Controller
public class BoardController {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private BoardService boardService;
	
	/**
	* @name : boardList
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 리스트를 불러오는 method
	 */
	@RequestMapping(value="/board/list.do", method=RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response){
		logger.info("boardList---------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		boardService.boardList(mav);
		return mav;
	}
	
	/**
	* @name : boardWriteForm
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 글쓰기 페이지 이동 method
	 */
	@RequestMapping(value="/board/writeForm.do",  method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardWriteForm(HttpServletRequest request, HttpServletResponse response){
		logger.info("boardWriteForm---------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		boardService.boardWriteForm(mav);
		return mav;
	}
	
	/**
	* @name : boardWrite
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 글쓰기 정보 db에 저장
	 */
	@RequestMapping(value="/board/write.do", method=RequestMethod.POST)
	public ModelAndView boardWrite(MultipartHttpServletRequest request, BoardDto BoardDto){
		logger.info("boardWrite-------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("BoardDto",BoardDto);
		boardService.boardWrite(mav);
		
		return mav;
	}
	
	/**
	* @name : boardRead
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 글 제목 눌렀을 때 글 내용 보기
	 */
	@RequestMapping(value="/board/read.do", method=RequestMethod.GET)
	public ModelAndView boardRead(HttpServletRequest request, HttpServletResponse response, BoardDto boardDto){
		logger.info("boardRead-----------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("BoardDto", boardDto);
		boardService.boardRead(mav);
		
		return mav;
	}
	
	/**
	* @name : boardDelete
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 글의 visible 값 0으로 바꿔서 화면상에서 delete
	 */
	@RequestMapping(value="/board/delete.do", method=RequestMethod.POST)
	public ModelAndView boardDelete(HttpServletRequest request, HttpServletResponse response){		
		logger.info("boardDelete------------------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		boardService.boardDelete(mav);
		
		return mav;
	}
	
	/**
	* @name : boardDUpdateForm
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board updateForm 불러오기
	 */
	@RequestMapping(value="/board/updateForm.do", method=RequestMethod.POST)
	public ModelAndView boardDUpdateForm(HttpServletRequest request, HttpServletResponse response){
		logger.info("boardUpdateForm------------------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		boardService.boardUpdateForm(mav);
		
		return mav;
	}
	
	/**
	* @name : boardUpdate
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 수정한 내용 db에 저장
	 */
	@RequestMapping(value="/board/update.do", method=RequestMethod.POST)
	public ModelAndView boardUpdate(BoardDto boardDto, MultipartHttpServletRequest request){
		logger.info("boardUpdate------------------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("BoardDto", boardDto);
		boardService.boardUpdate(mav); 
		
		return mav;
	}
}
