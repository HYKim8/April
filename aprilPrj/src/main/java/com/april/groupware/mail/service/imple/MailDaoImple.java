package com.april.groupware.mail.service.imple;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.april.groupware.cmn.DTO;
import com.april.groupware.mail.service.MailDao;
import com.april.groupware.mail.service.MailVO;

@Repository
public class MailDaoImple implements MailDao {

	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	private final String NAMESPACE= "com.april.groupware.mail";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//JDBCTemplate
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	RowMapper<MailVO> rowMapper = new RowMapper<MailVO>() {
		public MailVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			MailVO outData = new MailVO();
			outData.setCategory(rs.getString("category"));
			outData.setTitle(rs.getString("title"));
			outData.setSenDate(rs.getString("sen_date"));
			outData.setSender(rs.getString("sender"));
			outData.setSenderId(rs.getString("sender_id"));
			outData.setRecipient(rs.getString("recipient"));
			outData.setRecipientId(rs.getString("recipient_id"));
			outData.setFileId(rs.getString("file_id"));
			outData.setContents(rs.getString("contents"));
			return outData;
		}

	};
	
	public MailDaoImple() {}
	
	/**
	 * Method Name: doInsert
	 * 작성일: 2020. 5. 12.
	 * 작성자: MINJI
	 * 설명: email 테이블에 Insert
	 * @throws java.lang.Exception
	 */
	@Override
	public int doInsert(DTO dto) {
		MailVO inVO = (MailVO) dto;
		
		LOG.debug("=====MailDaoImple [doInsert] Start======");
		LOG.debug("** Param(inVO) :\n"+inVO.toString());
		
		// namespace+id = com.sist.ehr.board.doInsert 
		String statement = NAMESPACE+".doInsertMail";
		LOG.debug("** statement : "+statement);
		
		int  flag = this.sqlSessionTemplate.insert(statement, inVO);
		LOG.debug("** flag: "+flag);
		
		LOG.debug("=====MailDaoImple [doInsert] End======");
		return flag;
	}

	
	@Override
	public int doUpdate(DTO dto) {
		
		return 0;
	}

	@Override
	public DTO doSelectOne(DTO dto) {
		MailVO inVO = (MailVO) dto;
		MailVO outVO = null;
		
		StringBuilder  sb=new StringBuilder();
		sb.append("SELECT e.category,									\n");
		sb.append("	   e.title,                                         \n");
		sb.append("	   DECODE(TO_CHAR(sen_date, 'YYYY/MM/DD'),TO_CHAR(SYSDATE, 'YYYY/MM/DD'),TO_CHAR(sen_date,'HH24:MI:SS'),TO_CHAR(sen_date,'YYYY/MM/DD HH24:MI:SS')) sen_date,\n");
		sb.append("	   e.sender,                                        \n");
		sb.append("	   e.sender_id,                                     \n");
		sb.append("	   r.recipient,                                      \n");
		sb.append("	   r.recipient_id,                                   \n");
		sb.append("	   e.file_id,                                       \n");
		sb.append("	   e.contents	                                    \n");
		sb.append("FROM email e INNER JOIN recipient r                  \n");
		sb.append("ON e.mail_id = r.mail_id                             \n");
		sb.append("WHERE r.mail_seq = ?                                 \n");
		sb.append("AND   e.mail_id = ?                                  \n");
		sb.append("AND	  r.receiver_id = ?                             \n");
		
		//Query수행
		LOG.debug("=====MailDaoImple [doSelectOne] Start======");
		LOG.debug("** Query :\n"+sb.toString());
		LOG.debug("** Param :\n"+inVO.toString());
		
//		Object[] args = {inVO.getMailSeq()
//				,inVO.getMailId()
//				,inVO.getReceiverId()};
//		
//		outVO = this.jdbcTemplate.queryForObject(sb.toString()
//				,args
//				,rowMapper); 
//		LOG.debug("** outVO : "+outVO);
//		LOG.debug("=====MailDaoImple [doInsert] End======");
		return outVO;
	}
	
	/**
	 * Method Name: doSelectUserId
	 * 작성일: 2020. 5. 14.
	 * 작성자: MINJI
	 * 설명: ORGANIZATION 테이블에서 Id 조회
	 * @throws java.lang.Exception
	 */
	@Override
	public DTO doSelectUserId(DTO dto) {
		
		LOG.debug("=====MailDaoImple [doSelectUserId] Start======");
		
		MailVO inVO = (MailVO) dto;
		LOG.debug("** Param(inVO) :\n"+inVO.toString());		
		
		// namespace+id = com.sist.ehr.board.doInsert 
		String statement = NAMESPACE+".doSelectUserId";
		LOG.debug("** statement : "+statement);
		
		MailVO outVO = this.sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("** outVO: "+outVO);
		inVO.setRecipientId(outVO.getRecipientId());
		LOG.debug("** inVO(recipientId 변경 후): "+inVO);
		
		LOG.debug("=====MailDaoImple [doSelectUserId] End======");
		return inVO;
		
//------------------Mybatis 사용 안한거--------------------------------------		
//		LOG.debug("=====MailDaoImple [doSelectUserId] Start======");
//		
//		MailVO inVO = (MailVO) dto;
//		MailVO outVO = null;
//		
//		StringBuilder  sb=new StringBuilder();
//		sb.append("SELECT ID			\n");
//		sb.append("FROM ORGANIZATION    \n");
//		sb.append("WHERE NAME = ?       \n");
//		
//		LOG.debug("** Query :\n"+sb.toString());
//		LOG.debug("** Param :\n"+inVO.toString());
//		
//		Object[] arg = {inVO.getRecipient()};
//		outVO = this.jdbcTemplate.queryForObject(sb.toString()
//				,arg
//				,rowMapper); 
//		
//		LOG.debug("=====MailDaoImple [doSelectUserId] End======");
//		return outVO;
//------------------Mybatis 사용 안한거--------------------------------------
	}

	@Override
	public int doDelete(DTO dto) {
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


}
