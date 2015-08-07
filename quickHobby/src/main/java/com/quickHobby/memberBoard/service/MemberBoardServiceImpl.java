package com.quickHobby.memberBoard.service;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.board.dto.BoardDto;
import com.quickHobby.boardReply.dao.BoardReplyDao;
import com.quickHobby.boardReply.dto.BoardReplyDto;
import com.quickHobby.member.dao.MemberDao;
import com.quickHobby.member.dto.MemberDto;
import com.quickHobby.memberBoard.dao.MemberBoardDao;

/**
* @name : MemberBoardServiceImpl
* @date : 2015. 7. 6.
* @author : 서인구
* @description : 개인게시판을 제어하기 위한 클래스
 */
@Component
public class MemberBoardServiceImpl implements MemberBoardService{
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	@Autowired
	private MemberBoardDao memberBoardDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BoardReplyDao boardReplyDao;
	
	/**
	* @name : boardWrite
	* @date : 2015. 7. 6.
	* @author : 서인구
	* @description : 개인게시판을 불러오기위해 해당회원번호를 dao로 넘기는 클래스
	 */
	@Override
	public void boardWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");

		MemberDto member=(MemberDto)request.getSession().getAttribute("member");
		int memberNum=Integer.parseInt(request.getParameter("memberNum"));
		MemberDto host=memberDao.getMember(memberNum);
		String hostFilePath=host.getMemberFilePath();
		String[] temp=null;
		String hostFileName=null;
		if(hostFilePath!=null){
			temp=hostFilePath.split("\\\\");
			hostFileName=hostFilePath.split("\\\\")[temp.length-1];
			host.setMemberFileName(hostFileName);
		}
		
		List<BoardDto> memberBoardList=null;
		memberBoardList=memberBoardDao.getSumlist(memberNum);
		
		for(int i=0; i<memberBoardList.size(); i++){
			int comments=boardReplyDao.getBoardReplyCount(memberBoardList.get(i).getBoardNum());
			memberBoardList.get(i).setBoardReplyCount(comments);
			List<BoardReplyDto> boardReplyList=boardReplyDao.getBoardReplyList(memberBoardList.get(i).getBoardNum());
			if(boardReplyList!=null){
				for(int j=0; j<boardReplyList.size(); j++){
					String filePath=boardReplyList.get(j).getMemberFilePath();
					String[] tempName=null;
					String fileName=null;
					if(filePath!=null){
						tempName=filePath.split("\\\\");
						fileName=filePath.split("\\\\")[tempName.length-1];
					}
					boardReplyList.get(j).setMemberFileName(fileName);
				}
				memberBoardList.get(i).setBoardReplyList(boardReplyList);
			}
		}

		logger.info("memberBoardList:"+memberBoardList.size());
		
		mav.addObject("member", member);
		mav.addObject("host", host);
		mav.addObject("memberBoardList",memberBoardList);

		mav.setViewName("memberBoard/list");		
	}
}