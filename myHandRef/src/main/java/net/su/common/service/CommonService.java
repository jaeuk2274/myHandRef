package net.su.common.service;

import java.util.Map;

import net.su.ref.valueObject.MemValueObject;

public interface CommonService {
	
	/**
    * (조회) 멤버 로그인 메서드 
    *
    * @param MemValueObject
    * @return  MemValueObject
    * @exception  Exception
    */
	public MemValueObject memLogin(MemValueObject memVo) throws Exception;

}
