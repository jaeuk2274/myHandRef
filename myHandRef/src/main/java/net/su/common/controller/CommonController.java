package net.su.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.common.Logger;
import net.su.common.service.CommonService;


import net.su.ref.valueObject.MemValueObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommonController {
	
	@Resource
	private CommonService commonService;
	
	// 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) throws Exception {
		Logger.info(null);
		// 로그인하기 귀찮아서 자동 로그인 처리  나중에 지우기
		MemValueObject memVo = new MemValueObject();
		memVo.setMem_id("jw2274");
		memVo.setMem_pw("1234");
		MemValueObject loginInfo = commonService.memLogin(memVo);
		System.out.println(loginInfo);
		if(loginInfo != null) {
			session.setAttribute("memLoginInfo", loginInfo);
		}
		// 나중에 지우기
		return "redirect:/index.do";  // Ref컨트롤러
	}
	
	// 사이드 메뉴
	@RequestMapping(value = "/menu.do", method = RequestMethod.GET)
	public String menu(Model model, HttpSession session) throws Exception{
		Logger.info("사이드 메뉴");
		MemValueObject memVo = (MemValueObject) session.getAttribute("memLoginInfo");
		model.addAttribute("memLoginInfo", memVo);
		return "common/menu";
	}
	
	// 회원 로그인
	@RequestMapping(value = "/memLogin.do")
	@ResponseBody
	public MemValueObject memLogin(Model model, HttpSession session, MemValueObject memVo) throws Exception{
		Logger.info("회원 로그인");
		System.out.println("id : " + memVo.getMem_id() + " / pw : " + memVo.getMem_pw());
		MemValueObject loginInfo = commonService.memLogin(memVo);
		
		if(loginInfo != null) {
			session.setAttribute("memLoginInfo", loginInfo);
		}
		else {
			
		}
		return loginInfo;
	}
	
	// 회원 로그아웃
	@RequestMapping(value = "/memLogout.do")
	public String memLogout(HttpSession session) throws Exception{
		Logger.info("회원 로그아웃");
		session.invalidate();
		return "redirect:/";
	}
	
}