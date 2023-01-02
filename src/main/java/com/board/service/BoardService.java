package com.board.service;

import java.util.List;
import java.util.Map;

import com.board.model.BoardVO;
import com.board.model.PagingVO;

public interface BoardService {
	
	int insertBoard(BoardVO board);
	// �Խø�� ��������
	List<BoardVO> selectBoardAll(Map<String,Integer> map);
	List<BoardVO> selectBoardAllPaging(PagingVO paging);
  
	int getTotalCount(PagingVO paging);//�˻��� �� �Խñ� �� ��������

	// �۹�ȣ�� �ش��ϴ� �� ��������
	BoardVO selectBoardByIdx(Integer idx);   
	// ��ȸ�� �����ϱ�
	int updateReadnum(Integer idx);
	   

	int deleteBoard(Integer idx);
	int updateBoard(BoardVO board);

	// �亯��(������) �Խ��ǿ��� �亯�� �ޱ�
	int rewriteBoard(BoardVO board); //[�亯��]
	BoardVO selectRefLevPasswd(int idx);//[�亯��]
	
	int updateAdminSunbun(BoardVO board);
}