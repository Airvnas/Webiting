package com.multi.webiting;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.board.model.PagingVO;
import com.product.model.CategoryVO;
import com.product.model.ProductVO;
import com.product.service.PAdminService;
import com.user.model.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
//@RequestMapping("/admin")
@Log4j
public class PAdminController {
	
	@Inject
	@Qualifier(value="padminService")
	private PAdminService adminService;
	
	@GetMapping("/index")
	public String home(HttpSession ses) {
		List<CategoryVO> upCgList=adminService.getUpcategory();
		//upCgList에서 코드만 뽑아 downCgList 저장해 세션에 뿌리기
		ses.setAttribute("upCgList", upCgList);
		//log.info("upCgList=="+upCgList);
		return "/index";
	}
	
	
	@GetMapping("/admin/prodForm")
	public String productForm(Model m) {
		//List<CategoryVO> upCgList=adminService.getUpcategory();
		//log.info("upCgList=="+upCgList);
		//m.addAttribute("upCgList", upCgList);
		
		return "/admin/prodForm";
	}
	//ajax占쏙옙청占쏙옙 占쏙옙占쏙옙 json占쏙옙占쏙옙 占쏙옙占썰데占쏙옙占싶몌옙 占쏙옙占쏙옙占쏙옙
	@GetMapping(value="/admin/getDownCategory", produces = "application/json")
	@ResponseBody
	public List<CategoryVO> getDownCategory(@RequestParam("upCg_code") String upCg_code){
		//log.info("upCg_code==="+upCg_code);
		List<CategoryVO> downCgList=adminService.getDowncategory(upCg_code);
		//log.info("ssssss"+downCgList.size());
		return downCgList;
	}
	@GetMapping(value="/getDownCategoryHome", produces = "application/json")
	@ResponseBody
	public List<CategoryVO> getDownCategoryHome(@RequestParam("upCg_code") String upCg_code){
		//log.info("upCg_code==="+upCg_code);
		List<CategoryVO> downCgList=adminService.getDowncategory(upCg_code);
		//log.info("ssssss"+downCgList.size());
		return downCgList;
	}
	
	@PostMapping("/admin/prodInsert")
	public String productRegister(Model m,
			@RequestParam("pimage")List<MultipartFile> pimage,
			@ModelAttribute("product") ProductVO product, //pimage1,pimage2,pimage3
			HttpServletRequest req) {		
		//log.info("product===="+product+">>>>");
		//
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/product_images");
		//log.info("upDir==="+upDir);
		
		File dir=new File(upDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		if(pimage!=null) {
			for(int i=0;i<pimage.size();i++) {
				MultipartFile mfile=pimage.get(i);
				if(!mfile.isEmpty()) {
					try {
						mfile.transferTo(new File(upDir,mfile.getOriginalFilename()));
						
						if(i==0) {
							product.setPimage1(mfile.getOriginalFilename());
						}else if(i==1) {
							product.setPimage2(mfile.getOriginalFilename());
						}else if(i==2) {
							product.setPimage3(mfile.getOriginalFilename());
						}
						 
					} catch (IOException e) {						
						log.error("占쏙옙占쏙옙 占쏙옙占싸듸옙 占쏙옙占쏙옙: "+e);
					}
					
				}
			}//for---------------
			//log.info("占쏙옙占싸듸옙 占쏙옙占쏙옙 product==="+product);
		}
		int n=adminService.productInsert(product);
		String str=(n>0)?"상품등록 성공":"상품등록 실패";
		String loc=(n>0)?"../prodList":"javascript:history.back()";
		
		m.addAttribute("message",str);
		m.addAttribute("loc",loc);
		return "msg";
	}//------------------------------------------
	
	/*@GetMapping("/admin/prodList")
	public String productList(Model m) {
		
		List<ProductVO> prodArr=adminService.productList();
		m.addAttribute("prodArr",prodArr);
		
		return "admin/prodList";
	}*/
	@GetMapping("/prodList")
	public String productListPaging(Model m, @ModelAttribute("page") PagingVO page,
			HttpServletRequest req, @RequestHeader("User-Agent") String userAgent) {
		String myctx=req.getContextPath();
		
		HttpSession ses=req.getSession();
		
		log.info("1. page===="+page);
		int totalCount=this.adminService.getTotalCount(page);
		page.setTotalCount(totalCount);
		log.info(totalCount);
		page.setPagingBlock(5);
		page.init(ses);
		
		log.info("2. page===="+page);
		List<ProductVO> prodArr=this.adminService.selectProductAllPaging(page);
		String loc="../prodList";
		String pageNavi=page.getPageNavi(myctx, loc, userAgent);
		//log.info("prodArr:"+prodArr);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("paging", page);
		m.addAttribute("prodArr", prodArr);
		return "admin/prodList";
		
	}
	@GetMapping("/prodListCategory")
	public String productListCategory(Model m,
			@RequestParam("downCg_code") String downCg_code) {
		
		List<ProductVO> prodArr2=adminService.productListCategory(downCg_code);
		m.addAttribute("prodArr2",prodArr2);
		log.info(prodArr2);
		//m.addAttribute("upCg")
		
		
		return "prodList/prodListCategory";
	}
}

