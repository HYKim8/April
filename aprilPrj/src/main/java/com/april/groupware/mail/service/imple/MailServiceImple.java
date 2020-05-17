package com.april.groupware.mail.service.imple;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.april.groupware.cmn.DTO;
import com.april.groupware.mail.service.MailDao;
import com.april.groupware.mail.service.MailService;
import com.april.groupware.mail.service.MailVO;

@Service
public class MailServiceImple implements MailService {

	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	public MailServiceImple() {}
	
	@Autowired
	private MailDao mailDao;
	
	@Override
	public int doInsert(DTO dto) {
		
		MailVO inVO = (MailVO) dto;
		
		String[] recipient = inVO.getRecipient().split(",");
		
		int flag = 0;
		LOG.debug("=====MailServiceImple [doInsert] Start=====");
		
		if(recipient.length == 1 && recipient.length != 0) {//참조 없을 때
			inVO = (MailVO) doSelectUserId(inVO);
			flag = mailDao.doInsert(inVO);
			LOG.debug("** receiver.length : "+ recipient.length);
			
		}else if(recipient.length != 0 && recipient.length > 1) {//참조 있을 때
			
			int length = recipient.length;
			LOG.debug("** receiver.length : "+ length);
			
			for(int i=0;i<length;i++) {
				inVO.setRecipient(recipient[i]);
				inVO = (MailVO) doSelectUserId(inVO);
				flag += mailDao.doInsert(inVO);
			}
		}
		LOG.debug("** flag : "+flag);
		
		LOG.debug("=====MailServiceImple [doInsert] End=====");
		
		return flag;
	}

	@Override
	public int doUpdate(DTO dto) {
		return 0;
	}

	@Override
	public DTO doSelectOne(DTO dto) {
		return mailDao.doSelectOne(dto);
	}

	@Override
	public DTO doSelectUserId(DTO dto) {
		return mailDao.doSelectUserId(dto);
	}
	
	@Override
	public int doDelete(DTO dto) {
		return 0;
	}

	@Override
	public List<?> doRetrieve(DTO dto) {
		return null;
	}

	

}