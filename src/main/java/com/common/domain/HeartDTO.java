package com.common.domain;

/*import java.util.HashMap;
import java.util.Map;*/

/*import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;*/

import lombok.Data;

/*@Repository
@Service*/
@Data
public class HeartDTO {

	// pk값으로 쓸 번호
	private long h_number;
	// 게시글 번호
	private long e_number;
	// 회원 번호
	private long m_number;
	// 좋아요
	private int heart;
}

	 
