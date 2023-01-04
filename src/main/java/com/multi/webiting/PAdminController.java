package com.multi.webiting;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.board.model.PagingVO;
import com.product.model.CategoryVO;
import com.product.model.ProductVO;
import com.product.service.PAdminService;

import lombok.extern.log4j.Log4j;

@Controller
//@RequestMapping("/admin")
@Log4j
public class PAdminController {

	@Inject
	@Qualifier(value = "padminService")
	private PAdminService adminService;

	@GetMapping("/index")
	public String home(HttpSession ses) {
		List<CategoryVO> upCgList=adminService.getUpcategory();
		
		ses.setAttribute("upCgList", upCgList);
		//log.info("upCgList=="+upCgList);
		return "/index";
	}
	
	
	@GetMapping("/admin/prodForm")
	public String productForm(Model m) {
		List<CategoryVO> upCgList = adminService.getUpcategory();
		log.info("upCgList==" + upCgList);
		m.addAttribute("upCgList", upCgList);

		return "/admin/prodForm";
	}

	// 상세 페이지 컨트롤러
	@GetMapping("/prodDetail")
	public String deteil(Model m, @RequestParam("pnum") int pnum) { 
		m.addAttribute("pcontents", adminService.detailProduct(pnum));

		return "/admin/prodDetail";

	}
	

	// 상세 -> 연관 페이지 컨트롤러	
	  @GetMapping("/prodRelated") 
	  public String related(Model m2, @RequestParam("pnum") int pnum) {
		  List<ProductVO> obj=adminService.relatedProduct(pnum);
		  m2.addAttribute("prelated",obj);
	  
	  return "/admin/prodRelated";
	  
	 	}
	 
	
	// ajax요청에 대해 json으로 응답데이터를 보낸다
	@GetMapping(value = "/getDownCategory", produces = "application/json")
	@ResponseBody
	public List<CategoryVO> getDownCategory(@RequestParam("upCg_code") String upCg_code){
		//log.info("upCg_code==="+upCg_code);
		List<CategoryVO> downCgList=adminService.getDowncategory(upCg_code);

		//log.info("ssssss"+downCgList.size());
		return downCgList;
	}
	@GetMapping(value="/test/getDownCategoryHome", produces = "application/json")
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

		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/resources/product_images");
		log.info("upDir==="+upDir);
		
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
						} else if (i == 1) {
							product.setPimage2(mfile.getOriginalFilename());
						} else if (i == 2) {
							product.setPimage3(mfile.getOriginalFilename());
						}	 
					} catch (IOException e) {						
						log.error("파일 업로드 에러: "+e);
					}
				}
			}//for---------------
			;
		}
		int n=adminService.productInsert(product);
		String str=(n>0)?"상품등록 성공":"상품등록 실패";
		String loc=(n>0)?"prodList":"javascript:history.back()";
		
		m.addAttribute("message",str);
		m.addAttribute("loc",loc);
		return "msg";
	}//------------------------------------------
	
	@GetMapping(value="/prodListForm")
	
	public String productListPaging(Model m, @ModelAttribute("page") PagingVO page,
			HttpServletRequest req, @RequestHeader("User-Agent") String userAgent,
			@RequestParam(value="downCg_code", required=false) String downCg_code,
			@RequestParam(value="downCg_name", required=false) String downCg_name
			) {
		String myctx=req.getContextPath();
		
		HttpSession ses=req.getSession();
		log.info("1. page===="+page);
		int totalCount=0;
		List<ProductVO> prodArr=null;
		log.info("2. page===="+page);
		if(downCg_code==null) {
			totalCount=this.adminService.getTotalCount(page);
			page.setTotalCount(totalCount);
			page.setPagingBlock(5);
			page.init(ses);
			prodArr=this.adminService.selectProductAllPaging(page);
		}else {
			totalCount=this.adminService.getTotalCountCategory(downCg_code);
			page.setTotalCount(totalCount);
			page.setPagingBlock(5);
			page.init(ses);
			prodArr=adminService.productListCategory(downCg_code);
			m.addAttribute("downCg_name",downCg_name);
			//log.info("downCg_name===="+downCg_name);
		}
		String loc="prodList";
		String pageNavi=page.getPageNavi(myctx, loc, userAgent);
		//log.info("prodArr:"+prodArr);
		if(page.getFindKeyword()!=null) {
			m.addAttribute("keyword", page.getFindKeyword());
		}
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("paging", page);
		m.addAttribute("prodArr", prodArr);
		return "prodList/prodListForm";
		
	}
	
	@GetMapping(value="/prodListForm/{sortType}")
	@ResponseBody
	public ModelMap prodListSortBySel( @ModelAttribute("page") PagingVO page,
			HttpServletRequest req, @RequestHeader("User-Agent") String userAgent,
			@RequestParam(value="downCg_code", required=false) String downCg_code,
			@RequestParam(value="downCg_name", required=false) String downCg_name,
			@PathVariable(name="sortType", required=false) Integer sortType
			) {
		//log.info(sortType);
		
		String myctx=req.getContextPath();
		ModelMap map=new ModelMap();
		HttpSession ses=req.getSession();
		int totalCount=0;
		List<ProductVO> prodArr=null;
		
		if(downCg_code==null) {
			totalCount=this.adminService.getTotalCount(page);
			page.setTotalCount(totalCount);
			page.setPagingBlock(5);
			page.init(ses);
			page.setSortType(sortType);
			prodArr=this.adminService.selectProductAllPaging(page);
		}else {
			totalCount=this.adminService.getTotalCountCategory(downCg_code);
			page.setTotalCount(totalCount);
			page.setPagingBlock(5);
			page.init(ses);
			page.setSortType(sortType);
			prodArr=adminService.productListCategory(downCg_code);
			map.addAttribute("downCg_name",downCg_name);
			//log.info("downCg_name===="+downCg_name);
		}
		String loc="prodList";
		log.info("sortType1==="+sortType);
		String pageNavi=page.getPageNavi(myctx, loc, userAgent);
		log.info("sortType2==="+sortType);
		//log.info("prodArr:"+prodArr);
		if(page.getFindKeyword()!=null) {
			map.addAttribute("keyword", page.getFindKeyword());
		}
		log.info("pageNavi===="+pageNavi);
		/*
		 * for (ProductVO pArr : prodArr) { System.out.println(pArr.getPrice()); }
		 */
		map.addAttribute("pageNavi", pageNavi);
		map.addAttribute("paging", page);
		map.addAttribute("prodArr", prodArr);
		return map;
		
	}
	@GetMapping("/prodList")
	public String productListCategory(Model m,
			@RequestParam(value="downCg_code", required=false) String downCg_code
			) {
		
		//List<ProductVO> prodArr2=adminService.productListCategory(downCg_code);
		//m.addAttribute("prodArr2",prodArr2);
		//log.info(prodArr2);
		//m.addAttribute("upCg")
		
		return "admin/prodList";
	}

}
