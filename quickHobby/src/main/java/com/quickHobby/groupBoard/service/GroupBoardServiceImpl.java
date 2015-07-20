package com.quickHobby.groupBoard.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.group.dao.GroupDao;
import com.quickHobby.group.dto.GroupDto;
import com.quickHobby.groupBoard.dao.GroupBoardDao;
import com.quickHobby.groupBoard.dto.GroupBoardDto;
import com.quickHobby.groupReply.dao.GroupReplyDao;
import com.quickHobby.member.dao.MemberDao;
import com.quickHobby.member.dto.MemberDto;
import com.quickHobby.weather.Weather;
import com.quickHobby.weather.WeatherDTO;

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
	
	@Autowired
	private GroupDao groupDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private GroupReplyDao groupReplyDao;
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
		
		int groupNum=0;
		
		if(request.getParameter("groupNum")!=null){
			groupNum=Integer.parseInt(request.getParameter("groupNum"));
		}
		
		logger.info("groupNum:"+groupNum);
		
		mav.addObject("groupNum", groupNum);
		
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
		MultipartHttpServletRequest req=(MultipartHttpServletRequest) map.get("request");
		GroupBoardDto groupBoardDto=(GroupBoardDto)map.get("groupBoardDto");
		int groupNum=groupBoardDto.getGroupBoardGroupNum();
		
		MultipartFile userFile=req.getFile("file");
		String fileName=userFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis()) + "_" + fileName;
		long fileSize=userFile.getSize();
		
		if(fileSize != 0){
			try{
				String dir="C:\\Users\\KOSTA\\git\\QuickHobby\\quickHobby\\src\\main\\webapp\\pds";
				File file=new File(dir, timeName);
				userFile.transferTo(file);
				
				groupBoardDto.setGroupBoardFileName(timeName);
				groupBoardDto.setGroupBoardFilePath(file.getAbsolutePath());
				groupBoardDto.setGroupBoardFileSize(fileSize);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		groupBoardDto.setGroupBoardReadCount(0);
		
		int check=groupBoardDao.groupBoardWrite(groupBoardDto);
		logger.info("check:"+check);
		
		mav.addObject("check", check);
		mav.addObject("groupNum", groupNum);
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
		
//		groupBoardReply와 연결중
		GroupBoardDto groupBoardDto=groupBoardDao.groupBoardRead(groupBoardNum);
		groupBoardDto.setGroupReplyList(groupReplyDao.getGroupReplyList(groupBoardNum));
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
	/**
	* @name : groupPage
	* @date : 2015. 6. 25.
	* @author : 차건강
	* @description : Group Board List 불러오기
	 */
	public void groupPage(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int groupNum=Integer.parseInt(request.getParameter("groupNum"));
		logger.info("groupNum:" + groupNum);
		
		GroupDto group=groupDao.getGroupDto(groupNum);
		
		int count=groupBoardDao.getGroupBoardCount(groupNum);
		
		List<GroupBoardDto> groupBoardList=new ArrayList<GroupBoardDto>();
		
		if(count>0){
			groupBoardList=groupBoardDao.getGroupBoardList(groupNum);
			for(int i=0; i<groupBoardList.size(); i++){
				int groupBoardNum=groupBoardList.get(i).getGroupBoardNum();
				int groupReplyCount=groupReplyDao.getGroupReplyCount(groupBoardNum);
				groupBoardList.get(i).setGroupReplyCount(groupReplyCount);
			}
		}
		
		List<MemberDto> member=memberDao.getMemberList(groupNum);
		
		logger.info("date:"+group.getGroupDate());
		logger.info("location:"+group.getGroupLocation());
		
		
		Weather w=new Weather(group.getGroupLocation(), group.getGroupDate());
		WeatherDTO weather=w.getWeather();
		
		for(int i=0; i<member.size(); i++){
			String filePath=member.get(i).getMemberFilePath();
			if(filePath!=null){
				String fileName=filePath.split("\\\\")[10];
				member.get(i).setMemberFileName(fileName);
			}
		}
	
		mav.addObject("memberList", member);
		mav.addObject("group", group);
		mav.addObject("groupBoardList", groupBoardList);
		mav.addObject("weather", weather);
		mav.addObject("count", count);
		mav.setViewName("groupBoard/groupPage");
	}
}
