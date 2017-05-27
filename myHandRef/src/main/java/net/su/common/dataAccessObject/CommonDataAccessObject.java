package net.su.common.dataAccessObject;

import java.util.List;

import net.su.common.Logger;
import net.su.ref.valueObject.MemValueObject;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDataAccessObject extends SqlSessionDaoSupport{
	
	
	/**
    * (조회) 멤버 로그인 메서드 
    *
    * @param MemValueObject
    * @return  MemValueObject
    * @exception  Exception
    */
	public MemValueObject memLogin(MemValueObject memVo) throws Exception{
		Logger.info("멤버 로그인 메서드 ");
		return getSqlSession().selectOne("commonMapper.memLogin", memVo);
	}
}