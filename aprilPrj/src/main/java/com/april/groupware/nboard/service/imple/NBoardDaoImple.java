/**
 * 
 */
package com.april.groupware.nboard.service.imple;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;

import com.april.groupware.cmn.DTO;
import com.april.groupware.cmn.SearchVO;
import com.april.groupware.nboard.service.NBoardDao;
import com.april.groupware.nboard.service.NBoardVO;

/**
 * @author sist
 *
 */
@Repository
@EnableAspectJAutoProxy(proxyTargetClass=true)
public class NBoardDaoImple implements NBoardDao {

	//Logger
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAMESPACE= "com.april.groupware.nboard";
	
	@Override
	public int doUpdateReadCnt(DTO dto) {
		NBoardVO inVO = (NBoardVO) dto;
		
		LOG.debug("1=doUpdateReadCnt=============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");
		
		// namespace+id = com.sist.ehr.board.doInsert 
		String statement = NAMESPACE+".doUpdateReadCnt";
		LOG.debug("2=doUpdateReadCnt=============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");	
		
		int  flag = this.sqlSessionTemplate.update(statement, inVO);
		LOG.debug("3=doUpdateReadCnt=============================");
		LOG.debug("3=flag="+flag);
		LOG.debug("3==============================");			
		
		return flag;
	}

	@Override
	public int doInsert(DTO dto) {
		NBoardVO inVO = (NBoardVO) dto;
		
		LOG.debug("1=doInsert=============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");
		
		// namespace+id = com.april.groupware.nboard.doInsert 
		String statement = NAMESPACE+".doInsert";
		LOG.debug("2=doInsert=============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");	
		
		int  flag = this.sqlSessionTemplate.insert(statement, inVO);
		LOG.debug("3=doInsert=============================");
		LOG.debug("3=flag="+flag);
		LOG.debug("3==============================");			
		
		return flag;
	}

	@Override
	public int doUpdate(DTO dto) {
		NBoardVO inVO = (NBoardVO) dto;
		
		LOG.debug("1=doUpdate=============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");
		
		// namespace+id = com.april.groupware.nboard.doUpdate  
		String statement = NAMESPACE+".doUpdate";
		LOG.debug("2=doUpdate=============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");	
		
		int  flag = this.sqlSessionTemplate.update(statement, inVO);
		LOG.debug("3=doUpdate=============================");
		LOG.debug("3=flag="+flag);
		LOG.debug("3==============================");			
		
		return flag;
	}

	@Override
	public DTO doSelectOne(DTO dto) {
		NBoardVO inVO = (NBoardVO) dto;
		
		LOG.debug("1=doSelectOne=============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");
		
		// namespace+id = com.april.groupware.nboard.doSelectOne 
		String statement = NAMESPACE+".doSelectOne";
		LOG.debug("2=doSelectOne=============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");	
		
		NBoardVO outVO = this.sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("3=doSelectOne=============================");
		LOG.debug("3=outVO="+outVO);
		LOG.debug("3==============================");			
		
		return outVO;
	}

	//제목검색
	public DTO doSelectOneTitle(DTO dto) {
		NBoardVO inVO = (NBoardVO) dto;
		
		LOG.debug("1=doSelectOneTitle=============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");
		
		// namespace+id = com.april.groupware.nboard.doSelectOneTitle 
		String statement = NAMESPACE+".doSelectOneTitle";
		LOG.debug("2=doSelectOneTitle=============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");	
		
		NBoardVO outVO = this.sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("3=doSelectOneTitle=============================");
		LOG.debug("3=outVO="+outVO);
		LOG.debug("3==============================");			
		
		return outVO;
	}
	
	@Override
	public int doDelete(DTO dto) {
		NBoardVO inVO = (NBoardVO) dto;
		
		LOG.debug("1=doDelete=============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");
		
		// namespace+id = com.april.groupware.nboard.doDelete 
		String statement = NAMESPACE+".doDelete";
		LOG.debug("2=doDelete=============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");	
		
		int  flag = this.sqlSessionTemplate.delete(statement, inVO);
		LOG.debug("3=doDelete=============================");
		LOG.debug("3=flag="+flag);
		LOG.debug("3==============================");			
		
		return flag;
	}
	
	//전체 삭제
	public void doDeleteAll() {
		LOG.debug("1=doDeleteAll=============================");
		LOG.debug("1=");
		LOG.debug("1==============================");
		
		// namespace+id = com.april.groupware.nboard.doInsert 
		//com.sist.ehr.board.doDeleteAll
		String statement = NAMESPACE+".doDeleteAll";
		LOG.debug("2=doDeleteAll=============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");	
		
		int  flag = this.sqlSessionTemplate.delete(statement);
		LOG.debug("3=doDeleteAll=============================");
		LOG.debug("3=flag="+flag);
		LOG.debug("3==============================");	
	}
	
	
	
	@Override
	public List<?> getAll(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<?> doRetrieve(DTO dto) {
		SearchVO inVO = (SearchVO) dto;
		
		LOG.debug("1=doRetrieve=============================");
		LOG.debug("1=inVO="+inVO);
		LOG.debug("1==============================");
		
		// namespace+id = com.april.groupware.nboard.doRetrieve 
		String statement = NAMESPACE+".doRetrieve";
		LOG.debug("2=doRetrieve=============================");
		LOG.debug("2=statement="+statement);
		LOG.debug("2==============================");	
		
		List<NBoardVO> outList = this.sqlSessionTemplate.selectList(statement, inVO);
		LOG.debug("3=doRetrieve=============================");
		LOG.debug("3=outList="+outList);
		LOG.debug("3==============================");			
		
		return outList;
	}

}
