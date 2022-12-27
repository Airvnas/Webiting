package com.user.service;

import java.util.List;
import java.util.Map;

import com.board.model.PagingVO;
import com.user.model.LikeprodVO;

public interface MyPageService {
	int getTotalCount(PagingVO paging);
	List<LikeprodVO> selectLikeAll(Map<String, Integer> map); //목록 가져오기
	List<LikeprodVO> selectLikeAllPaging(PagingVO paging);
	
	int deleteLikeProd(Integer pnum);
}
