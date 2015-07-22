package com.quickHobby.board.service;

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

import com.quickHobby.board.dao.BoardDao;
import com.quickHobby.board.dto.BoardDto;
import com.quickHobby.boardReply.dao.BoardReplyDao;
import com.quickHobby.boardReply.dto.BoardReplyDto;


/**
* @name : BoardServiceImpl
* @date : 2015. 6. 22.
* @author : 차건강
* @description : Tip & Review Board 로직 부분
 */

@Component
public class BoardServiceImpl implements BoardService {
	private final Logger logger=Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private BoardReplyDao boardReplyDao;
	
	/**
	* @name : boardList
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board List 불러오기
	 */
	@Override
	public void boardList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		BoardDto boardDto=(BoardDto)map.get("boardDto");
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null)pageNumber="1";
		
		int boardSize=9;
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=boardDao.getBoardCount();
		
		
		List<BoardDto> boardList=new ArrayList<BoardDto>();
		
		if(count>0){
			boardList=boardDao.getBoardList(startRow, endRow);
		}
		
		int boardListSize=boardList.size();
		logger.info("boardListSize:"+boardListSize);
		
		// reply count 추가
		for(int i=0;i<boardListSize;i++){
			int boardNum=boardList.get(i).getBoardNum();
			int boardReplyCount=boardReplyDao.getBoardReplyCount(boardNum);
			
			boardList.get(i).setBoardReplyCount(boardReplyCount);
			logger.info("boardDtogetBoardReplyCount:"+boardReplyCount);
			logger.info("memberNickName:"+boardList.get(i).getMemberNickName());
		}
		
		mav.addObject("boardList", boardList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("board", boardDto);
		mav.setViewName("board/list");
	}

	/**
	* @name : boardWriteForm
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 글쓰기 페이지로
	 */
	@Override
	public void boardWriteForm(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		
		logger.info("boardNum:"+boardNum);
		
		mav.addObject("boardNum", boardNum);
		mav.setViewName("board/writeForm");
	}

	/**
	* @name : boardWrite
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 글쓰기 버튼 누른 후
	 */
	@Override
	public void boardWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest req=(MultipartHttpServletRequest)map.get("request");
		BoardDto boardDto=(BoardDto)map.get("BoardDto");
		
		int boardWriter=Integer.parseInt(req.getParameter("boardWriter"));
		String boardSection=req.getParameter("boardSection");
		logger.info("boardSection:"+boardSection);
		
		boardDto.setBoardWriter(boardWriter);
		boardDto.setBoardReadCount(0);
		boardDto.setBoardRecommand(0);
		boardDto.setBoardVisible(1);
		boardDto.setBoardSection(boardSection);
		
		MultipartFile upFile=req.getFile("board_file");
		String fileName=upFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis()) + "_" + fileName;
		long fileSize=upFile.getSize();
		
		logger.info("file : " + fileName);
		logger.info("timeName : " + timeName);
		logger.info("size : " + fileSize);
		
		
		int check=0;
		if(fileSize!=0){
			try{

				String dir="C:\\Users\\KOSTA\\git\\QuickHobby\\quickHobby\\src\\main\\webapp\\img\\boardImage";

				logger.info("dir : " + dir);
				
				File file=new File(dir, timeName);
				upFile.transferTo(file);		
				
				boardDto.setBoardFilePath(file.getAbsolutePath());
				boardDto.setBoardFileName(timeName);
				boardDto.setBoardFileSize(String.valueOf(fileSize));
				
				check=boardDao.boardWriteFile(boardDto);
				logger.info("check:"+check);
			}catch(Exception e){
				e.printStackTrace();
				logger.info("File IO Error!");
			}
		}else{
			check=boardDao.boardWrite(boardDto);
			logger.info("check:"+check);
		}
		
		mav.addObject("check", check);
		mav.setViewName("board/writeOk");
	}

	/**
	* @name : boardRead
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 글 제목 눌렀을 때
	 */
	@Override
	public void boardRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		logger.info("boardNum:"+boardNum);
		logger.info("pageNumber:"+pageNumber);
		
//		boardReply와 연결
		BoardDto boardDto=boardDao.boardRead(boardNum);
		boardDto.setBoardReplyList(boardReplyDao.getBoardReplyList(boardNum));
		
		List<BoardReplyDto> boardReplyList=boardDto.getBoardReplyList();
		for(int i=0; i<boardReplyList.size(); i++){
			String filePath=boardReplyList.get(i).getMemberFilePath();
			String fileName=null;
			if(filePath!=null){
				fileName=filePath.split("\\\\")[11];
			}else{
				fileName="default.PNG";
				filePath="C:\\Users\\KOSTA\\git\\QuickHobby\\quickHobby\\src\\main\\webapp\\img\\memberImage\\default.PNG";
			}
			
			boardReplyList.get(i).setMemberFileName(fileName);
		}
		boardDto.setBoardReplyCount(boardReplyDao.getBoardReplyCount(boardNum));
		
		logger.info("memberNickName:"+boardDto.getMemberNickName());
		
		mav.addObject("board", boardDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/read");
	}

	/**
	* @name : boardDelete
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 글의 visible 값 0으로 바꿔서 화면상에서 delete
	 */
	@Override
	public void boardDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		int check=boardDao.boardDelete(boardNum);
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("boardNum", boardNum);
		mav.setViewName("board/deleteOk");
	}

	/**
	* @name : boardUpdateForm
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board updateForm 불러오기
	 */
	@Override
	public void boardUpdateForm(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		BoardDto boardDto=boardDao.boardRead(boardNum);
		
		mav.addObject("boardNum", boardNum);
		mav.addObject("board", boardDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/updateForm");
	}

	/**
	* @name : boardUpdate
	* @date : 2015. 6. 23.
	* @author : 차건강
	* @description : Tip & Review Board 수정한 내용 db에 저장
	 */
	@Override
	public void boardUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		BoardDto boardDto=(BoardDto)map.get("BoardDto");

		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		MultipartFile boardFile=request.getFile("board_file");
		String fileName=boardFile.getOriginalFilename();
		String timeName=Long.toString(System.currentTimeMillis()) + "_" + fileName;
		long fileSize=boardFile.getSize();
		
		if(fileSize != 0){
			String deleteFilePath=boardDao.getFile(boardNum);
			
			if(deleteFilePath != null){
				File deleteFile=new File(deleteFilePath);
				deleteFile.delete();
			}
			try{
				String dir="C:\\Users\\KOSTA\\git\\QuickHobby\\quickHobby\\src\\main\\webapp\\img\\boardImage";
				File file=new File(dir, timeName);
				boardFile.transferTo(file);
				logger.info("dir:"+dir);
				
				boardDto.setBoardFileName(timeName);
				boardDto.setBoardFilePath(file.getAbsolutePath());
				boardDto.setBoardFileSize(String.valueOf(fileSize));				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		int check=0;
		if(fileSize!=0){
			check=boardDao.boardUpdateFile(boardDto);
			logger.info("check1:"+check);
		}else{
			check=boardDao.boardUpdate(boardDto);
			logger.info("check2:"+check);
		}

		mav.addObject("boardNum", boardNum);
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/updateOk");
	}
}
