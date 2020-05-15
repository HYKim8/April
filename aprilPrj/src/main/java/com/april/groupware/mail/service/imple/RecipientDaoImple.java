package com.april.groupware.mail.service.imple;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.april.groupware.cmn.DTO;
import com.april.groupware.mail.service.MailDao;
import com.april.groupware.mail.service.MailVO;

public class RecipientDaoImple implements MailDao {

	private final Logger LOG = LoggerFactory.getLogger(this.getClass());

	private final String NAMESPACE= "com.april.groupware.mail";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	// JDBCTemplate
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private int cnt = 0;

	public RecipientDaoImple() {}
	
	@Override
	public int doInsert(DTO dto) {
		MailVO inVO = (MailVO) dto;
		cnt++;
		
		LOG.debug("=====RecipientDaoImple [doInsert] Start======");
		
		String statement = NAMESPACE+".doInsertRecipient";
		LOG.debug("** statement : "+statement);
		
		int flag = this.sqlSessionTemplate.insert(statement, inVO);
		LOG.debug("** flag : "+flag);
		
		LOG.debug("=====RecipientDaoImple [doInsert] End=====");
		return flag;
	}

	/**
	 * Method Name : doUpdate
	 * 작성일: 2020. 5. 12.
	 * 작성자: MINJI
	 * 설명: 메일 삭제 여부
	 * return: int
	 * @throws java.lang.Exception
	 */
	@Override
	public int doUpdate(DTO dto) {
		int flag = 0;
		MailVO inVO = (MailVO) dto;
		
		StringBuilder sb=new StringBuilder();
		sb.append("UPDATE recipient		\n");
		sb.append("SET disable_yn = ?   \n");
		sb.append("WHERE mail_seq = ?   \n");
		
		LOG.debug("=====MailDaoImple [doUpdate] Start======");
		LOG.debug("** Query :\n"+sb.toString());
		LOG.debug("** Param :\n"+inVO.toString());
		
//		Object[] args = {"Y"
//				,inVO.getMailSeq()};
//		flag = this.jdbcTemplate.update(sb.toString(), args);
//		LOG.debug("** flag: "+flag);
//		LOG.debug("=====MailDaoImple [doUpdate] End======");
		return flag;
	}
	

	@Override
	public DTO doSelectOne(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int doDelete(DTO dto) {
//		int flag = 0;
//		RecipientVO inVO = (RecipientVO) dto;
//		
//		StringBuilder sb = new StringBuilder();
//		sb.append("DELETE FROM recipient	\n");
//		sb.append("WHERE mail_id = ?        \n");
//		sb.append("    AND receiver_id = ?\n");
//		
//		LOG.debug("=====RecipientDaoImple [doDelete] Start======");
//		LOG.debug("** Query :\n"+sb.toString());
//		LOG.debug("** Param :\n"+inVO.toString());
//		Object[] args = {inVO.getMail_id()
//						,inVO.getReceiver_id()};
//		flag = this.jdbcTemplate.update(sb.toString(), args);
//		LOG.debug("** flag : "+flag);
//		LOG.debug("=====RecipientDaoImple [doDelete] End=====");
//		return flag;
		return 0;
	}

	@Override
	public List<?> doRetrieve(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<?> getAll(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DTO doSelectUserId(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

}
