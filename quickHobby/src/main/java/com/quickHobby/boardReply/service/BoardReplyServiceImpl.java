package com.quickHobby.boardReply.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.boardReply.dao.BoardReplyDao;
import com.quickHobby.boardReply.dto.BoardReplyDto;

/**
* @name : BoardReplyServiceImpl
* @date : 2015. 7. 8.
* @author : 차건강
* @description : Tip & Review BoardReply 로직 부분
 */
@Component
public class BoardReplyServiceImpl implements BoardReplyService {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private BoardReplyDao boardReplyDao;

	/**
	* @name : getBoardReplyList
	* @date : 2015. 7. 9.
	* @author : 차건강
	* @description : Tip & Review BoardReply 리스트 DB에 요청
	 */
	public List<BoardReplyDto> getBoardReplyList(int boardNum){
		return boardReplyDao.getBoardReplyList(boardNum);	
	}

	/**
	* @name : boardReplyWrite
	* @date : 2015. 7. 9.
	* @author : 차건강
	* @description : Tip & Review BoardReply 작성한 내용 DB에 저장
	 */
	@Override
	public int boardReplyWrite(BoardReplyDto boardReplyDto) {
		return boardReplyDao.boardReplyWrite(boardReplyDto);
	}
	
	/**
	* @name : boardReplyModify
	* @date : 2015. 7. 13.
	* @author : 차건강
	* @description : Tip & Review BoardReply 수정한 내용 DB에 저장
	 */
	@Override
	public int boardReplyModify(BoardReplyDto boardReplyDto) {
		return boardReplyDao.boardReplyModify(boardReplyDto);
	}

	/**
	* @name : boardReplyModify
	* @date : 2015. 7. 13.
	* @author : 차건강
	* @description : Tip & Review BoardReply DB에서 삭제
	 */
	@Override
	public int boardReplyDelete(BoardReplyDto boardReplyDto) {
		return boardReplyDao.boardReplyDelete(boardReplyDto);
	}

	@Override
	public void boardReplyList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		logger.info("boardNum:"+boardNum);
		
		List<BoardReplyDto> boardReplyList=new ArrayList<BoardReplyDto>();
		
		boardReplyList = boardReplyDao.getBoardReplyList(boardNum);
		logger.info("boardReplyListSize:"+boardReplyList.size());
		ObjectMapper obj = new ObjectMapper();
		String encode="";
		try {
			encode = URLEncoder.encode(obj.writeValueAsString(boardReplyList), "UTF-8");
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		logger.info("encode:"+encode);
		
//		mav.addObject("boardReplyList", boardReplyList);
		mav.addObject("encode", encode);
		mav.setViewName("board/replyCheckModal");
	}
}
