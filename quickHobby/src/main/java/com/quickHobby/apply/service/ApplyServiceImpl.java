package com.quickHobby.apply.service;

import java.io.File;
import java.util.Date;
import java.util.Map;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.apply.dao.ApplyDao;
import com.quickHobby.apply.dto.ApplyDto;

@Component
public class ApplyServiceImpl implements ApplyService {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ApplyDao applyDao;
	
	public void applyWrite(ModelAndView mav){
		logger.info("applyWrite service======");
		
		mav.addObject("name", "1");
		
		mav.setViewName("apply/applyWrite");
	}
	
	public void applyWriteOk(ModelAndView mav){
		logger.info("applyWriteOk service======");
		
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest) map.get("request");
		ApplyDto applyDto=(ApplyDto) map.get("applyDto");
		
		applyDto.setApply_createdate(new Date());
		applyDto.setApply_modifydate(applyDto.getApply_createdate());
		
		MultipartFile upFile=request.getFile("apply_file");
		String fileName=upFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis()) + "_" + fileName;
		long fileSize=upFile.getSize();
		
		logger.info("file : " + fileName);
		logger.info("timeName : " + timeName);
		logger.info("size : " + fileSize);
		
		if(fileSize!=0){
			try{
				String dir=request.getSession().getServletContext().getRealPath("/resources");
				
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
	}
}
