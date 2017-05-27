package net.su.ref.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import net.su.common.Logger;
import net.su.ref.dataAccessObject.AnalDataAccessObject;
import net.su.ref.dataAccessObject.RefDataAccessObject;
import net.su.ref.valueObject.MemValueObject;
import net.su.ref.valueObject.RefValueObject;

import org.springframework.stereotype.Service;

@Service
public class AnalServiceImpl implements AnalService {
	
	@Resource
	private AnalDataAccessObject analDataAccessObject;
	@Resource
	private RefDataAccessObject refDataAccessObject;
		
	
	/**
    * 권장 영양성분 조회
    *
    * @param MemValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject recmndInfoSelect(MemValueObject memValueObject) throws Exception{
		Logger.info("권장 영양설분 조회");
		RefValueObject recmndInfoSelect = analDataAccessObject.recmndInfoSelect(memValueObject); 
		return recmndInfoSelect;
	}
	

	/**
    * 섭취 영양성분 조회 (투데이)
    *
    * @param MemValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject intkInfoSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("섭취 영양성분 조회");
		RefValueObject intkInfoSelect = analDataAccessObject.intkInfoSelect(refValueObject); 
		return intkInfoSelect;		
	}
	
	
	
	/**
    * 권장 섭취 식품 조회
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> todayRecmndSelect(MemValueObject memValueObject) throws Exception{
		Logger.info("권장 섭취 식품 조회");
		List<HashMap<String, Object>> percntList = analDataAccessObject.todayIntkPercntSelect(memValueObject);  // 권장 / 섭취 비율 구함 (권장 섭취 식품 리스트 조회)
		RefValueObject refValueObject = new RefValueObject();
		refValueObject.setRefList(percntList);
		refValueObject.setRefrigerator_seq(memValueObject.getRefrigerator_seq());
		List<RefValueObject> recmndList = analDataAccessObject.todayRecmndSelect(refValueObject);  // 권장 섭취 식품 조회
		return recmndList;
	}
	
	
	/**
    * 투데이 섭취 식품 조회
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> todayIntkSelect(MemValueObject memValueObject) throws Exception{
		Logger.info("투데이 섭취 식품 조회");
		List<RefValueObject> todayIntkList = analDataAccessObject.todayIntkSelect(memValueObject);  // 권장 섭취 식품 조회
		return todayIntkList;
	}
	
	
	/**
    *  가족구성원별 생활패턴 분석 (1~6시)
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> fmy1to6Select(List<RefValueObject> refValueObject) throws Exception{
		Logger.info("가족구성원별 생활패턴 분석 (1~6시)");
		List<RefValueObject> fmy1to6List = analDataAccessObject.fmy1to6Select(refValueObject);	
		return fmy1to6List;
	}
	
	/**
    *  가족구성원별 생활패턴 분석 (6~12시)
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> fmy6to12Select(List<RefValueObject> refValueObject) throws Exception{
		Logger.info("가족구성원별 생활패턴 분석 (6~12시)");
		List<RefValueObject> fmy1to6List = analDataAccessObject.fmy6to12Select(refValueObject);	
		return fmy1to6List;
	}	
	
	/**
    *  가족구성원별 생활패턴 분석 (12~18시)
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> fmy12to18Select(List<RefValueObject> refValueObject) throws Exception{
		Logger.info("가족구성원별 생활패턴 분석 (12~18시)");
		List<RefValueObject> fmy1to6List = analDataAccessObject.fmy12to18Select(refValueObject);	
		return fmy1to6List;
	}	
	
	/**
    *  가족구성원별 생활패턴 분석 (18~24시)
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> fmy18to24Select(List<RefValueObject> refValueObject) throws Exception{
		Logger.info("가족구성원별 생활패턴 분석 (18~24시)");
		List<RefValueObject> fmy1to6List = analDataAccessObject.fmy18to24Select(refValueObject);	
		return fmy1to6List;
	}
	
	
	/**
    * 섭취 영양성분 조회 (영양성분 분석)
    *
    * @param RefValueObject refValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> intkInfoNutListSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("섭취 영양성분 조회 (영양성분 분석)");
		if(refValueObject.getNutAnalCheckGroup() == null) {
			int[] ints = {1, 2, 3, 4};
			List<Integer> intList = new ArrayList<Integer>();
			for (int index = 0; index < ints.length; index++)
			{
			    intList.add(ints[index]);
			}
			refValueObject.setNutAnalCheckGroup(intList);
		}
			
		System.out.println(refValueObject.getSearch_dat());
		
		
		System.out.println(refValueObject.getSearch_dat());
		if(refValueObject.getSearch_dat() != null && !refValueObject.getSearch_dat().equals("")) {
			String[] array = refValueObject.getSearch_dat().split(" to ");   
			refValueObject.setStart_dat(array[0]);
			System.out.println(array[0]);
			refValueObject.setEnd_dat(array[1]);
			System.out.println(array[1]);
		}
		
	    /* ktypeWhere가 비어있다면 ktypeWhere 에 cha 값을 넣고 비어있지 않다면
	    *  기존 값에 ,를 추가하여 cha를 덧붙인다.
	    */
//	    ktypeWhere += (ktypeWhere.equals("")) ? "'"+cha+"'" : ",'"+cha+"'";
	             	    		
		List<RefValueObject> intkInfoNutList = analDataAccessObject.intkInfoNutListSelect(refValueObject); 
		return intkInfoNutList;		
	}
	
	
	/**
    * 섭취 영양성분 조회 (영양성분 분석-차트)
    *
    * @param RefValueObject refValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject intkInfoNutChartSelect(RefValueObject refValueObject) throws Exception{
		if(refValueObject.getSearch_dat() != null && !refValueObject.getSearch_dat().equals("")) {
			String[] array = refValueObject.getSearch_dat().split(" to ");   
			refValueObject.setStart_dat(array[0]);
			refValueObject.setEnd_dat(array[1]);
		}	
		refValueObject = analDataAccessObject.intkInfoNutChartSelect(refValueObject); 		
		return refValueObject;		
	}
	
	
	/**
    * 섭취 영양성분 조회 (생활패턴 분석- 리스트)
    *
    * @param RefValueObject refValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> intkInfoPatternSelect(RefValueObject refValueObject) throws Exception{
		if(refValueObject.getSearch_dat() != null && !refValueObject.getSearch_dat().equals("")) {
			String[] array = refValueObject.getSearch_dat().split(" to ");   
			refValueObject.setStart_dat(array[0]);
			refValueObject.setEnd_dat(array[1]);
		}
		List<RefValueObject> intkInfoPatternList = analDataAccessObject.intkInfoPatternSelect(refValueObject); 
		return intkInfoPatternList;	
		
	}
	
	/**
    * 섭취 영양성분 조회 (생활패턴 분석 차트)
    *
    * @param RefValueObject refValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject intkInfoPatternChartSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("섭취 영양성분 조회 (생활패턴 분석-차트)");
		if(refValueObject.getSearch_dat() != null && !refValueObject.getSearch_dat().equals("")) {
			String[] array = refValueObject.getSearch_dat().split(" to ");   
			refValueObject.setStart_dat(array[0]);
			refValueObject.setEnd_dat(array[1]);
		}
		RefValueObject intkInfoPatternChart = analDataAccessObject.intkInfoPatternChartSelect(refValueObject); 
		return intkInfoPatternChart;	
	}
		
	
	/**
    * 섭취 영양성분 조회 (가족구성원 분석 - 리스트)
    *
    * @param RefValueObject
    * @return  List<HashMap<String, Object>>
    * @exception  Exception
    */
	public List<HashMap<String, Object>> intkInfoFmySelect(RefValueObject refValueObject) throws Exception{
		Logger.info("섭취 영양성분 조회 (가족구성원 분석 - 리스트)");
		if(refValueObject.getSearch_dat() != null && !refValueObject.getSearch_dat().equals("")) {
			String[] array = refValueObject.getSearch_dat().split(" to ");   
			refValueObject.setStart_dat(array[0]);
			refValueObject.setEnd_dat(array[1]);
		}
		List<HashMap<String, Object>> intkInfoFmyList = analDataAccessObject.intkInfoFmySelect(refValueObject); 
		return intkInfoFmyList;
	}
	
	
	/**
    * 섭취 영양성분 조회 (가족구성원 분석 - 차트)
    *
    * @param RefValueObject
    * @return  List<HashMap<String, Object>>
    * @exception  Exception
    */
	public List<HashMap<String, Object>> intkInfoFmyChartSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("섭취 영양성분 조회 (가족구성원 분석 - 차트)");
		if(refValueObject.getSearch_dat() != null && !refValueObject.getSearch_dat().equals("")) {
			String[] array = refValueObject.getSearch_dat().split(" to ");   
			refValueObject.setStart_dat(array[0]);
			refValueObject.setEnd_dat(array[1]);
		}
		List<HashMap<String, Object>> intkInfoFmyChart = analDataAccessObject.intkInfoFmyChartSelect(refValueObject); 
		return intkInfoFmyChart;
	}
}
	