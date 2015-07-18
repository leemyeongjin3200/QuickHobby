package com.quickHobby.memberBoard.dao;

import java.util.HashMap;
import java.util.List;

import com.quickHobby.board.dto.BoardDto;
import com.quickHobby.member.dto.MemberDto;
import com.quickHobby.memberBoard.dto.MemberBoardDto;



/**
*@name : JesusDao
 *@date:2015. 7. 2.
*@author:염상아
*@description: service에서 넘겨준 getSumlist의 함수를 선언해준다.
 */
public interface MemberBoardDao {
	
	public MemberBoardDto list(int board_writer);
	public MemberBoardDto list1(int groupboard_writer);
	public int getBoardCount();
	public List<MemberBoardDto>getBoardList(int board_writer);
	public int getGroupCount();
	public List<MemberBoardDto>getGroupList(int groupboard_writer);
	
	//public List<MemberBoardDto>getSumlist(String board_writer,String groupboard_writer);
    public int getNum(String memberNickName);
    
    public MemberDto getNumm(String memberNickName);
    
    public List<BoardDto>getSumlist(int memberNum);
    
    public List<BoardDto>getNextList(HashMap<String, String> map);
    
    
	//public MemberBoardDto selectOk(int member_num);


}
