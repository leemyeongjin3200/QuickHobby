package com.quickHobby.apply.service;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.quickHobby.weather.Weather;
import com.quickHobby.weather.WeatherDTO;

/*
 * @name        : ApplyServiceImpl
 * @date        : 2015. 6. 22.
 * @author      : ���α�
 * @description : ��û ���� ���������� �ʿ�� �ϴ� �����͸� DAO�� ���� �������ų� �ʿ��� ���񽺸� ����.
 */
@Component
public class ApplyServiceImpl implements ApplyService {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ApplyDao applyDao;
	
	/*
	 * @name        : applyWrite
	 * @date        : 2015. 6. 22.
	 * @author      : ���α�
	 * @description : ������ �̵�.
	 */
	public void applyWrite(ModelAndView mav){
		logger.info("applyWrite service======");
		
		mav.setViewName("apply/applyWrite");
	}
	
	/*
	 * @name        : applyWriteOk
	 * @date        : 2015. 6. 22.
	 * @author      : ���α�
	 * @description : ��û�Խù��� Apply ���̺� ����.
	 */
	public void applyWriteOk(ModelAndView mav){
		logger.info("applyWriteOk service======");
		
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest) map.get("request");
		ApplyDto applyDto=(ApplyDto) map.get("applyDto");
		
		applyDto.setApply_createdate(new Date());
		applyDto.setApply_modifydate(applyDto.getApply_createdate());
		applyDto.setApply_recommend(0);
		applyDto.setApply_readcount(0);
		
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
				String dir="C:\\Users\\KOSTA_07_008\\Desktop\\PJT\\workspace\\test folder";
				
				logger.info("dir : " + dir);
				
				File file=new File(dir, timeName);
				upFile.transferTo(file);		
				
				applyDto.setApply_filepath(file.getAbsolutePath());
				applyDto.setApply_filename(fileName);
				applyDto.setApply_filesize(String.valueOf(fileSize));
			}catch(Exception e){
				logger.info("File IO Error!");
			}
		}
		
		int check=0;
		if(applyDto.getApply_filename() != null){
			check=applyDao.insertFile(applyDto);
		}else{
			check=applyDao.insert(applyDto);
		}
		logger.info("check : " + check);
		
		mav.addObject("check", check);
		mav.setViewName("apply/applyWriteOk");
	}
	
	/*
	 * @name        : applyList
	 * @date        : 2015. 6. 22.
	 * @author      : ���α�
	 * @description : ��û�Խù��� ����� �ֱٿ� ������ ������ ������.
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
	 * @author      : ���α�
	 * @description : �ش� ��ȣ�� ApplyDto�� ������.
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
		
		mav.addObject("weather", weather);
		mav.addObject("applyDto", applyDto);
		mav.setViewName("apply/applyRead");
	}
	
	/*
	 * @name        : applyDelete
	 * @date        : 2015. 6. 23.
	 * @author      : ���α�
	 * @description : �ش� ��ȣ�� ��û�Խù��� Apply ���̺��� ����.
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
	 * @author      : ���α�
	 * @description : �ش� ��ȣ�� ApplyDto�� ������.
	 */
	public void applyUpdate(ModelAndView mav){
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int apply_num=Integer.parseInt(request.getParameter("apply_num"));
		
		ApplyDto applyDto=applyDao.getApplyDto(apply_num);

		mav.addObject("applyDto", applyDto);
		mav.setViewName("apply/applyUpdate");
	}
	
	/*
	 * @name        : applyUpdateOk
	 * @date        : 2015. 6. 23.
	 * @author      : ���α�
	 * @description : ������ ��û�Խù��� Apply ���̺��� ����.
	 */
	public void applyUpdateOk(ModelAndView mav){
		logger.info("applyUpdateOk service======");
		
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest) map.get("request");
		ApplyDto applyDto=(ApplyDto) map.get("applyDto");
		
		applyDto.setApply_modifydate(new Date());
		
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
				String dir="C:\\Users\\Seo IG\\Desktop\\PJT\\test folder";
				
				logger.info("dir : " + dir);
				
				File file=new File(dir, timeName);
				upFile.transferTo(file);		
				
				applyDto.setApply_filepath(file.getAbsolutePath());
				applyDto.setApply_filename(fileName);
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
		logger.info("check : " + check);
		
		mav.addObject("check", check);
		mav.setViewName("apply/applyUpdateOk");
	}
}
