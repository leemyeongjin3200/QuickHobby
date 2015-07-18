package com.quickHobby.boardReply.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quickHobby.boardReply.dto.BoardReplyDto;
import com.quickHobby.boardReply.service.BoardReplyService;
import com.quickHobby.member.dto.MemberDto;

/**
* @name : BoardReplyController
* @date : 2015. 7. 8.
* @author : 차건강
* @description : Tip & Review BoardReply Controller
 */
@Controller
public class BoardReplyController {
private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private BoardReplyService boardReplyService;
	
	/**
	* @name : boardReplyWrite
	* @date : 2015. 7. 8.
	* @author : 차건강
	* @description : boardReply 작성 부분
	 */
	@RequestMapping(value = "boardReply/boardReplyWrite.do", method = RequestMethod.POST)
	public @ResponseBody String boardReplyWrite(BoardReplyDto boardReplyDto, HttpServletRequest request) {

		int boardReplyBoardNum = Integer.parseInt(request.getParameter("boardNum"));
		String boardReplyContent = request.getParameter("boardReplyContent");
		
		MemberDto member=(MemberDto)request.getSession().getAttribute("member");
		int boardReplyWriter=member.getMemberNum();
		logger.info("boardReplyWriter:"+boardReplyWriter);

		boardReplyDto.setBoardReplyWriter(boardReplyWriter);
		boardReplyDto.setBoardReplyBoardNum(boardReplyBoardNum);
		boardReplyDto.setBoardReplyContent(boardReplyContent);
		
		int check=boardReplyService.boardReplyWrite(boardReplyDto);
		
		if (check!=0) {
			try {
				String replyList = getBoardReplyList(boardReplyBoardNum);
				logger.info("replyList:"+replyList);
				return replyList;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	* @name : getBoardReplyList
	* @date : 2015. 7. 9.
	* @author : 차건강
	* @description : boardReply 리스트 불러오기
	 */
	@RequestMapping(value ="/boardReply/getBoardReplyList.do", method = RequestMethod.POST)
	public @ResponseBody String getBoardReplyList(int boardNum) throws Exception {
		logger.info("getBoardReplyList---------------------------------");
		
		List<BoardReplyDto> replyList = new ArrayList<BoardReplyDto>();
		replyList = boardReplyService.getBoardReplyList(boardNum);
		logger.info("replySize:"+replyList.size());
		ObjectMapper obj = new ObjectMapper();
		return URLEncoder.encode(obj.writeValueAsString(replyList), "UTF-8");		
	}
	
	/**
	* @name : boardReplyModify
	* @date : 2015. 7. 13.
	* @author : 차건강
	* @description : boardReply 수정하기
	 */
	@RequestMapping(value = "boardReply/boardReplyModify.do", method = RequestMethod.POST)
	public @ResponseBody String boardReplyModify(BoardReplyDto boardReplyDto, HttpServletRequest request) {
		logger.info("boardReplyModify---------------------------------");
		
		int boardReplyNum = Integer.parseInt(request.getParameter("boardReplyNum"));
		int boardReplyBoardNum = Integer.parseInt(request.getParameter("boardNum"));
		String boardReplyContent = request.getParameter("boardReplyContent");
		
		MemberDto member=(MemberDto)request.getSession().getAttribute("member");
		int boardReplyWriter=member.getMemberNum();
		
		boardReplyDto.setBoardReplyWriter(boardReplyWriter);
		boardReplyDto.setBoardReplyBoardNum(boardReplyBoardNum);
		boardReplyDto.setBoardReplyNum(boardReplyNum);
		boardReplyDto.setBoardReplyContent(boardReplyContent);
		try {
			int check = boardReplyService.boardReplyModify(boardReplyDto);
			if (check!=0) {
				return getBoardReplyList(boardReplyBoardNum);
			}
		} catch (Exception e) {
			System.out.println("Reply Controller Error");
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	* @name : boardReplyDelete
	* @date : 2015. 7. 13.
	* @author : 차건강
	* @description : boardReply 삭제하기
	 */
	@RequestMapping(value = "boardReply/boardReplyDelete.do", method = RequestMethod.POST)
	public @ResponseBody String boardReplyDelete(BoardReplyDto boardReplyDto, HttpServletRequest request) {
		logger.info("boardReplyDelete---------------------------------");
		
		int boardReplyNum = Integer.parseInt(request.getParameter("boardReplyNum"));
		int boardReplyBoardNum = Integer.parseInt(request.getParameter("boardNum"));
		MemberDto member=(MemberDto)request.getSession().getAttribute("member");
		int boardReplyWriter=member.getMemberNum();
		
		boardReplyDto.setBoardReplyWriter(boardReplyWriter);
		boardReplyDto.setBoardReplyBoardNum(boardReplyBoardNum);
		boardReplyDto.setBoardReplyNum(boardReplyNum);
		try {
			int check = boardReplyService.boardReplyDelete(boardReplyDto);
			if (check!=0) {
				return getBoardReplyList(boardReplyBoardNum);
			}
		} catch (Exception e) {
			System.out.println("Reply Controller Error");
			e.printStackTrace();
		}
		return null;
	}
}
