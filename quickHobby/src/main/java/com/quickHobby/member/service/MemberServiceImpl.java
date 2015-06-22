package com.quickHobby.member.service;

import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;

import com.quickHobby.member.dao.MemberDao;

@Component
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;
	
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
}
