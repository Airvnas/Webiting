package com.user.mapper;

import java.util.List;
import java.util.Map;

//import com.user.model.PagingVO;
import com.user.model.UserVO;
public interface AdminMapper {

	int deleteUser(Integer midx);
	
	//List<UserVO> listUser(PagingVO pvo);
	
	List<UserVO> selectBoardAll(Map<String, Integer> map);
	
	int updateUser(UserVO user);

	UserVO selectUserByIdx(int idx);
	
	int getTotalCount();//�� �Խñ� �� �������� 
	
	//List<UserVO> selectUserAll(PagingVO paging);
}
