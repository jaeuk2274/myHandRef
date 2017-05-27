package net.su.ref.service;


import java.util.HashMap;
import java.util.List;

import net.su.common.Logger;
import net.su.ref.valueObject.MemValueObject;
import net.su.ref.valueObject.RefValueObject;

public interface AnalService {
	
	/**
    * 권장 영양성분 조회
    *
    * @param MemValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject recmndInfoSelect(MemValueObject memValueObject) throws Exception;
	
	
	/**
    * 섭취 영양성분 조회
    *
    * @param RefValueObject refValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject intkInfoSelect(RefValueObject refValueObject) throws Exception;
			
	
	/**
    * 권장 섭취 식품 조회 (투데이)
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> todayRecmndSelect(MemValueObject memValueObject) throws Exception;
	
	
	/**
    * 투데이 섭취 식품 조회
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> todayIntkSelect(MemValueObject memValueObject) throws Exception;
	
	
	/**
    * 가족구성원별 생활패턴 분석 (1~6시)
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> fmy1to6Select(List<RefValueObject> refValueObject) throws Exception;
	
	/**
    * 가족구성원별 생활패턴 분석 (6~12시)
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> fmy6to12Select(List<RefValueObject> refValueObject) throws Exception;
	
	
	/**
    * 가족구성원별 생활패턴 분석 (12~18시)
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> fmy12to18Select(List<RefValueObject> refValueObject) throws Exception;
	
	
	/**
    * 가족구성원별 생활패턴 분석 (18~24시)
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> fmy18to24Select(List<RefValueObject> refValueObject) throws Exception;
	
	
	
	/**
    * 섭취 영양성분 조회 (영양성분 분석-리스트)
    *
    * @param RefValueObject refValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> intkInfoNutListSelect(RefValueObject refValueObject) throws Exception;
	
	
	/**
    * 섭취 영양성분 조회 (영양성분 분석-차트)
    *
    * @param RefValueObject refValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject intkInfoNutChartSelect(RefValueObject refValueObject) throws Exception;	
	
	
	/**
    * 섭취 영양성분 조회 (생활패턴 분석 리스트)
    *
    * @param RefValueObject refValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> intkInfoPatternSelect(RefValueObject refValueObject) throws Exception;
	
		
	/**
    * 섭취 영양성분 조회 (생활패턴 분석 차트)
    *
    * @param RefValueObject refValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject intkInfoPatternChartSelect(RefValueObject refValueObject) throws Exception;
		
	
	/**
    * 섭취 영양성분 조회 (가족구성원 분석 - 리스트)
    *
    * @param RefValueObject
    * @return  List<HashMap<String, Object>>
    * @exception  Exception
    */
	public List<HashMap<String, Object>> intkInfoFmySelect(RefValueObject fmyMemList) throws Exception;
	
	
	/**
    * 섭취 영양성분 조회 (가족구성원 분석 - 차트)
    *
    * @param RefValueObject
    * @return  List<HashMap<String, Object>>
    * @exception  Exception
    */
	public List<HashMap<String, Object>> intkInfoFmyChartSelect(RefValueObject fmyMemList) throws Exception;
	
}
