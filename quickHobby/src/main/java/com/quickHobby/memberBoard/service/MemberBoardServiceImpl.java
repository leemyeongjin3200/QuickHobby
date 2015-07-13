package com.quickHobby.memberBoard.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.member.dto.MemberDto;
import com.quickHobby.memberBoard.dao.MemberBoardDao;
import com.quickHobby.memberBoard.dto.MemberBoardDto;


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
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		//	boardDto=boardDao.boardRead(boardNumber);
		
		//BoardDto boardDto=(BoardDto) map.get("boardDto");	
		int memberNum=Integer.parseInt(request.getParameter("memberNum"));
		logger.info("memberNum:"+memberNum);
		String memberNickName=request.getParameter("memberNickName");
		logger.info("memberNickName:"+memberNickName);
		//memberDto=memberBoardDao.getNum(memberNum);
		
		
		//잘된것 일단 주석처리
		/*String memberNickName=request.getParameter("memberNickName");
		
		logger.info("memberNickName:"+memberNickName);
		memberDto=memberBoardDao.getNumm(memberNickName);
		logger.info("memberDao:"+memberDto);
		int member_num=memberDto.getMemberNum();
	logger.info("member_num:"+member_num);*/
	//		AddressDto addressDto=addressDao.selectOk(name);

	//dto로 넘기자 ==테스트
//	MemberBoardDto memberBoardDto=memberBoardDao.selectOk(member_num);
	//logger.info("memberBoardDto:"+memberBoardDto);

	/////
	
///**********************
		//잘된것 잠시 주석처리
		
	List<MemberBoardDto>memberBoardList=null;
	memberBoardList=memberBoardDao.getSumlist(memberNum);
	
	//세 줄을 잘 된것
	logger.info("memberBoardList:"+memberBoardList.size());
	mav.addObject("memberNickName", memberNickName);
	 mav.addObject("memberBoardList",memberBoardList);

	mav.setViewName("memberBoard/list");		
	   
		
	}
	
}
	
	
	
	
	
	
		
		//////
    // int check=memberBoardDao.getNum(memberNickName);
		
	//	logger.info("check:"+check);
		////////
		
		/////////
		
		/*String board_writer=request.getParameter("board_writer");
	    String groupboard_writer=request.getParameter("groupboard_writer");
		logger.info("board_writer:"+board_writer);
		
		
		logger.info("groupboard_writer:"+groupboard_writer);
		//참고하는 형태:BoardDto boardDto=boardDao.boardRead(boardNumber);
		
		*/

  

	
	//List<MemberBoardDto>memberBoardList=null;
	//memberBoardList=memberBoardDao.getSumlist(board_writer,groupboard_writer);
	
//logger.info("jesusList:"+memberBoardList.size());
// mav.addObject("jesusList",memberBoardList);
	
	
	
	
	
//	mav.setViewName("memberBoard/list");



//}
