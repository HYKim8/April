package com.april.groupware.mail.service;

import java.util.List;

import com.april.groupware.cmn.DTO;


public interface MailService {

	/**
	 * 등록
	 * @param dto
	 * @return int
	 */
	public int doInsert(DTO dto);
	/**
	 * 수정   
	 * @param dto
	 * @return int
	 */
	public int doUpdate(DTO dto);
	
	/**
	 * disable 수정   
	 * @param dto
	 * @return int
	 */
	public int doUpdateDisable(DTO dto);
	
	/**
	 * read 수정   
	 * @param dto
	 * @return int
	 */
	public int doUpdateRead(DTO dto);
	
	/**
	 * 단건조회
	 * @param dto
	 * @return DTO
	 */
	public DTO doSelectOne(DTO dto);
	
	/**
	 * ORGANIZATION 테이블에서 Id 조회
	 * @param dto
	 * @return
	 */
	public DTO doSelectUserId(DTO dto);
	
	/**
	 * 삭제
	 * @param dto
	 * @return int
	 */
	public int doDelete(DTO dto);
	
	/**
	 * 목록조회
	 * @param dto
	 * @return
	 */
	public List<?> doRetrieve(DTO dto);
	

}