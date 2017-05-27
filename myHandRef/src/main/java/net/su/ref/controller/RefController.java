package net.su.ref.controller;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import javax.servlet.http.HttpSession;


import net.su.common.Logger;
import net.su.ref.service.RefService;
import net.su.ref.valueObject.MemValueObject;
import net.su.ref.valueObject.RefValueObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RefController {

	@Resource
	private RefService refService;

	// 홈페이지 메인화면
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index() throws Exception{
		Logger.info("초기 화면");
		return "ref/index";
	}
	
	
	// 홈페이지 메인화면
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main() throws Exception{
		Logger.info("메인 화면");
		return "ref/main";
	}
	
	
	// 홈페이지 메인화면 왼쪽 (식품 리스트)
	@RequestMapping(value = "/mainProdctSelectList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String mainProdctSelectList(Model model, HttpSession session, RefValueObject refValueObject) throws Exception{
		Logger.info("메인 왼쪽 - 식품리스트");   
		MemValueObject memVo = (MemValueObject) session.getAttribute("memLoginInfo");
		refValueObject.setMem_seq(memVo.getMem_seq());
		refValueObject.setRefrigerator_seq(memVo.getRefrigerator_seq());
		List<RefValueObject> refList = refService.havRefList(refValueObject);
		model.addAttribute("refList", refList);	
		model.addAttribute("pageSearchInfo", refValueObject);
		return "ref/mainProdctSelectList";
	}
	
	
	// 식품 버림
	@RequestMapping(value = "/prodctDelete.do",  method={RequestMethod.GET, RequestMethod.POST})
	public String prodctDelete(RefValueObject refValueObject) throws Exception{
		Logger.info("식품 버림");
		refService.prodctDelete(refValueObject);
		return "forward:/mainProdctSelectList.do";
	}
	
	// 식품 섭취시  가족 구성원 선택 팝업
	@RequestMapping(value = "/intkPopup.do",  method={RequestMethod.GET, RequestMethod.POST})
	public String intkPopup(Model model, HttpSession session, RefValueObject refValueObject) throws Exception{
		Logger.info("식품 섭취시 가족 구성원 선택 팝업");
		MemValueObject memVo = (MemValueObject)session.getAttribute("memLoginInfo");
		refValueObject.setMem_seq(memVo.getMem_seq());
		List<RefValueObject> fmyMemList = refService.fmyMemSelect(refValueObject);
		
		model.addAttribute("fmyMemList", fmyMemList);	
		model.addAttribute("refValueObject", refValueObject);	
		return "ref/intkPopup";
	}
	
	// 식품 섭취
	@RequestMapping(value = "/prodctIntk.do",  method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void prodctIntk(Model model, HttpSession session, RefValueObject refValueObject) throws Exception{
		Logger.info("식품 섭취");
		refService.prodctIntk(refValueObject);
	}	
	
	// 홈페이지 메인화면 오른쪽 (식품 상세정보)
	@RequestMapping(value = "/mainProdctSelectOne.do", method={RequestMethod.GET, RequestMethod.POST})
	public String mainProdctSelectOne(HttpSession session, Model model, RefValueObject refValueObject) throws Exception{
		Logger.info("메인 오른쪽 - 식품 상세정보");
		MemValueObject memVo = (MemValueObject)session.getAttribute("memLoginInfo");
		refValueObject.setRefrigerator_seq(memVo.getRefrigerator_seq());
		RefValueObject refInfo = refService.mainProdctSelectOne(refValueObject);
		model.addAttribute("refInfo", refInfo);	
		return "ref/mainProdctSelectOne";
	}	
	
	
	// 식품 상세정보 수정
	@RequestMapping(value = "/prodctInfoUpdate.do", method={RequestMethod.GET, RequestMethod.POST})
	public String prodctInfoUpdate(HttpSession session, Model model, RefValueObject refValueObject) throws Exception{
		Logger.info("식품 상세정보 수정");
		refService.prodctInfoUpdate(refValueObject);
		return "forward:/mainProdctSelectOne.do";
	}	

	// 식품 직접 등록
	@RequestMapping(value = "/directProdctInfoInsert.do", method={RequestMethod.GET, RequestMethod.POST})
	public String prodctInfoInsert(HttpSession session, Model model, RefValueObject refValueObject) throws Exception{
		Logger.info("식품 직접 등록");
		MemValueObject memVo = (MemValueObject)session.getAttribute("memLoginInfo");
		refValueObject.setMem_seq(memVo.getMem_seq());
		refValueObject.setRefrigerator_seq(memVo.getRefrigerator_seq());
		refService.directProdctInfoInsert(refValueObject);
		return "forward:/mainProdctSelectOne.do";
	}		
	
	
	
	// 바코드 데이터 존재하는지 확인
	@RequestMapping(value = "/barcdInfoSelect.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public RefValueObject barcdInfoSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("바코드 존재하는지 확인");
		RefValueObject barcdInfo = refService.barcdInfoSelect(refValueObject);		
		return barcdInfo;
	}
	
	
	// 조회된 바코드 데이터 등록
	@RequestMapping(value = "/prodctInsert.do", method={RequestMethod.GET, RequestMethod.POST})
	public String prodctInsert(HttpSession session, RefValueObject refValueObject) throws Exception{
		Logger.info("조회된 바코드 데이터 등록");
		MemValueObject memVo = (MemValueObject)session.getAttribute("memLoginInfo");
		refValueObject.setMem_seq(memVo.getMem_seq());
		refValueObject.setRefrigerator_seq(memVo.getRefrigerator_seq());
		refService.prodctInsert(refValueObject);
		
		return "redirect:/mainProdctSelectList.do";
	}
	
	
	// 홈페이지 냉장고 조회
	@RequestMapping(value = "/refList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String refList(Model model, HttpSession session, RefValueObject refValueObject) throws Exception{
		Logger.info("냉장고 조회"); 
		MemValueObject memVo = (MemValueObject) session.getAttribute("memLoginInfo");
		refValueObject.setMem_seq(memVo.getMem_seq());
		refValueObject.setRefrigerator_seq(memVo.getRefrigerator_seq());
		List<RefValueObject> refList = refService.havRefList(refValueObject);
		model.addAttribute("refList", refList);	
		model.addAttribute("pageSearchInfo", refValueObject);
		return "ref/refList";
	}
	
	
	// 바코드 관리 조회
	@RequestMapping(value = "/barcdList.do", method = RequestMethod.GET)
	public String barcdList(Model model, HttpSession session, RefValueObject refValueObject) throws Exception{
		Logger.info("바코드 관리 조회");
		
		List<RefValueObject> barcdList = refService.barcdListSelect(refValueObject);
		model.addAttribute("barcdList", barcdList);	
		model.addAttribute("pageSearchInfo", refValueObject);
		
		return "ref/barcdList";
	}

	// elements
	@RequestMapping(value = "/elements.do", method = RequestMethod.GET)
	public String elements(Locale locale, Model model) throws Exception{
		Logger.info(null);
		return "ref/elements";
	}
	
	
	
}
