package com.quickHobby.member.service;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.member.dao.MemberDao;
import com.quickHobby.member.dto.MemberDto;

@Component
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;
	
	public void registerOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		
		MultipartHttpServletRequest req=(MultipartHttpServletRequest)map.get("request");
		MemberDto memberDto=(MemberDto)map.get("memberDto");
		
		memberDto.setMemberLevel("User");
		memberDto.setMemberReport(0);
		
		MultipartFile userPhoto=req.getFile("memberFile");
		String fileName=userPhoto.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis()) + "_" + fileName;
		long fileSize=userPhoto.getSize();
		
		if(fileSize != 0){
			try{
				String dir="C:\\Users\\KOSTA\\git\\QuickHobby\\quickHobby\\src\\main\\webapp\\pds";
				
				File file=new File(dir, timeName);
				userPhoto.transferTo(file);
				
				memberDto.setMemberFileName(fileName);
				memberDto.setMemberFilePath(file.getAbsolutePath());
				memberDto.setMemberFileSize(Long.toString(fileSize));
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		int check=memberDao.registerOk(memberDto);
		
		mav.addObject("check", check);
		mav.setViewName("member/registerOk");
	} 
	
	public void sendCode(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		
		HttpServletRequest req=(HttpServletRequest)map.get("request");
		String email=req.getParameter("email");
		
		Random random=new Random();
		random.setSeed(new Date().getTime());

		int randomCode=random.nextInt(89999)+10000;
		
		String code=String.valueOf(randomCode);
		
		sendMail(email, code);
		
		mav.addObject("serverCode", code);
		mav.setViewName("member/sendCode");
	}
	
	public void sendMail(String email, String code){
		//property에 서버키, 값 입력
		Properties pro=new Properties();
		pro.put("mail.smtp.starttls.enable", "true");
		pro.put("mail.smtp.host", "smtp.gmail.com");
		pro.put("mail.smtp.auth", "true");
		pro.put("mail.smtp.port", "587");
		
		//구글 계정인증
		Authenticator auth=new Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication("project.quickhobby@gmail.com", "32003200a");
			}
		};
		
		//서버와 보낼 아이디 인증
		Session session=Session.getDefaultInstance(pro, auth);
		
		//메세지
		MimeMessage message=new MimeMessage(session);
		
		try{
			//받는사람
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email.trim()));
			
			//보내는 사람
			message.setFrom(new InternetAddress("project.quickhobby@gmail.com"));
			//제목
			message.setSubject("QuickHobby 인증메일 입니다");
			
			//본문
			message.setText("인증번호는 " + code + "입니다.");
			
			//발송
			Transport.send(message);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void loginOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest req=(HttpServletRequest)map.get("request");
		
		String email=req.getParameter("memberEmail");
		String password=req.getParameter("memberPassword");
		
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("email", email);
		hMap.put("password", password);
		
		MemberDto member=memberDao.loginOk(hMap);
		
		if(member != null){
			req.getSession().setAttribute("member", member);
		}
		
		mav.setViewName("member/loginOk");
	}
}
