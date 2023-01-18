package com.product.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.common.domain.ProductDTO;
import com.common.repo.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{

	@Inject
	private ProductDAO productDAO;
	
	@Override
	public List<ProductDTO> list() {
		return productDAO.list();
	}
	
}
