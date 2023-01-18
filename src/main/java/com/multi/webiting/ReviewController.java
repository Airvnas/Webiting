package com.multi.webiting;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.board.model.ReviewVO;
import com.board.service.ReviewService;
import com.common.CommonUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ReviewController {

	@Inject
	private CommonUtil util;

	@Inject
	private ReviewService reviewService;

	@GetMapping("/reviewForm")
	public String reviewList(Model m, @RequestParam("pnum") int pnum) {// 별점 파트

		// 상품 번호 pnum_fk '1'번의 모든 리뷰에 리스트를 불러오기
		List<ReviewVO> reviewArr = reviewService.getReviewList(pnum);
		double starSize = reviewArr.size(); 
		double star5 = 0;
		double star4 = 0;
		double star3 = 0;
		double star2 = 0;
		double star1 = 0;

		// int 소수점 밑에 값을 무시 double 값을 줘야 평균값을 구할 수 있다

		for (int i = 0; i < reviewArr.size(); i++) {
			if (reviewArr.get(i).getStar() == 5) {
				star5++;
			} else if (reviewArr.get(i).getStar() == 4) {
				star4++;
			} else if (reviewArr.get(i).getStar() == 3) {
				star3++;
			} else if (reviewArr.get(i).getStar() == 2) {
				star2++;
			} else if (reviewArr.get(i).getStar() == 1) {
				star1++;
			}
		}
		double rstar5 = star5 / reviewArr.size() * 100;
		double rstar4 = star4 / reviewArr.size() * 100;
		double rstar3 = star3 / reviewArr.size() * 100;
		double rstar2 = star2 / reviewArr.size() * 100;
		double rstar1 = star1 / reviewArr.size() * 100;

		List<Long> starList = new ArrayList<>();
		// get(0)
		starList.add(Math.round(rstar1));
		// get(1)
		starList.add(Math.round(rstar2));
		// get(2)
		starList.add(Math.round(rstar3));
		// get(3)
		starList.add(Math.round(rstar4));
		// get(4)
		starList.add(Math.round(rstar5));
		// 별점 1점 ~ 5점 퍼센트값을 모두 구한 후 List하나 생성 후 view 반환
		m.addAttribute("starList", starList);
		m.addAttribute("reviewList", reviewArr);
		
		return "review/reviewForm";
	}

	 //글 수정 폼
	  @GetMapping("/review/{revnum}") //?revnum=7  ==>@RequestParam   /review/7 ==>	@PathVariable  
	  public String boardView(@PathVariable("revnum") int revnum, Model m) { 
		  	ReviewVO review = this.reviewService.selectReviewByRevNum(revnum);
		  	/* log.info("review==="+review); */
		  	m.addAttribute("review",review);
	  
	  	return "review/reviewView";
	  
	  }
	 
	
	  	// 게시판 해당 글삭제
		@GetMapping("/reviewForm/delete")
		public String deleteReview(Model m, @RequestParam(defaultValue="0") int revnum,
				@RequestParam(defaultValue="0") int pnum) {
			if(revnum==0||pnum==0) {
				return util.addMsgBack(m, "잘못 된 경로입니다");
			}
			
			ReviewVO rvo = reviewService.selectReviewByRevNum(revnum); 
			if(rvo == null) {
				return util.addMsgBack(m, "해당글은 존재하지 않습니다");
			}
			
			int n = reviewService.deleteReview(revnum);
			String str=(n>0)?"삭제 완료":"삭제 실패";
			String loc=(n>0)?"prodDetail?pnum="+pnum:"javascript:history.back()";
			
			return util.addMsgLoc(m, str, loc);
		}
		
	  @GetMapping("/reviewForm/write")
		public String reviewdWrite(Model m, @ModelAttribute("review") ReviewVO review) { 
			
		  	m.addAttribute("pnum",review.getPnum_fk());
		  	if(review.getMode()!=null&&review.getMode().equals("edit")) {
		  		ReviewVO rvo = reviewService.selectReviewByRevNum(review.getRevnum()); 
				if(rvo == null) {
					return util.addMsgBack(m, "해당글은 존재하지 않습니다");
				}
				m.addAttribute("review", rvo);
		  		return "review/reviewEdit";
		  	}else {
			
		  		return "review/reviewWrite";
		  	}
		}
	  
	  @PostMapping("/reviewForm/write")
	  public String reviewInsert(@RequestParam("mfilename") MultipartFile mfilename, 
			  HttpServletRequest req, Model m, @ModelAttribute 
		ReviewVO review) throws Exception{
	  ServletContext app=req.getServletContext();
	  
		String upDir=app.getRealPath("/resources/review_upload");
		File dir=new File(upDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		if(!mfilename.isEmpty()) {
			mfilename.transferTo(new File(upDir, mfilename.getOriginalFilename()));
		}
	  review.setFilename(mfilename.getOriginalFilename());
	  int n=0; String str="", loc="";
	  if("write".equals(review.getMode())) {
		  
	  n=this.reviewService.insertReview(review);
	  	str+="글쓰기 ";
	  	
	  }else if("edit".equals(review.getMode())) {

	  n=this.reviewService.editReview(review);
	  	str+="글수정 ";
	  }
	  
	  	str+=(n>0)?"성공":"실패";
	  loc=(n>0)?"../admin/prodDetail?pnum="+review.getPnum_fk():"javascript:history.back()";
	  
	  return util.addMsgLoc(m, str, loc); 
	  
	  }
}