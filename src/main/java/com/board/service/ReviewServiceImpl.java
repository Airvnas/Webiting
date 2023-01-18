package com.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.mapper.ReviewMapper;
/*import com.board.model.BoardVO;*/
import com.board.model.ReviewVO;
/*import com.common.repo.ReviewDAO;*/

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Inject
	private ReviewMapper reviewMapper;
	
	public List<ReviewVO> getReviewList(int pnum){
		
		return reviewMapper.getReviewList(pnum);
	}

	@Override
	public int insertReview(ReviewVO review) {
		// TODO Auto-generated method stub
		return reviewMapper.insertReview(review);
	}

	@Override
	public List<ReviewVO> selectReviewAll(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalRCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int revnum) {
		
		return reviewMapper.deleteReview(revnum);
	}

	@Override
	public int editReview(int revnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewVO> editReview() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReviewVO> DeleteReview(int revnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int editReview(ReviewVO review) {
		// TODO Auto-generated method stub
		return this.reviewMapper.editReview(review);
	}

	@Override
	public int deleteReview(Integer revnum) {
		// TODO Auto-generated method stub
		return this.reviewMapper.deleteReview(revnum);
	}


	@Override
	public ReviewVO selectReviewByRevNum(int revnum) {
		// TODO Auto-generated method stub
		/* System.out.println("revnum=="+revnum); */
		return this.reviewMapper.selectReviewByRevNum(revnum);
	}
}
