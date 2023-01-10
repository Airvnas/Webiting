package com.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.common.CommonExceptionAdvice;
import com.user.mapper.UserMapper;
import com.user.model.NotUserException;
//import com.user.model.PagingVO;
import com.user.model.UserVO;

import lombok.extern.log4j.Log4j;
@Service("UserServiceImpl")
@Log4j
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserMapper uMapper;
	
	@Override
	public int createUser(UserVO user) {
		return this.uMapper.createUser(user);
	}

	@Override
	public boolean idCheck(String userid) {
		Integer n=this.uMapper.idCheck(userid);
		if(n==null) {
			return true;
		}
		return false;
	}

	@Override
	public int deleteUser(Integer midx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(UserVO user) {
		// TODO Auto-generated method stub
		return 0;
	}  

	@Override
	public UserVO getUser(Integer midx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO findUser(UserVO findUser) throws NotUserException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO loginCheck(String userid, String pwd) throws NotUserException {
		
		UserVO vo=this.uMapper.loginCheck(userid);
		if(vo==null)
			throw new NotUserException("해당 회원은 없습니다.");
		//System.out.println("11111111111111"+vo);
		log.info("------------------"+vo);
		String DBuserid=vo.getUserid();
		log.info("------------------"+DBuserid);
		String DBuserpwd=vo.getPwd();
		if(DBuserid!=null||DBuserpwd!=null) {
			if(DBuserid.equals(userid)&&DBuserpwd.equals(pwd)) {
				return vo; 
			}
		}else {
			throw new NotUserException("해당 회원은 없습니다.");
		}
		return null;
	}

	@Override
	public List<UserVO> listUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO emailCheck(String kakaoEmail) {
		UserVO vo=this.uMapper.emailCheck(kakaoEmail);
		String DBemail=vo.getEmail();
		if(DBemail!=null) {
			if(DBemail.equals(kakaoEmail)) {
				return vo; 
			}
		}
		return null;
	}
	/*
	 * @Override public List<UserVO> listUser(PagingVO pvo) { // TODO Auto-generated
	 * method stub return null; }
	 */

}
