package com.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.model.PagingVO;
import com.product.mapper.CategoryMapper;
import com.product.mapper.ProductMapper;
import com.product.model.CategoryVO;
import com.product.model.ProductVO;

@Service("padminService")
public class PAdminServiceImpl implements PAdminService {
	
	@Inject
	private CategoryMapper categoryMapper;
	
	@Inject
	private ProductMapper productMapper;

	@Override
	public List<CategoryVO> getUpcategory() {

		return categoryMapper.getUpcategory();
	}

	@Override
	public List<CategoryVO> getDowncategory(String upCg_code) {	
		return this.categoryMapper.getDowncategory(upCg_code);
	}

	@Override
	public int categoryAdd(CategoryVO cvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int categoryDelete(int cg_code) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int productInsert(ProductVO prod) {		
		return this.productMapper.productInsert(prod);
	}

	@Override
	public List<ProductVO> productList() {		
		return this.productMapper.getProducts();
	}
	
	// 상세 페이지 PAdminservice 인터페이스 구현 클래스
	@Override
	public ProductVO detailProduct(int pnum) {
		
		return this.productMapper.detailProduct(pnum);
	}
	
	// 연관 상품 페이지 PAdminservice 인터페이스 구현 클래스
	@Override
	public List<ProductVO> relatedProduct(int pnum) {
		
		return this.productMapper.relatedProduct(pnum);
	}

	@Override
	public List<ProductVO> productListCategory( String downCg_code) {
		return this.productMapper.productListCategory(downCg_code);
	}

	@Override
	public List<ProductVO> selectProductAllPaging(PagingVO paging) {
		return this.productMapper.selectProductAllPaging(paging);
	}

	@Override
	public int getTotalCount(PagingVO page) {
		return this.productMapper.getTotalCount(page);
	}

	@Override
	public int getTotalCountCategory(String downCg_code) {
		
		return this.productMapper.getTotalCountCategory(downCg_code);
	}

}
