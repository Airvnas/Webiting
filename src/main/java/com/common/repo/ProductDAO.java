package com.common.repo;
import java.util.List;

import com.common.domain.ProductDTO;

public interface ProductDAO {

	List<ProductDTO> list();
}
