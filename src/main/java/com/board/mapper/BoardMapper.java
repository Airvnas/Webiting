package com.board.mapper;

import java.util.List;
import java.util.Map;

import com.board.model.BoardVO;
import com.board.model.PagingVO;

public interface BoardMapper {
	
	int insertBoard(BoardVO board);
	// 게시목록 가져오기
	List<BoardVO> selectBoardAll(Map<String,Integer> map);
	List<BoardVO> selectBoardAllPaging(PagingVO paging);
  
	int getTotalCount(PagingVO paging);//검색한 총 게시글 수 가져오기

	// 글번호에 해당하는 글 가져오기
	BoardVO selectBoardByIdx(Integer idx);   
	// 조회수 증가하기
	int updateReadnum(Integer idx);
	   

	int deleteBoard(Integer idx);//게시글 삭제
	int updateBoard(BoardVO board);//게시글 업데이트

	// 답변형(계층형) 게시판에서 답변글 달기
	int rewriteBoard(BoardVO board); //[답변형]
	BoardVO selectRefLevPasswd(int idx);//[답변형]
	
	int updateAdminSunbun(BoardVO board);//공지사항 게시글 순번대로 게시함.
}  