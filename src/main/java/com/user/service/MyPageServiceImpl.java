package com.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.model.PagingVO;
import com.user.mapper.MyPageMapper;
import com.user.model.LikeVO;

@Service("MyPageServiceImpl")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageMapper mMapper;

	@Override
	public List<LikeVO> selectLikeAll(Map<String, Integer> map) {
		return this.mMapper.selectLikeAll(map);
	}

	@Override
	public int getTotalCount(PagingVO paging) {
		return this.mMapper.getTotalCount(paging);
	}

	@Override
	public List<LikeVO> selectLikeAllPaging(PagingVO paging) {
		return this.mMapper.selectLikeAllPaging(paging);
	}

	@Override
	public int deleteLike(LikeVO like) {
		return this.mMapper.deleteLike(like);
	}

}