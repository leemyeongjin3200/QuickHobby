package com.quickHobby.apply.service;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.apply.dao.ApplyDao;
import com.quickHobby.apply.dto.ApplyDto;
import com.quickHobby.group.dao.GroupDao;
import com.quickHobby.member.dto.MemberDto;
import com.quickHobby.weather.Weather;
import com.quickHobby.weather.WeatherDTO;

/*
 * @name        : ApplyServiceImpl
 * @date        : 2015. 6. 22.
 * @author      : 서인구
 * @description : 신청 게시물과 관련된 서비스를 수행하는 클래스
 */
@Component
public class ApplyServiceImpl implements ApplyService {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ApplyDao applyDao;

	@Autowired
	private GroupDao groupDao;
	
	/*
	 * @name        : applyWrite
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 신청 게시물 작성 페이지로 작성자의 이름을 가지고 이동
	 */
	public void applyWrite(ModelAndView mav){
		logger.info("applyWrite service======");
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		MemberDto member=(MemberDto)request.getSession().getAttribute("member");
		int groupHost=member.getMemberNum();

		logger.info("groupHost:"+groupHost);
		
		mav.addObject("groupHost", groupHost);
		mav.setViewName("apply/applyWrite");
	}
	
	/*
	 * @name        : applyWriteOk
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 신청 게시물 작성 결과를 가지고 이동
	 */
	public void applyWriteOk(ModelAndView mav){
		logger.info("applyWriteOk service======");
		
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest) map.get("request");
		ApplyDto applyDto=(ApplyDto) map.get("applyDto");
		int cost=Integer.parseInt(request.getParameter("groupCost"));
		
		applyDto.setApply_createdate(new Date());
		applyDto.setApply_modifydate(applyDto.getApply_createdate());
		applyDto.setApply_recommend(0);
		applyDto.setApply_readcount(0);
		applyDto.setApply_cost(cost);
		
		Date closeDate=null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		try{
			closeDate=(Date) sdf.parse(request.getParameter("apply_date"));
//			logger.info(closeDate.toString());
			applyDto.setApply_closedate(closeDate);
		}catch(ParseException e){
			e.printStackTrace();
		}
		
		MultipartFile upFile=request.getFile("apply_file");
		String fileName=upFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis()) + "_" + fileName;
		long fileSize=upFile.getSize();
		
		logger.info("file : " + fileName);
		logger.info("timeName : " + timeName);
		logger.info("size : " + fileSize);
		
		if(fileSize!=0){
			try{
				String dir="C:\\Users\\KOSTA\\git\\QuickHobby\\quickHobby\\src\\main\\webapp\\groupImage";
				
				logger.info("dir : " + dir);
				
				File file=new File(dir, timeName);
				upFile.transferTo(file);		
				
				applyDto.setApply_filepath(file.getAbsolutePath());
				applyDto.setApply_filename(timeName);
				applyDto.setApply_filesize(String.valueOf(fileSize));
			}catch(Exception e){
				logger.info("File IO Error!");
			}
		}
		
		int check=0;
		if(applyDto.getApply_filename() != null){
			check=applyDao.insertFile(applyDto);
			groupDao.createGroupFile(applyDto);
		}else{
			check=applyDao.insert(applyDto);
			groupDao.createGroup(applyDto);
		}
		
		logger.info("check : " + check);
		
		mav.addObject("check", check);
		mav.setViewName("apply/applyWriteOk");
	}
	
	/*
	 * @name        : applyList
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 신청 게시물들의 리스트를 시간순서로 정렬하여 이동
	 */
	public void applyList(ModelAndView mav){
		logger.info("applyList======");
		
		List<ApplyDto> applyDtoList=applyDao.getListByCreateDate();
		logger.info("list size : " + applyDtoList.size());
		
		mav.addObject("applyDtoList", applyDtoList);
		mav.setViewName("apply/applyList");
	}
	
	/*
	 * @name        : applyRead
	 * @date        : 2015. 6. 22.
	 * @author      : 서인구
	 * @description : 헤당 번호의 게시물 DTO와 날씨 정보를 가지고 이동
	 */
	public void applyRead(ModelAndView mav){
		logger.info("applyRead======");
		
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int apply_num=Integer.parseInt(request.getParameter("apply_num"));
//		logger.info("apply_num : " + apply_num);

		applyDao.incrementReadcount(apply_num);
		ApplyDto applyDto=applyDao.getApplyDto(apply_num);
		logger.info("apply_num : " + apply_num);
		
		Weather w=new Weather(applyDto.getApply_location(), applyDto.getApply_closedate());
		WeatherDTO weather=w.getWeather();
		
		int joins=applyDao.getJoins(apply_num);
		int recommends=applyDao.getRecommends(apply_num);
		MemberDto host=applyDao.getHost(apply_num);
		
		mav.addObject("joins", joins);
		mav.addObject("recommends", recommends);
		mav.addObject("host", host);
		mav.addObject("weather", weather);
		mav.addObject("applyDto", applyDto);
		mav.setViewName("apply/applyRead");
	}
	
	/*
	 * @name        : applyDelete
	 * @date        : 2015. 6. 23.
	 * @author      : 서인구
	 * @description : 해당 번호의 신청 게시물의 삭제 결과를 가지고 이동
	 */
	public void applyDelete(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int apply_num=Integer.parseInt(request.getParameter("apply_num"));
		
		int check=applyDao.delete(apply_num);
		logger.info("check : " + check);
		
		mav.addObject("check", check);
		mav.addObject("apply_num", apply_num);
		mav.setViewName("apply/applyDelete");
	}
	
	/*
	 * @name        : applyUpdate
	 * @date        : 2015. 6. 23.
	 * @author      : 서인구
	 * @description : 해당 번호의 신청게시물 DTO를 가지고 이동
	 */
	public void applyUpdate(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int apply_num=Integer.parseInt(request.getParameter("apply_num"));
		
		ApplyDto applyDto=applyDao.getApplyDto(apply_num);

		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		mav.addObject("applyDto", applyDto);
		mav.addObject("date", sdf.format(applyDto.getApply_closedate()));
		mav.setViewName("apply/applyUpdate");
	}
	
	/*
	 * @name        : applyUpdateOk
	 * @date        : 2015. 6. 23.
	 * @author      : 서인구
	 * @description : 해당 번호의 신청 게시물 수정 결과를 가지고 이동
	 */
	public void applyUpdateOk(ModelAndView mav){
		logger.info("applyUpdateOk service======");
		
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest) map.get("request");
		ApplyDto applyDto=(ApplyDto) map.get("applyDto");
		int cost=Integer.parseInt(request.getParameter("groupCost"));
		
		applyDto.setApply_modifydate(new Date());
		applyDto.setApply_cost(cost);
		
		Date closeDate=null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		try{
			closeDate=(Date) sdf.parse(request.getParameter("apply_date"));
//			logger.info(closeDate.toString());
			applyDto.setApply_closedate(closeDate);
		}catch(ParseException e){
			e.printStackTrace();
		}
		
		MultipartFile upFile=request.getFile("apply_file");
		String fileName=upFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis()) + "_" + fileName;
		long fileSize=upFile.getSize();
		
		logger.info("file : " + fileName);
		logger.info("timeName : " + timeName);
		logger.info("size : " + fileSize);
		
		if(fileSize!=0){
			try{
				String dir="C:\\Users\\KOSTA\\git\\QuickHobby\\quickHobby\\src\\main\\webapp\\groupImage";
				
				logger.info("dir : " + dir);
				
				File file=new File(dir, timeName);
				upFile.transferTo(file);		
				
				applyDto.setApply_filepath(file.getAbsolutePath());
				applyDto.setApply_filename(timeName);
				applyDto.setApply_filesize(String.valueOf(fileSize));
			}catch(Exception e){
				logger.info("File IO Error!");
			}
		}
		
		int check=0;
		if(applyDto.getApply_filename() != null){
			check=applyDao.updateFile(applyDto);
		}else{
			check=applyDao.update(applyDto);
		}
		
		groupDao.updateGroup(applyDto);
		
		logger.info("check : " + check);
		
		mav.addObject("check", check);
		mav.setViewName("apply/applyUpdateOk");
	}
	
	public void applyOk(ModelAndView mav){
		logger.info("applyOk service======");
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int apply_num=Integer.parseInt(request.getParameter("apply_num"));
		
		MemberDto member=(MemberDto) request.getSession().getAttribute("member");
		HashMap<String, Integer> groupMap=new HashMap<String, Integer>();
		groupMap.put("apply_num", apply_num);
		groupMap.put("member_num", member.getMemberNum());
		
		int check=groupDao.joinMember(groupMap);
		
		mav.addObject("check", check);
		
		mav.setViewName("");
	}
	
	public void main(ModelAndView mav){
		logger.info("main======");
		
		List<ApplyDto> applyDtoList=applyDao.getListByCreateDate();
		logger.info("list size : " + applyDtoList.size());
		
		mav.addObject("applyDtoList", applyDtoList);
		mav.setViewName("forward:main_hyeran.jsp");
	}
}
