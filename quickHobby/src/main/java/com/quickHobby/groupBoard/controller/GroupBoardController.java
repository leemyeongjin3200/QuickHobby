package com.quickHobby.groupBoard.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.groupBoard.dto.GroupBoardDto;
import com.quickHobby.groupBoard.service.GroupBoardService;

/**
* @name : GroupBoardController
* @date : 2015. 6. 25.
* @author : 차건강
* @description : Group Board Controller
 */
@Controller
public class GroupBoardController {
private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private GroupBoardService groupBoardService;
	
	/**
	* @name : groupBoardList
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board 리스트를 불러오는 method
	 */
	@RequestMapping(value="/groupBoard/list.do", method=RequestMethod.GET)
	public ModelAndView groupBoardList(HttpServletRequest request, HttpServletResponse response){
		logger.info("groupBoardList---------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		groupBoardService.groupBoardList(mav);
		return mav;
	}
	
	/**
	* @name : groupBoardWriteForm
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board 글쓰기 페이지 이동 method
	 */
	@RequestMapping(value="/groupBoard/writeForm.do",  method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView groupBoardWriteForm(HttpServletRequest request, HttpServletResponse response){
		logger.info("groupBoardWriteForm---------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		groupBoardService.groupBoardWriteForm(mav);
		return mav;
	}
	
	/**
	* @name : groupBoardWrite
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board 글쓰기 정보 db에 저장
	 */
	@RequestMapping(value="/groupBoard/write.do", method=RequestMethod.POST)
	public ModelAndView groupBoardWrite(MultipartHttpServletRequest request, GroupBoardDto GroupBoardDto){
		logger.info("groupBoardWrite-------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("GroupBoardDto",GroupBoardDto);
		groupBoardService.groupBoardWrite(mav);
		
		return mav;
	}
	
	/**
	* @name : groupBoardRead
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board 글 제목 눌렀을 때 글 내용 보기
	 */
	@RequestMapping(value="/groupBoard/read.do", method=RequestMethod.GET)
	public ModelAndView groupBoardRead(HttpServletRequest request, HttpServletResponse response, GroupBoardDto groupBoardDto){
		logger.info("groupBoardRead-----------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("GroupBoardDto", groupBoardDto);
		groupBoardService.groupBoardRead(mav);
		
		return mav;
	}
	
	/**
	* @name : boardDelete
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Tip & Review Board 글의 visible 값 0으로 바꿔서 화면상에서 delete
	 */
	@RequestMapping(value="/groupBoard/delete.do", method=RequestMethod.POST)
	public ModelAndView groupBoardDelete(HttpServletRequest request, HttpServletResponse response){		
		logger.info("groupBoardDelete------------------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		groupBoardService.groupBoardDelete(mav);
		
		return mav;
	}
	
	/**
	* @name : groupBoardDUpdateForm
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board updateForm 불러오기
	 */
	@RequestMapping(value="/groupBoard/updateForm.do", method=RequestMethod.POST)
	public ModelAndView groupBoardDUpdateForm(HttpServletRequest request, HttpServletResponse response){
		logger.info("boardUpdateForm------------------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		groupBoardService.groupBoardUpdateForm(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/groupBoard/update.do", method=RequestMethod.POST)
	public ModelAndView groupBoardUpdate(GroupBoardDto groupBoardDto, MultipartHttpServletRequest request){
		logger.info("groupBoardUpdate------------------------------------------");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("GroupBoardDto", groupBoardDto);
		groupBoardService.groupBoardUpdate(mav); 
		
		return mav;
	}
}
