package net.su.ref.dataAccessObject;

import java.util.HashMap;
import java.util.List;

import net.su.common.Logger;
import net.su.ref.valueObject.RefValueObject;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class RefDataAccessObject extends SqlSessionDaoSupport {

	
	/**
    * 바코드 번호로 식품 상세정보(바코드tb) 조회
    *
    * @param RefValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject barcdInfoSelect(RefValueObject refValueObject){
		Logger.info("바코드 번호로 식품 상세정보(바코드tb) 조회");
		RefValueObject barcdInfo = getSqlSession().selectOne("refMapper.barcdInfoSelect", refValueObject);
		return barcdInfo;
	}
	
	/**
    * 조회된 바코드 정보 등록(inputHistoryInsert)입고내역
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void inputHistoryInsert(RefValueObject refValueObject){
		Logger.info("조회된 바코드 정보 등록(inputHistoryInsert)입고내역");
		getSqlSession().insert("refMapper.inputHistoryInsert", refValueObject);
	}
	
	/**
    * 조회된 바코드 정보 등록(havFoodInsert)보유식품
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void havFoodInsert(RefValueObject refValueObject){
		Logger.info("조회된 바코드 정보 등록(havFoodInsert)보유식품");
		getSqlSession().insert("refMapper.havFoodInsert", refValueObject);
	}
	
	/**
    * 보유 식품 리스트 정보 조회
    *
    * @param RefValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> havRefList(RefValueObject refValueObject) throws Exception{
		Logger.info("보유 식품 리스트 정보 조회");
		return getSqlSession().selectList("refMapper.havRefList", refValueObject);	
	}	
	
	/**
    * 보유 식품 리스트 개수 카운트
    *
    * @param RefValueObject
    * @return  Integer
    * @exception  Exception
    */
	public int havRefListCount(RefValueObject refValueObject) throws Exception{
		Logger.info("보유 식품 리스트 개수 카운트");	
		return getSqlSession().selectOne("refMapper.havRefListCount", refValueObject);	
	}	
	
	
	
	
	/**
    * 보유식품 버림 처리
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void prodctDelete(RefValueObject refValueObject) throws Exception{
		Logger.info("보유식품 버림 처리");
		getSqlSession().delete("refMapper.prodctDelete", refValueObject);	
	}
	
	/**
    * 입고내역 섭취여부 -> 버림 update
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void inputHistoryWhetherUpdate(RefValueObject refValueObject) throws Exception{
		Logger.info("입고내역 섭취여부 -> 버림 update");
		getSqlSession().update("refMapper.inputHistoryWhetherUpdate", refValueObject);	
	}	
	
	
	/**
    * 가족 구성원 조회
    *
    * @param RefValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> fmyMemSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("가족 구성원 조회");
		return getSqlSession().selectList("refMapper.fmyMemSelect", refValueObject);
	}	
	
	/**
    * 식품 섭취 (섭취정보tb insert)
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void prodctIntk(RefValueObject refValueObject) throws Exception{
		Logger.info("식품 섭취 (섭취정보tb insert)");
		getSqlSession().insert("refMapper.prodctIntk", refValueObject);
	}
	
	
	/**
    * 현재 섭취율이 선택한 섭취율보다 더 높거나 같은 경우의 식품 seq 찾아내서 제거한 seq 및 각각의 섭취율 계산
    *
    * @param refValueObject
    * @return List<HashMap<String, Object>> refList
    * @exception  Exception
    */
	public List<HashMap<String, Object>> intkRatChk(RefValueObject refValueObject) throws Exception{
		Logger.info("현재 섭취율이 선택한 섭취율보다 더 높거나 같은 경우의 식품 seq 찾아내서 제거한 seq 및 각각의 섭취율 계산");
		List<HashMap<String, Object>> refList = getSqlSession().selectList("refMapper.intkRatChk", refValueObject);
		return refList;
	}	
	
	/**
    * 섭취량 update
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void prodctIntkRatUpdate(RefValueObject refValueObject) throws Exception{
		Logger.info("섭취량 update");
		getSqlSession().update("refMapper.prodctIntkRatUpdate", refValueObject);
	}
	
	
	/**
    * 식품 상세보기
    *
    * @param RefValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject mainProdctSelectOne(RefValueObject refValueObject) throws Exception{
		Logger.info("식품 상세보기");
		return getSqlSession().selectOne("refMapper.mainProdctSelectOne", refValueObject);
	}	
	
	/**
    * 가장 최근 식품 seq 조회
    *
    * @param RefValueObject
    * @return  int
    * @exception  Exception
    */
	public int recentSeqSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("가장 최근 식품 seq 조회");
		return getSqlSession().selectOne("refMapper.recentSeqSelect", refValueObject);
	}		

	
	/**
    * 식품 상세정보 수정
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void prodctInfoUpdate(RefValueObject refValueObject) throws Exception{
		Logger.info("식품 상세정보 수정");
		getSqlSession().update("refMapper.prodctInfoUpdate", refValueObject);
	}
	
	
	/**
    * 식품 상세정보 직접 등록 (input history tb)
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void directInputHistoryInsert(RefValueObject refValueObject) throws Exception{
		Logger.info("식품 상세정보 직접 등록 (input history tb)");
		getSqlSession().insert("refMapper.directInputHistoryInsert", refValueObject);
	}	
	
	
	/**
    *  직접입력한 상품 정보 등록(havFoodInsert)보유식품 
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void directHavFoodInsert(RefValueObject refValueObject){
		Logger.info("직접입력한 상품 정보 등록(havFoodInsert)보유식품");
		getSqlSession().insert("refMapper.directHavFoodInsert", refValueObject);
	}
	
	/**
    * 바코드 리스트 개수 카운트
    *
    * @param RefValueObject
    * @return  Integer
    * @exception  Exception
    */
	public int barcdListCount(RefValueObject refValueObject) throws Exception{
		Logger.info("바코드 리스트 개수 카운트");	
		return getSqlSession().selectOne("refMapper.barcdListCount", refValueObject);	
	}	
	
	
	/**
    * 바코드 리스트 조회
    *
    * @param RefValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> barcdListSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("바코드 리스트 조회");
		return getSqlSession().selectList("refMapper.barcdListSelect", refValueObject);
	}	
	
}

