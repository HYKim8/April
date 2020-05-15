package com.april.groupware.mail.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.april.groupware.cmn.MessageVO;
import com.april.groupware.mail.service.MailService;
import com.april.groupware.mail.service.MailVO;
import com.google.gson.Gson;

@Controller
public class MailController {

	Logger  LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MailService mailService;
	
	@RequestMapping(value = "mail/do_insert.do",method = RequestMethod.POST
			,produces = "application/json; charset=UTF-8")
	@ResponseBody 
	public String doInsert(MailVO mail) {
		LOG.debug("=====MailController [doInsert] Start=====");
		
		LOG.debug("** param : "+mail);
		
		int flag = this.mailService.doInsert(mail);
		
		MessageVO message=new MessageVO();
		
		if(flag>0) {
			message.setMsgId(String.valueOf(flag));
			message.setMsgMsg("메일 전송 성공.");
		}else {
			message.setMsgId(String.valueOf(flag));
			message.setMsgMsg("메일 전송 실패.");			
		}
		
		Gson gson=new Gson();
		String jsonStr = gson.toJson(message);
		LOG.debug("** jsonStr"+jsonStr);
		
		LOG.debug("=====MailController [doInsert] End=====");
		
		return jsonStr;
		
		
	}
	
	
}














