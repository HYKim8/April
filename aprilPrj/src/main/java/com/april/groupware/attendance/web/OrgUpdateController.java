package com.april.groupware.attendance.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.april.groupware.attendance.service.OrgUpdateDao;
import com.april.groupware.cmn.MessageVO;
import com.april.groupware.org.service.OrgVO;
import com.google.gson.Gson;

@Controller
public class OrgUpdateController {
	private final Logger LOG = LoggerFactory.getLogger(OrgUpdateController.class);
	
	@Autowired
	OrgUpdateDao orgUpdateDao;
	
	
}
