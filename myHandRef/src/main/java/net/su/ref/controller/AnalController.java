package net.su.ref.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;










import net.su.common.Logger;


import net.su.ref.service.AnalService;
import net.su.ref.service.RefService;
import net.su.ref.valueObject.MemValueObject;
import net.su.ref.valueObject.RefValueObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AnalController {

	@Resource
	private AnalService analService;
	@Resource
	private RefService refService;
	
	// 투데이 분석 화면 조회
	@RequestMapping(value = "/todayAnal.do", method = RequestMethod.GET)
	public String todayAnal(HttpSession session, RefValueObject refValueObject, Model model) throws Exception{
		Logger.info("투데이 분석 화면 조회");
		MemValueObject memVo = (MemValueObject)session.getAttribute("memLoginInfo");
		refValueObject.setMem_seq(memVo.getMem_seq());
		refValueObject.setRefrigerator_seq(memVo.getRefrigerator_seq());
		
		RefValueObject recmndInfo = analService.recmndInfoSelect(memVo);
		RefValueObject intkInfo = analService.intkInfoSelect(refValueObject);
		
		List<RefValueObject> fmyMemList = refService.fmyMemSelect(refValueObject);
		
		List<RefValueObject> fmy1to6List = analService.fmy1to6Select(fmyMemList);
		List<RefValueObject> fmy6to12List = analService.fmy6to12Select(fmyMemList);
		List<RefValueObject> fmy12to18List = analService.fmy12to18Select(fmyMemList);
		List<RefValueObject> fmy18to24List = analService.fmy18to24Select(fmyMemList);

		List<RefValueObject> todayIntkList = analService.todayIntkSelect(memVo); // 투데이 섭취 식품 리스트
		List<RefValueObject> recmndIntkList = analService.todayRecmndSelect(memVo); // 권장 섭취 식품 리스트	
		
		model.addAttribute("recmndInfo", recmndInfo);	// 권장 영양성분
		model.addAttribute("intkInfo", intkInfo);	// 섭취 영양성분
		
		model.addAttribute("fmyMemList", fmyMemList); // 가족구성원 리스트
		
		model.addAttribute("fmy1to6List", fmy1to6List); // 1~6시 
		model.addAttribute("fmy6to12List", fmy6to12List); // 6~12시 
		model.addAttribute("fmy12to18List", fmy12to18List); // 12~18시 
		model.addAttribute("fmy18to24List", fmy18to24List); // 18~24시 
		
		model.addAttribute("todayIntkList", todayIntkList);	 // 투데이 섭취 식품 리스트
		model.addAttribute("recmndIntkList", recmndIntkList);	 // 권장 섭취 식품 리스트
		return "anal/todayAnal";
	}
	
	// 영양성분 분석 화면
	@RequestMapping(value = "/nutAnal.do", method = RequestMethod.GET)
	public String nutAnal(HttpSession session, RefValueObject refValueObject, Model model) throws Exception{
		Logger.info("영양성분 분석 화면");	
		MemValueObject memVo = (MemValueObject)session.getAttribute("memLoginInfo");
		refValueObject.setMem_seq(memVo.getMem_seq());
		
		RefValueObject recmndInfo = analService.recmndInfoSelect(memVo);  
		
		RefValueObject intkInfoNutChart = analService.intkInfoNutChartSelect(refValueObject); // 섭취 영양성분 차트 조회
		List<RefValueObject> intkInfoNutList = analService.intkInfoNutListSelect(refValueObject); // 섭취 영양성분 리스트 조회
		
		model.addAttribute("recmndInfo", recmndInfo);	// 권장 영양성분
		model.addAttribute("refValueObject", refValueObject);	// 체크 그룹, 기간 
			
		model.addAttribute("intkInfoNutChart", intkInfoNutChart);	// 섭취 영양성분 차트 조회
		model.addAttribute("intkInfoNutList", intkInfoNutList);	// 섭취 영양성분 리스트
		
		return "anal/nutAnal";
	}
	
	
	// 생활패턴 분석 화면
	@RequestMapping(value = "/patternAnal.do", method = RequestMethod.GET)
	public String patternAnal(HttpSession session, RefValueObject refValueObject, Model model) throws Exception{
		Logger.info("생활패턴 분석 화면");
		MemValueObject memVo = (MemValueObject)session.getAttribute("memLoginInfo");
		refValueObject.setMem_seq(memVo.getMem_seq());
		
		List<RefValueObject> intkInfoPatternList = analService.intkInfoPatternSelect(refValueObject); // 패턴별 섭취 -리스트
		RefValueObject intkInfoPatternChart = analService.intkInfoPatternChartSelect(refValueObject); // 패턴별 섭취 -차트
		
		model.addAttribute("refValueObject", refValueObject); // 기간 
		model.addAttribute("intkInfoPatternList", intkInfoPatternList);			
		model.addAttribute("intkInfoPatternChart", intkInfoPatternChart);	
	
		return "anal/patternAnal";
	}	
	
	// 가족구성원 별 분석
	@RequestMapping(value = "/fmyAnal.do", method = RequestMethod.GET)
	public String fmyAnal(HttpSession session, RefValueObject refValueObject, Model model) throws Exception{
		Logger.info("가족구성원 별 분석");
		MemValueObject memVo = (MemValueObject)session.getAttribute("memLoginInfo");
		refValueObject.setMem_seq(memVo.getMem_seq());
		refValueObject.setRefrigerator_seq(memVo.getRefrigerator_seq());
		model.addAttribute("refValueObject", refValueObject); // 기간 
		
		List<RefValueObject> fmyMemList = refService.fmyMemSelect(refValueObject);
		refValueObject.setFmyGroup(fmyMemList);
		List<HashMap<String, Object>> intkInfoFmyList = analService.intkInfoFmySelect(refValueObject); // 섭취영양정보 -리스트 
		List<HashMap<String, Object>> intkInfoFmyChart = analService.intkInfoFmyChartSelect(refValueObject); // 섭취영양정보 -차트
		
		model.addAttribute("fmyMemList", fmyMemList); // 가족구성원 리스트
		model.addAttribute("intkInfoFmyList", intkInfoFmyList); 
		model.addAttribute("intkInfoFmyChart", intkInfoFmyChart); 
		
		return "anal/fmyAnal";
	}	

	
}
