package com.quickHobby.apply.service;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.quickHobby.report.dto.ReportDto;
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
	@Autowired
	private ApplyDao applyDao;

	@Autowired
	private GroupDao groupDao;

	/*
	 * @name : applyWrite
	 * @date : 2015. 6. 22.
	 * @author : 서인구
	 * @description : 신청 게시물 작성 페이지로 작성자의 이름을 가지고 이동
	 */
	public void applyWrite(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MemberDto member = (MemberDto) request.getSession().getAttribute(
				"member");
		int groupHost = member.getMemberNum();
		int memberGroups = applyDao.memberGroups(groupHost);

		if (memberGroups < 8) {
			mav.addObject("groupHost", groupHost);
			mav.addObject("error", 0);
			mav.setViewName("apply/applyWrite");
		} else {
			List<ApplyDto> applyDtoList = applyDao.getListByCreateDate();

			mav.addObject("applyDtoList", applyDtoList);
			mav.setViewName("apply/applyList");
			mav.addObject("error", 1);
			mav.setViewName("apply/applyList");
		}

	}

	/*
	 * @name : applyWriteOk
	 * @date : 2015. 6. 22.
	 * @author : 서인구 
	 * @description : 신청 게시물 작성 결과를 가지고 이동
	 */
	public void applyWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map
				.get("request");
		ApplyDto applyDto = (ApplyDto) map.get("applyDto");

		String groupCost = request.getParameter("groupCost");

		if (groupCost.equals(null) || groupCost.equals("")) {
			applyDto.setApply_cost(0);
		} else {
			int cost = Integer.parseInt(request.getParameter("groupCost"));
			applyDto.setApply_cost(cost);
		}

		applyDto.setApply_createdate(new Date());
		applyDto.setApply_modifydate(applyDto.getApply_createdate());
		applyDto.setApply_recommend(0);
		applyDto.setApply_readcount(0);

		Date closeDate = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			closeDate = (Date) sdf.parse(request.getParameter("apply_date"));
			applyDto.setApply_closedate(closeDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		MultipartFile upFile = request.getFile("apply_file");
		String fileName = upFile.getOriginalFilename();
		String timeName = Long.toString(System.currentTimeMillis()) + "_"
				+ fileName;
		long fileSize = upFile.getSize();

		if (fileSize != 0) {
			try {
				String dir = "C:\\Users\\KOSTA\\git\\QuickHobby\\quickHobby\\src\\main\\webapp\\img\\groupImage";

				File file = new File(dir, timeName);
				upFile.transferTo(file);

				applyDto.setApply_filepath(file.getAbsolutePath());
				applyDto.setApply_filename(timeName);
				applyDto.setApply_filesize(String.valueOf(fileSize));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		int check = 0;

		if (applyDto.getApply_filename() != null) {
			check = applyDao.insertFile(applyDto);
			if (check != 0) {
				groupDao.createGroupFile(applyDto);
				int groupNum = groupDao.getGroupNumber();
				int applyHost = applyDto.getApply_host();
				HashMap<String, Integer> hMap = new HashMap<String, Integer>();
				hMap.put("groupNum", groupNum);
				hMap.put("applyHost", applyHost);
				groupDao.hostJoin(hMap);
			}
		} else {
			check = applyDao.insert(applyDto);
			if (check != 0) {
				groupDao.createGroup(applyDto);
				int groupNum = groupDao.getGroupNumber();
				int applyHost = applyDto.getApply_host();
				HashMap<String, Integer> hMap = new HashMap<String, Integer>();
				hMap.put("groupNum", groupNum);
				hMap.put("applyHost", applyHost);
				groupDao.hostJoin(hMap);
			}
		}

		mav.addObject("check", check);
		mav.setViewName("apply/applyWriteOk");
	}

	/*
	 * @name : applyList
	 * @date : 2015. 6. 22.
	 * @author : 서인구
	 * @description : 신청 게시물들의 리스트를 시간순서로 정렬하여 이동
	 */
	public void applyList(ModelAndView mav) {
		List<ApplyDto> applyDtoList = applyDao.getListByCreateDate();

		mav.addObject("applyDtoList", applyDtoList);
		mav.setViewName("apply/applyList");
	}

	/*
	 * @name : applyRead
	 * @date : 2015. 6. 22.
	 * @author : 서인구
	 * @description : 헤당 번호의 게시물 DTO와 날씨 정보를 가지고 이동
	 */
	public void applyRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int apply_num = Integer.parseInt(request.getParameter("apply_num"));
		
		MemberDto member = (MemberDto) request.getSession().getAttribute("member");
		int memberNum = member.getMemberNum();

		HashMap<String, Integer> memberMap = new HashMap<String, Integer>();
		memberMap.put("memberNum", memberNum);
		memberMap.put("apply_num", apply_num);
		int memberRecommend = applyDao.memberRecommend(memberMap);

		int memberGroups = applyDao.memberGroups(memberNum);

		applyDao.incrementReadcount(apply_num);
		ApplyDto applyDto = applyDao.getApplyDto(apply_num);

		Weather w = new Weather(applyDto.getApply_location(),
				applyDto.getApply_closedate());
		WeatherDTO weather = w.getWeather();

		int joins = applyDao.getJoins(apply_num);
		int recommends = applyDao.getRecommends(apply_num);
		MemberDto host = applyDao.getHost(apply_num);
		String filePath = host.getMemberFilePath();

		String[] temp=null;
		String fileName = null;
		if (filePath != null) {
			temp=filePath.split("\\\\");
			fileName = filePath.split("\\\\")[temp.length-1];
		}
		host.setMemberFileName(fileName);

		int isJoin = applyDao.isJoinGroup(memberMap);

		int reports = applyDao.getReports(apply_num);

		mav.addObject("reports", reports);
		mav.addObject("isJoin", isJoin);
		mav.addObject("memberGroups", memberGroups);
		mav.addObject("memberRecommend", memberRecommend);
		mav.addObject("joins", joins);
		mav.addObject("recommends", recommends);
		mav.addObject("host", host);
		mav.addObject("weather", weather);
		mav.addObject("applyDto", applyDto);
		mav.setViewName("apply/applyRead");
	}

	/*
	 * @name : applyDelete
	 * @date : 2015. 6. 23.
	 * @author : 서인구
	 * @description : 해당 번호의 신청 게시물의 삭제 결과를 가지고 이동
	 */
	public void applyDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int apply_num = Integer.parseInt(request.getParameter("apply_num"));
		
		int groupNum=groupDao.getDeleteGroupNum(apply_num);
		groupDao.deleteGroup(groupNum);
		groupDao.deleteJoin(groupNum);
		int check = applyDao.delete(apply_num);
		
		mav.addObject("check", check);
		mav.addObject("apply_num", apply_num);
		mav.setViewName("apply/applyDelete");
	}

	/*
	 * @name : applyOk
	 * @date : 2015. 6. 26.
	 * @author : 서인구
	 * @description : 해당 그룹번호와 회원의 번호를 join테이블에 저장, 신청완료 후 applyList로 이동
	 */
	public void applyOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int apply_num = Integer.parseInt(request.getParameter("apply_num"));

		MemberDto member = (MemberDto) request.getSession().getAttribute(
				"member");
		HashMap<String, Integer> groupMap = new HashMap<String, Integer>();
		groupMap.put("apply_num", apply_num);
		groupMap.put("member_num", member.getMemberNum());

		int check = groupDao.joinMember(groupMap);

		mav.addObject("check", check);
		List<ApplyDto> applyDtoList = applyDao.getListByCreateDate();

		mav.addObject("applyDtoList", applyDtoList);
		mav.setViewName("apply/applyList");
	}

	/*
	 * @name : main
	 * @date : 2015. 6. 26. 
	 * @author : 서인구
	 * @description : 메인화면 로딩시 apply테이블에서 applyList가져옴
	 */
	public void main(ModelAndView mav) {
		List<ApplyDto> applyDtoList = applyDao.getListByCreateDate();

		mav.addObject("applyDtoList", applyDtoList);
		mav.setViewName("forward:main_hyeran.jsp");
	}

	/*
	 * @name : incrementRecommend
	 * 
	 * @date : 2015. 6. 28.
	 * 
	 * @author : 서인구
	 * 
	 * @description : 좋아요를 누르면 recommend테이블에 회원번호와 게시물번호를 추가하고 apply테이블의 해당 게시물 좋아요수 1증가
	 */
	public void incrementRecommend(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		MemberDto member = (MemberDto) request.getSession().getAttribute(
				"member");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String recommend_type = request.getParameter("recommend_type");

		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("board_num", board_num);
		hMap.put("memberNum", member.getMemberNum());
		hMap.put("recommend_type", recommend_type);

		int firstCheck = applyDao.addRecommend(hMap);
		int secondCheck = 0;

		if (firstCheck > 0 && recommend_type.equals("A")) {
			secondCheck = applyDao.incrementRecommend(board_num);
		}
		System.out.println("secondCheck : " + secondCheck);
	}

	/*
	 * @name : decrementRecommend
	 * 
	 * @date : 2015. 6. 28.
	 * 
	 * @author : 서인구
	 * 
	 * @description : 이미 자신이 좋아요를 누른 게시물에 다시 좋아요버튼을 누르면 recommend테이블에서 해당회원번호와 게시물번호 삭제하고 apply테이블에서 해당 게시물 좋아요 수 1감소
	 */
	public void decrementRecommend(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		MemberDto member = (MemberDto) request.getSession().getAttribute(
				"member");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String recommend_type = request.getParameter("recommend_type");
		// System.out.println(recommend_type);

		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("board_num", board_num);
		hMap.put("memberNum", member.getMemberNum());
		hMap.put("recommend_type", recommend_type);

		int firstCheck = applyDao.removeRecommend(hMap);

		if (firstCheck > 0 && recommend_type.equals("A")) {
			applyDao.decrementRecommend(board_num);
		}
	}

	/*
	 * @name : report
	 * @date : 2015. 6. 29.
	 * @author : 서인구
	 * @description : 게시물의 신고내용 작성후 신고버튼 누르면 report테이블에 해당 내용, 글번호, 회원번호 추가
	 */
	public void report(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int report_sender = Integer.parseInt(request
				.getParameter("report_sender"));
		int report_receiver = Integer.parseInt(request
				.getParameter("report_receiver"));
		String report_content = request.getParameter("report_content");
		int report_boardnum = Integer.parseInt(request
				.getParameter("report_boardnum"));
		String report_boardtype = request.getParameter("report_boardtype");

		ReportDto reportDto = new ReportDto();
		reportDto.setReport_sender(report_sender);
		reportDto.setReport_receiver(report_receiver);
		reportDto.setReport_content(report_content);
		reportDto.setReport_boardnum(report_boardnum);
		reportDto.setReport_boardtype(report_boardtype);

		applyDao.insertReport(reportDto);
		
		mav.setViewName("apply/read");
	}
}
