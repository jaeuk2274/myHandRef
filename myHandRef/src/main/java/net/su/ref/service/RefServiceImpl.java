package net.su.ref.service;


import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import net.su.common.Logger;
import net.su.ref.dataAccessObject.RefDataAccessObject;
import net.su.ref.valueObject.RefValueObject;

import org.springframework.stereotype.Service;

@Service
public class RefServiceImpl implements RefService {
	
	@Resource
	private RefDataAccessObject refDataAccessObject;
	   
		
	/**
    * 바코드 데이터 존재하는지 확인
    *
    * @param RefValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject barcdInfoSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("바코드 데이터 존재하는지 확인");
		RefValueObject barcdInfo = refDataAccessObject.barcdInfoSelect(refValueObject); 
		return barcdInfo;
	}
	
	
	/**
    * 바코드 인식으로 상품 등록
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void prodctInsert(RefValueObject refValueObject) throws Exception{
		Logger.info("바코드 인식으로 상품 등록");
		refDataAccessObject.inputHistoryInsert(refValueObject);
		refDataAccessObject.havFoodInsert(refValueObject);
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
		int havRefListCount = refDataAccessObject.havRefListCount(refValueObject);
		refValueObject.setTotalRecordCount(havRefListCount);
		return refDataAccessObject.havRefList(refValueObject);		
	}
	
	
//	/**
//    * 보유 식품 리스트 개수 카운트
//    *
//    * @param RefValueObject
//    * @return  int
//    * @exception  Exception
//    */
//	public int havRefListCount(RefValueObject refValueObject) throws Exception{
//		Logger.info("보유 식품 리스트 개수 카운트");
//		int havRefListCount = refDataAccessObject.havRefListCount(refValueObject);
//		return havRefListCount;		
//	}
//		
		
	
	/**
    * 보유식품 버림 처리
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void prodctDelete(RefValueObject refValueObject) throws Exception{
		Logger.info("보유식품 버림 처리");
		refDataAccessObject.prodctDelete(refValueObject);	
		refDataAccessObject.inputHistoryWhetherUpdate(refValueObject);
		
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
		return refDataAccessObject.fmyMemSelect(refValueObject);	
	}
	
	/**
    * 식품 섭취
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void prodctIntk(RefValueObject refValueObject) throws Exception{
		Logger.info("식품 섭취");
		float intkRat = refValueObject.getIntk_rat();
		System.out.println("현재 섭취율이 선택한 섭취율보다 더 높거나 같은 경우의 식품 seq 찾아내서 제거한 seq 및 각각의 섭취율 계산");
		refValueObject.setFmyNum(refValueObject.getFmyCheckGroup().size());
		List<HashMap<String, Object>> refList = refDataAccessObject.intkRatChk(refValueObject);
		refValueObject.setRefList(refList);
		refDataAccessObject.prodctIntk(refValueObject);	 
		if(intkRat >= 100){
			refDataAccessObject.prodctDelete(refValueObject);
		}
		else{
			refDataAccessObject.prodctIntkRatUpdate(refValueObject); // 섭취량 update
		}	
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
		if(refValueObject.getInput_history_seq()==0){
			int recentSeq = refDataAccessObject.recentSeqSelect(refValueObject); 
			refValueObject.setInput_history_seq(recentSeq);
		}
		RefValueObject refInfo = refDataAccessObject.mainProdctSelectOne(refValueObject); 
		return refInfo;
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
		refDataAccessObject.prodctInfoUpdate(refValueObject); 
	}
	
	
	/**
    * 식품 상세정보 직접 등록
    *
    * @param RefValueObject
    * @return  void
    * @exception  Exception
    */
	public void directProdctInfoInsert(RefValueObject refValueObject) throws Exception{
		Logger.info("식품 상세정보 직접 등록"); 
		refDataAccessObject.directInputHistoryInsert(refValueObject); 
		refDataAccessObject.directHavFoodInsert(refValueObject); 
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
		int barcdListCount = refDataAccessObject.barcdListCount(refValueObject);		
		refValueObject.setTotalRecordCount(barcdListCount);		
		return refDataAccessObject.barcdListSelect(refValueObject);		
	}
	
	
	
	
	
	
}
	