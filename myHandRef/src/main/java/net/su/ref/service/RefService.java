package net.su.ref.service;


import java.util.List;

import net.su.ref.valueObject.RefValueObject;

public interface RefService {
	
	/**
    * 바코드 데이터 존재하는지 확인
    *
    * @param RefValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject barcdInfoSelect(RefValueObject refValueObject) throws Exception;
	
	
	/**
    * 바코드 인식으로 상품 등록
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void prodctInsert(RefValueObject refValueObject) throws Exception;
	
	
	
	/**
    * 보유 식품 리스트 정보 조회
    *
    * @param RefValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> havRefList(RefValueObject refValueObject) throws Exception;
	
	
	/**
    * 보유식품 버림 처리
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void prodctDelete(RefValueObject refValueObject) throws Exception;

	
	/**
    * 가족 구성원 조회
    *
    * @param RefValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> fmyMemSelect(RefValueObject refValueObject) throws Exception;
	
	
	/**
    * 식품 섭취
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void prodctIntk(RefValueObject refValueObject) throws Exception;
	
	
	/**
    * 식품 상세보기
    *
    * @param RefValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject mainProdctSelectOne(RefValueObject refValueObject) throws Exception;	
	
	
	/**
    * 식품 상세정보 수정
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void prodctInfoUpdate(RefValueObject refValueObject) throws Exception;
	
	
	/**
    * 식품 상세정보 직접 등록
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void directProdctInfoInsert(RefValueObject refValueObject) throws Exception;	
	
	
	/**
    * 바코드 리스트 조회
    *
    * @param RefValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> barcdListSelect(RefValueObject refValueObject) throws Exception;
	
	
	
	
}