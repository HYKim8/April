/**
 * 
 */
package com.april.groupware.dash.service.imple;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.april.groupware.cmn.DTO;
import com.april.groupware.dash.service.DashTodoDao;
import com.april.groupware.dash.service.DashTodoVO;

/**
 * @author sist
 *
 */
@Repository
public class DashTodoDaoImpl implements DashTodoDao {
	Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final  String NAMESPACE= "com.april.groupware.dash";
	


	@Override
	public DTO doSelectOne(DTO dto) {
		DashTodoVO inVO = (DashTodoVO) dto;
		
		LOG.debug("1==============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");
		
		// namespace+id = com.sist.ehr.board.doInsert 
		String statement = NAMESPACE+".doSelectOne";
		LOG.debug("2==============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");	
		
		DashTodoVO outVO = this.sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("3==============================");
		LOG.debug("3=outVO="+outVO);
		LOG.debug("3==============================");			
		
		return outVO;
	}
	

}
