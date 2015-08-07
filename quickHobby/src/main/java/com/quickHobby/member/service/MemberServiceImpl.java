package com.quickHobby.member.service;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Logger;

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

/**
* @name : MemberServiceImpl
* @date : 2015. 6. 25.
* @author : 이명진
* @description : 클라이언트의 요청에 따른 실질적인 작업을 수행하는 클래스
 */
@Component
public class MemberServiceImpl implements MemberService{
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	@Autowired
	private MemberDao memberDao;
	
	/**
	* @name : registerOk
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 회원가입 시 넘어온 데이터들을 처리하고 DAO로 넘겨주는 메소드
	 */
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
				String dir="C:\\Users\\KOSTA\\git\\QuickHobby\\quickHobby\\src\\main\\webapp\\img\\memberImage";
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
	
	/**
	* @name : sendCode
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 회원가입 시 이메일 인증에 사용할 인증 코드를 생성하고 sendMail메소드로 넘겨주는 메소드
	 */
	public void sendCode(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		
		HttpServletRequest req=(HttpServletRequest)map.get("request");
		String email=req.getParameter("email");
		
		String serverEmail=memberDao.checkEmail(email);
		
		if(serverEmail==null){
			Random random=new Random();
			random.setSeed(new Date().getTime());

			int randomCode=random.nextInt(89999)+10000;
			
			String code=String.valueOf(randomCode);
			mav.addObject("serverCode", code);
			
			sendMail(email, code);
		}else{
			mav.addObject("serverCode", -1);
		}
		

		mav.setViewName("member/sendCode");
	}
	
	
	/**
	* @name : sendMail
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 인증코드를 사용자의 이메일로 발송하는 메소드, Gmail을 이용해 메일 발송함.
	 */
	public void sendMail(String email, String code){
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

	/**
	* @name : loginOk
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 로그인 요청시 넘어오는 아이디, 비밀번호가 일치하는지 확인하기 위해 DAO로 데이터 전송하는 메소드
	 */
	public void loginOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest req=(HttpServletRequest)map.get("request");
		
		String email=req.getParameter("userId");
		String password=req.getParameter("userPassword");
		
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("email", email);
		hMap.put("password", password);
		
		MemberDto member=memberDao.loginOk(hMap);
		
		if(member != null){
			req.getSession().setAttribute("member", member);
			memberDao.checkJoin(member.getMemberNum());
		}
		
		mav.setViewName("member/loginOk");
	}

	/**
	* @name : update
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 회원정보수정 페이지 요청 시 프로필사진을 출력하기 위해 DAO로 부터 사진파일경로 받아 온 후 정보수정페이지 응답하는 메소드
	 */
	public void update(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest req=(HttpServletRequest)map.get("request");
		
		MemberDto member=(MemberDto)req.getSession().getAttribute("member");
		
		String filePath=memberDao.getFile(member.getMemberNum());
		String[] temp=null;
		String fileName=null;
		
		if(filePath!=null){
			temp=filePath.split("\\\\");
			fileName=filePath.split("\\\\")[temp.length-1];
		}else{
			fileName="default.PNG";
			filePath="C:\\Users\\KOSTA\\git\\QuickHobby\\quickHobby\\src\\main\\webapp\\img\\memberImage\\default.PNG";
		}
		mav.addObject("fileName", fileName);
		mav.setViewName("member/update");
	}
	
	/**
	* @name : updateOk
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 회원정보수정 완료 후 DAO로 넘어온 데이터들을 전송하는 메소드
	 */
	public void updateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest req=(MultipartHttpServletRequest)map.get("request");
		MemberDto member=(MemberDto)map.get("member");
		
		MultipartFile userPhoto=req.getFile("memberFile");
		String fileName=userPhoto.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis()) + "_" + fileName;
		long fileSize=userPhoto.getSize();

		if(fileSize != 0){
			String deleteFilePath=memberDao.getFile(member.getMemberNum());
			
			if(deleteFilePath != null){
				File deleteFile=new File(deleteFilePath);
				deleteFile.delete();
			}
			try{
				String dir="C:\\Users\\KOSTA\\git\\QuickHobby\\quickHobby\\src\\main\\webapp\\img\\memberImage";
				File file=new File(dir, timeName);
				userPhoto.transferTo(file);
				
				member.setMemberFileName(fileName);
				member.setMemberFilePath(file.getAbsolutePath());
				member.setMemberFileSize(Long.toString(fileSize));				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		int check=memberDao.updateOk(member);
		if(check>0){
			int memberNum=Integer.parseInt(req.getParameter("memberNum"));
			MemberDto updatedMember=memberDao.getMember(memberNum);
			System.out.println("변경된 파일명:" + updatedMember.getMemberFileName());
			req.getSession().invalidate();
			req.getSession().setAttribute("member", updatedMember);
		}
		mav.addObject("check", check);
		
		mav.setViewName("member/updateOk");
	}

	/**
	* @name : checkNickname
	* @date : 2015. 6. 26.
	* @author : 이명진
	* @description : 회원가입 시 닉네임 중복 체크를 위한 메소드
	 */
	public void checkNickname(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		
		HttpServletRequest req=(HttpServletRequest)map.get("request");
		String nickname=req.getParameter("nickname");
		String serverNickname=memberDao.checkNickname(nickname);

		if(nickname.equals(serverNickname)){
			mav.addObject("serverNickname", serverNickname);
		}else{
			mav.addObject("serverNickname", null);
		}
		
		mav.setViewName("member/register");
	}
	
	/**
	* @name : sendCodeFindPass
	* @date : 2015. 6. 26.
	* @author : 이명진
	* @description : 비밀번호찾기를 위해 메일 인증 코드를 발송하는 메소드
	 */
	public void sendCodeFindPass(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		
		HttpServletRequest req=(HttpServletRequest)map.get("request");
		String email=req.getParameter("email");
		
		String serverEmail=memberDao.checkEmail(email);
		
		if(serverEmail!=null){
			Random random=new Random();
			random.setSeed(new Date().getTime());

			int randomCode=random.nextInt(89999)+10000;
			
			String code=String.valueOf(randomCode);
			mav.addObject("serverCode", code);
			
			sendMail(email, code);
		}else{
			mav.addObject("serverCode", -1);
		}
		

		mav.setViewName("member/sendCodeFindPass");
	}

	/**
	* @name : findPassword
	* @date : 2015. 6. 25.
	* @author : 이명진
	* @description : 비밀번호찾기에서 인증번호가 일치하면 비밀번호의 앞 4자리만 표시함
	 */
	public void findPassword(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		
		HttpServletRequest req=(HttpServletRequest)map.get("request");
		String email=req.getParameter("memberId");
		
		String password=memberDao.findPassword(email);
		String clientPassword="";
		
		for(int i=0; i<password.length(); i++){
			if(i<4){
				clientPassword+=password.charAt(i);
			}else{
				clientPassword+="*";
			}
		}
		
		mav.addObject("password", clientPassword);
		mav.setViewName("member/findPasswordOk");
	}
}
