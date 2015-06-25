package com.quickHobby.apply.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.apply.dto.ApplyDto;
import com.quickHobby.apply.service.ApplyService;

/*
 * @name        : ApplyController
 * @date        : 2015. 6. 22.
 * @author      : ���α�
 * @description : ��û�Խ��� ���� ������ ��û�� �������� �´� service�� ����. 
 */
@Controller
public class ApplyController {
	private Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ApplyService applyService;
	
	/*
	 * @name        : applyWrite
	 * @date        : 2015. 6. 22.
	 * @author      : ���α�
	 * @description : ��û�Խù� �ۼ� ������ ��û�� ApplyService�� applyWrite�� �̵�.
	 */
	@RequestMapping(value="/apply/applyWrite.do", method=RequestMethod.GET)
	public ModelAndView applyWrite(HttpServletRequest request){
		logger.info("applyWrite======");
		
		ModelAndView mav=new ModelAndView();
		
		applyService.applyWrite(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyWriteOk
	 * @date        : 2015. 6. 22.
	 * @author      : ���α�
	 * @description : ��û�Խù� �ۼ� �Ϸ� �� ApplyService�� applyWriteOk�� request�� ApplyDto�� ������ �̵�.
	 */
	@RequestMapping(value="/apply/applyWriteOk.do", method=RequestMethod.POST)
	public ModelAndView applyWriteOk(MultipartHttpServletRequest request, ApplyDto applyDto){
		logger.info("applyWriteOk======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("applyDto", applyDto);
		
		applyService.applyWriteOk(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyList
	 * @date        : 2015. 6. 22.
	 * @author      : ���α�
	 * @description : ��û�Խù� ��� ��û�� ApplyService�� applyList�� �̵�
	 */
	@RequestMapping(value="/apply/applyList.do", method=RequestMethod.GET)
	public ModelAndView applyList(HttpServletRequest request){
		logger.info("applyList======");
		
		ModelAndView mav=new ModelAndView();
		
		applyService.applyList(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyRead
	 * @date        : 2015. 6. 22.
	 * @author      : ���α�
	 * @description : ��û�Խ��ǿ��� �Խù� ���� ���ý� ApplyService�� applyRead�� request�� ������ �̵�.
	 */
	@RequestMapping(value="/apply/applyRead.do", method=RequestMethod.GET)
	public ModelAndView applyRead(HttpServletRequest request){
		logger.info("applyRead======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.applyRead(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyDelete
	 * @date        : 2015. 6. 23.
	 * @author      : ���α�
	 * @description : ��û�Խù����� ���� ���ý� ApplyService�� applyDelete�� request�� ������ �̵�.
	 */
	@RequestMapping(value="apply/applyDelete.do", method=RequestMethod.GET)
	public ModelAndView applyDelete(HttpServletRequest request){
		logger.info("applyDelete======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.applyDelete(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyUpdate
	 * @date        : 2015. 6. 23.
	 * @author      : ���α�
	 * @description : ��û�Խù����� ���� ���ý� ApplyService�� applyUpdate�� request�� ������ �̵�.
	 */
	@RequestMapping(value="apply/applyUpdate.do", method=RequestMethod.GET)
	public ModelAndView applyUpdate(HttpServletRequest request){
		logger.info("applyUpdate======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		applyService.applyUpdate(mav);
		
		return mav;
	}
	
	/*
	 * @name        : applyUpdateOk
	 * @date        : 2015. 6. 23.
	 * @author      : ���α�
	 * @description : ��û�Խù� ���� �Ϸ� �� ApplyService�� applyUpdate�� request�� ApplyDto�� ������ �̵�.
	 */
	@RequestMapping(value="apply/applyUpdateOk.do", method=RequestMethod.POST)
	public ModelAndView applyUpdateOk(MultipartHttpServletRequest request, ApplyDto applyDto){
		logger.info("applyUpdateOk======");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("applyDto", applyDto);
		
		applyService.applyUpdateOk(mav);
		
		return mav;
	}
}
