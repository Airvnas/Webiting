package com.common.repo;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.common.domain.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Inject
	private SqlSession sqlSession;
	private final String NS = "kr.co.product";

	@Override
	public List<ProductDTO> list() {	
		return sqlSession.selectList(NS+".list");
	}
}