package com.common.repo;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;

import com.board.model.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	
	@Inject
	private SqlSession sql;
	
	private static String nameSpace = "com.board.mappers.reviewMapper";
	
	public List<ReviewVO> list(){
		return sql.selectList(nameSpace+".list");
	}
}