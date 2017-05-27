package net.su.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.su.common.Logger;
import net.su.common.dataAccessObject.CommonDataAccessObject;
import net.su.common.security.Base64Utils;
import net.su.ref.valueObject.MemValueObject;

import org.springframework.stereotype.Service;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Resource
	private CommonDataAccessObject commonDAO;
	
	Base64Utils base64 = new Base64Utils(); // Base64Utils 생성
	String encryptKey = "temp11111111111111111111";//key 선언 
	//키값은 무조건 24자리
	//seed + base64 암호화, 복호화
	
	/**
    * (조회) 멤버 로그인 메서드 
    *
    * @param MemValueObject
    * @return  MemValueObject
    * @exception  Exception
    */
	public MemValueObject memLogin(MemValueObject memVo) throws Exception{
		Logger.info("멤버 로그인 메서드 ");
//			//기본 pw
//			String W_ORG_FG = memVo.getMem_pw();
//			//암호화 pw
//			String EN_ORG_FG = base64.encrypt(W_ORG_FG,encryptKey);
//			memVo.setMem_pw(EN_ORG_FG);
		return commonDAO.memLogin(memVo);
	}
	
}
