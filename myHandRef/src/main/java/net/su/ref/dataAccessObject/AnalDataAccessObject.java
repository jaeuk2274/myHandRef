package net.su.ref.dataAccessObject;

import java.util.HashMap;
import java.util.List;

import net.su.common.Logger;
import net.su.ref.valueObject.MemValueObject;
import net.su.ref.valueObject.RefValueObject;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class AnalDataAccessObject extends SqlSessionDaoSupport {

	

	/**
    * 섭취 영양성분 조회 (투데이)
    *
    * @param MemValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject intkInfoSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("섭취 영양성분 조회");
		RefValueObject intkInfoSelect = getSqlSession().selectOne("analMapper.intkInfoSelect", refValueObject);
		return intkInfoSelect;		
	}
	
	
	/**
    * 권장 영양성분 조회
    *
    * @param MemValueObject
    * @return  RefValueObject
    * @exception  Exception
    */
	public RefValueObject recmndInfoSelect(MemValueObject memValueObject) throws Exception{
		Logger.info("권장 영양성분 조회");
		RefValueObject recmndInfoSelect = getSqlSession().selectOne("analMapper.recmndInfoSelect", memValueObject);
		return recmndInfoSelect;
	}
	
	
	/**
    * 권장 / 하루 섭취 비율 구함 (권장 섭취 식품 리스트 조회)
    *
    * @param MemValueObject
    * @return  List<HashMap<String, Object>>
    * @exception  Exception
    */
	public List<HashMap<String, Object>> todayIntkPercntSelect(MemValueObject memValueObject) throws Exception{
		Logger.info("권장 / 하루 섭취 비율 구함 (권장 섭취 식품 리스트 조회)");
		List<HashMap<String, Object>> percntList = getSqlSession().selectList("analMapper.todayIntkPercntSelect", memValueObject);
		return percntList;
		
	}

	
	/**
    * 권장 섭취 식품 조회
    *
    * @param RefValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> todayRecmndSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("권장 섭취 식품 조회");
		List<RefValueObject> recmndList = getSqlSession().selectList("analMapper.todayRecmndSelect", refValueObject);
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
		List<RefValueObject> todayIntkList = getSqlSession().selectList("analMapper.todayIntkSelect", memValueObject);
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
		List<RefValueObject> fmy1to6List = getSqlSession().selectList("analMapper.fmy1to6Select", refValueObject);
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
		List<RefValueObject> fmy1to6List = getSqlSession().selectList("analMapper.fmy6to12Select", refValueObject);
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
		List<RefValueObject> fmy1to6List = getSqlSession().selectList("analMapper.fmy12to18Select", refValueObject);
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
		List<RefValueObject> fmy1to6List = getSqlSession().selectList("analMapper.fmy18to24Select", refValueObject);
		return fmy1to6List;
	}
	
	
	/**
    * 섭취 영양성분 조회 (영양성분 분석-리스트)
    *
    * @param MemValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> intkInfoNutListSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("섭취 영양성분 조회 (영양성분 분석) - 리스트");
		List<RefValueObject> intkInfoNutList = getSqlSession().selectList("analMapper.intkInfoNutListSelect", refValueObject);
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
		Logger.info("섭취 영양성분 조회 (영양성분 분석) - 차트");
		refValueObject = getSqlSession().selectOne("analMapper.intkInfoNutChartSelect", refValueObject);
		return refValueObject;		
	}
	
	
	/**
    * 섭취 영양성분 조회 (생활패턴 분석-리스트)
    *
    * @param RefValueObject refValueObject
    * @return  List<RefValueObject>
    * @exception  Exception
    */
	public List<RefValueObject> intkInfoPatternSelect(RefValueObject refValueObject) throws Exception{
		Logger.info("섭취 영양성분 조회 (생활패턴 분석-리스트)");
		List<RefValueObject> intkInfoPatternList = getSqlSession().selectList("analMapper.intkInfoPatternSelect", refValueObject);
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
		RefValueObject intkInfoPatternChart = getSqlSession().selectOne("analMapper.intkInfoPatternChartSelect", refValueObject);
		return intkInfoPatternChart;	
	}
	
	
	/**
    * 섭취 영양성분 조회 (가족구성원 분석 - 리스트)
    *
    * @param RefValueObject
    * @return  List<HashMap<String, Object>>
    * @exception  Exception
    */
	public List<HashMap<String, Object>> intkInfoFmySelect(RefValueObject fmyMemList) throws Exception{
		Logger.info("섭취 영양성분 조회 (가족구성원 분석 - 리스트)");
		List<HashMap<String, Object>> intkInfoFmyList = getSqlSession().selectList("analMapper.intkInfoFmySelect", fmyMemList);
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
		List<HashMap<String, Object>> intkInfoFmyChart = getSqlSession().selectList("analMapper.intkInfoFmyChartSelect", refValueObject);
		return intkInfoFmyChart;
	}
}
