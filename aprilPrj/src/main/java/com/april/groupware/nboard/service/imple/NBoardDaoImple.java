/**
 * 
 */
package com.april.groupware.nboard.service.imple;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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
	
	RowMapper<NBoardVO> rowMapper = new RowMapper<NBoardVO>() {
		public NBoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			NBoardVO outData=new NBoardVO();
			outData.setNbNo(rs.getInt("nb_no"));
			outData.setNbCategory(rs.getString("nb_category"));
			outData.setNbTitle(rs.getString("nb_title"));
			outData.setNbContents(rs.getString("nb_contents"));
			outData.setNoticeYn(rs.getString("notice_yn"));
			outData.setPopupYn(rs.getString("popup_yn"));
			outData.setFileId(rs.getString("file_id"));
			outData.setReadCnt(rs.getInt("read_cnt"));
			outData.setRegId(rs.getString("reg_id"));
			outData.setModId(rs.getString("mod_id"));
			outData.setRegDate(rs.getString("reg_date"));
			outData.setModDate(rs.getString("mod_date"));
			
			return outData;
		}
	};
	
	
	//JDBCTemplate
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public NBoardDaoImple() {}
	
	@Override
	public int doUpdateReadCnt(DTO dto) {
		return 0;
	}

	@Override
	public int doInsert(DTO dto) {
		int flag = 0;
		NBoardVO inVO = (NBoardVO) dto;
		
		StringBuilder  sb=new StringBuilder();
		sb.append(" INSERT INTO noticeboard (  \n");
		sb.append("     nb_no,                 \n");
		sb.append("     nb_category,           \n");
		sb.append("     nb_title,              \n");
		sb.append("     nb_contents,           \n");
		sb.append("     reg_id                 \n");
		sb.append(" ) VALUES (                 \n");
		sb.append("     board_seq.NEXTVAL,     \n");
		sb.append("     ?,                     \n");
		sb.append("     ?,                     \n");
		sb.append("     ?,                     \n");
		sb.append("     ?                      \n");
		sb.append(" )                          \n");
		//Query수행
		LOG.debug("==============================");
		LOG.debug("=Query=\n"+sb.toString());
		LOG.debug("=Param=\n"+inVO.toString());
		Object[] args= {inVO.getNbCategory(),
						inVO.getNbTitle(),
						inVO.getNbContents(),
						inVO.getRegId()
		};
		flag = this.jdbcTemplate.update(sb.toString(), args);

		return flag;
	}

	@Override
	public int doUpdate(DTO dto) {
		int flag = 0;
		NBoardVO inVO = (NBoardVO) dto;
		StringBuilder sb=new StringBuilder();
		sb.append(" UPDATE noticeboard   							\n");
		sb.append(" SET nb_category = ?,                            \n");
		sb.append("     nb_title = ?,                               \n");
		sb.append("     nb_contents = ?,                            \n");
		sb.append("     notice_yn = ?,                              \n");
		sb.append("     popup_yn = ?,                               \n");
		sb.append("     file_id = ?,                                \n");
		sb.append("     read_cnt = (SELECT NVL(MAX(read_cnt),0)+1   \n");
		sb.append("                 FROM noticeboard                \n");
		sb.append("                 WHERE nb_no = ?),               \n");
		sb.append("     mod_id = ?,                                 \n");
		sb.append("     mod_date = SYSDATE                          \n");
		sb.append(" WHERE nb_no = ?                                 \n");
		LOG.debug("==============================");
		LOG.debug("=Query=\n"+sb.toString());
		Object[] args= {inVO.getNbCategory(),
						inVO.getNbTitle(),
						inVO.getNbContents(),
						inVO.getNoticeYn(),
						inVO.getPopupYn(),
						inVO.getFileId(),
						inVO.getNbNo(),
						inVO.getModId(),
						inVO.getNbNo()
		};
		flag = this.jdbcTemplate.update(sb.toString(), args);
		LOG.debug("=flag= "+flag);
		LOG.debug("==============================");
		return flag;
	}

	@Override
	public DTO doSelectOne(DTO dto) {
		NBoardVO outVO = null;        //return UserVO
		NBoardVO inVO  = (NBoardVO) dto;//Param UserVO
		StringBuilder  sb=new StringBuilder();
		sb.append(" SELECT													\n");
		sb.append("     nb_no,                                              \n");
		sb.append("     nb_category,                                        \n");
		sb.append("     nb_title,                                           \n");
		sb.append("     nb_contents,                                        \n");
		sb.append("     notice_yn,                                          \n");
		sb.append("     popup_yn,                                           \n");
		sb.append("     file_id,                                            \n");
		sb.append("     read_cnt,                                           \n");
		sb.append("     reg_id,                                             \n");
		sb.append("     mod_id,                                             \n");
		sb.append("     TO_CHAR(reg_date,'YYYY/MM/DD HH24MISS') reg_date,   \n");
		sb.append("     TO_CHAR(mod_date,'YYYY/MM/DD HH24MISS') mod_date    \n");
		sb.append(" FROM noticeboard                                        \n");
		sb.append(" WHERE nb_no = ?                                         \n");
		
		//Query수행
		LOG.debug("==============================");
		LOG.debug("=Query=\n"+sb.toString());
		LOG.debug("=Param=\n"+inVO.getNbNo());
		
		Object []args = {inVO.getNbNo()};
		outVO = this.jdbcTemplate.queryForObject(sb.toString()
				,args
				,rowMapper); 
		LOG.debug("=outVO=\n"+outVO);
		LOG.debug("==============================");
		
		return outVO;
	}

	@Override
	public int doDelete(DTO dto) {
		int flag = 0;
		NBoardVO inVO = (NBoardVO) dto;
		StringBuilder  sb=new StringBuilder();
		sb.append(" DELETE FROM noticeboard \n");
		sb.append(" WHERE nb_no = ?         \n");
		LOG.debug("==============================");
		LOG.debug("=Query=\n"+sb.toString());
		LOG.debug("=Param="+inVO);
		
		Object[] args = {inVO.getNbNo()};
		flag = jdbcTemplate.update(sb.toString(), args);
		
		LOG.debug("=flag="+flag);		
		LOG.debug("==============================");	
		return flag;
	}
	
	//전체 삭제
	public void doDeleteAll() {
		int flag = 0;
		StringBuilder  sb=new StringBuilder();
		sb.append(" DELETE FROM noticeboard \n");
		
		LOG.debug("==============================");
		LOG.debug("=Query=\n"+sb.toString());
		
		flag = jdbcTemplate.update(sb.toString());
		
		LOG.debug("=flag="+flag);		
		LOG.debug("==============================");	
	}
	
	public DTO doSelectOneTitle(DTO dto) {
		NBoardVO outVO = null;        //return UserVO
		NBoardVO inVO  = (NBoardVO) dto;//Param UserVO
		StringBuilder  sb=new StringBuilder();
		sb.append("SELECT												 \n");
		sb.append("    nb_no,                                            \n");
		sb.append("    nb_category,                                      \n");
		sb.append("    nb_title,                                         \n");
		sb.append("    nb_contents,                                      \n");
		sb.append("    notice_yn,                                        \n");
		sb.append("    popup_yn,                                         \n");
		sb.append("    file_id,                                          \n");
		sb.append("    read_cnt,                                         \n");
		sb.append("    reg_id,                                           \n");
		sb.append("    mod_id,                                           \n");
		sb.append("    TO_CHAR(reg_date,'YYYY/MM/DD HH24MISS') reg_date, \n");
		sb.append("    TO_CHAR(mod_date,'YYYY/MM/DD HH24MISS') mod_date  \n");
		sb.append("FROM noticeboard                                      \n");
		sb.append("WHERE nb_title like  '%' || ? || '%'                  \n");
		
		//Query수행
		LOG.debug("==============================");
		LOG.debug("=Query=\n"+sb.toString());
		LOG.debug("=Param=\n"+inVO.getNbTitle());
		
		Object []args = {inVO.getNbTitle()};
		outVO = this.jdbcTemplate.queryForObject(sb.toString()
				,args
				,rowMapper); 
		LOG.debug("=outVO=\n"+outVO);
		LOG.debug("==============================");
	
		return outVO;
	}
	

	@Override
	public List<?> doRetrieve(DTO dto) {
		SearchVO  inVO= (SearchVO) dto;
		//검색구분
		  //ID : 10
		  //이름: 20
		//검색어
		StringBuilder whereSb=new StringBuilder();
		
		if(null !=inVO && !"".equals(inVO.getSearchDiv())) {
			if(inVO.getSearchDiv().equals("10")) {
				whereSb.append("AND nb_title like '%' || ? ||'%'   \n");
				
			}else if(inVO.getSearchDiv().equals("20")) {
				whereSb.append("AND nb_contents like '%' || ? ||'%'   \n");
			}
		}
		
		StringBuilder sb=new StringBuilder();
		sb.append("SELECT T1.*,T2.* 																	\n");
		sb.append("FROM(                                                                                \n");
		sb.append("    SELECT                                                                           \n");
		sb.append("           B.nb_no,                                                                  \n");
		sb.append("           B.nb_category,                                                            \n");
		sb.append("           B.nb_title,                                                               \n");
		sb.append("           B.nb_contents,                                                            \n");
		sb.append("           B.notice_yn,                                                              \n");
		sb.append("           B.popup_yn,                                                               \n");
		sb.append("           B.file_id,                                                                \n");
		sb.append("           B.read_cnt,                                                               \n");
		sb.append("           B.reg_id,                                                                 \n");
		sb.append("           B.mod_id,                                                                 \n");
		sb.append("           CASE TO_CHAR(B.reg_date,'YYYY/MM/DD') WHEN TO_CHAR(SYSDATE,'YYYY/MM/DD')  \n");
		sb.append("                                               THEN TO_CHAR(SYSDATE,'HH24:MI')       \n");
		sb.append("           ELSE TO_CHAR(B.reg_date,'YYYY/MM/DD') END reg_date,                       \n");
		sb.append("           CASE TO_CHAR(B.mod_date,'YYYY/MM/DD') WHEN TO_CHAR(SYSDATE,'YYYY/MM/DD')  \n");
		sb.append("                                               THEN TO_CHAR(SYSDATE,'HH24:MI')       \n");
		sb.append("           ELSE TO_CHAR(B.mod_date,'YYYY/MM/DD') END mod_date                        \n");
		sb.append("    FROM(                                                                            \n");
		sb.append("        SELECT ROWNUM AS rnum,A.*                                                    \n");
		sb.append("        FROM (                                                                       \n");
		sb.append("            SELECT *                                                                 \n");
		sb.append("            FROM noticeboard                                                         \n");
		sb.append("            WHERE 1=1                                                                \n");
//		sb.append("            --검색조건                                                                  \n");
		//--검색----------------------------------------------------------------------
		sb.append(whereSb.toString());
		//--검색----------------------------------------------------------------------
		sb.append("            ORDER BY reg_date desc                                                   \n");
		sb.append("        )A                                                                           \n");
		sb.append("        WHERE ROWNUM <=10                                                            \n");
		sb.append("    )B                                                                               \n");
		sb.append("    WHERE rnum >=1)T1                                                                \n");
		sb.append("NATURAL JOIN                                                                         \n");
		sb.append("		(                                                                               \n");
		sb.append("		    SELECT COUNT(*) total_cnt                                                   \n");
		sb.append("		    FROM noticeboard                                                            \n");
		sb.append("		    WHERE 1=1                                                                   \n");
//		sb.append("		    --검색조건                                                                     \n");
		//--검색----------------------------------------------------------------------
		sb.append(whereSb.toString());
		//--검색----------------------------------------------------------------------
		sb.append("		)T2                                                                             \n");
		
		//param 
		List<Object> listArg = new ArrayList<Object>();
		
		//param set
		if(null !=inVO && !"".equals(inVO.getSearchDiv())) {
			listArg.add(inVO.getSearchWord());
//			listArg.add(inVO.getPageSize());
//			listArg.add(inVO.getPageNum());
//			listArg.add(inVO.getPageSize());
//			listArg.add(inVO.getPageSize());
//			listArg.add(inVO.getPageNum());				
			listArg.add(inVO.getSearchWord());
//
		}
//		}else {
//			listArg.add(inVO.getPageSize());
//			listArg.add(inVO.getPageNum());
//			listArg.add(inVO.getPageSize());
//			listArg.add(inVO.getPageSize());
//			listArg.add(inVO.getPageNum());			
//		}
		
		List<NBoardVO> retList = this.jdbcTemplate.query(sb.toString(), listArg.toArray(),rowMapper);
		LOG.debug("--- query \n" + sb.toString());
		LOG.debug("--- param " + listArg);
		
		
		return retList;
	}

	@Override
	public List<?> getAll(DTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

}
