package com.april.groupware.dash.web;


import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.april.groupware.dash.service.DashTodoService;
import com.april.groupware.dash.service.DashTodoVO;

@Controller
public class DashController {

	Logger  LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	DashTodoService dashTodoService;
	
	@RequestMapping(value = "dash/do_selectone.do",method = RequestMethod.GET)
	public String doSelectOne(DashTodoVO dashTodoVO,Locale locale,Model model) {
		//param board_id
		LOG.debug("1=================");
		LOG.debug("1=param="+dashTodoVO);

		dashTodoVO.setDeptNm("인사");
		DashTodoVO  hrVO =(DashTodoVO) this.dashTodoService.doSelectOne(dashTodoVO);
		
		dashTodoVO.setDeptNm("영업");
		DashTodoVO  salseVO =(DashTodoVO) this.dashTodoService.doSelectOne(dashTodoVO);
		
		dashTodoVO.setDeptNm("운영");
		DashTodoVO  operVO =(DashTodoVO) this.dashTodoService.doSelectOne(dashTodoVO);
		
		dashTodoVO.setDeptNm("개발");
		DashTodoVO  devVO =(DashTodoVO) this.dashTodoService.doSelectOne(dashTodoVO);
		
		LOG.debug("1.1.=================");
		LOG.debug("1.1=hrVO="+hrVO);
		LOG.debug("1.1=salseVO="+salseVO);
		LOG.debug("1.1=operVO="+operVO);
		LOG.debug("1.1=devVO="+devVO);
		
		LOG.debug("1.1=================");	
		
		model.addAttribute("hrVO", hrVO);
		model.addAttribute("salseVO", salseVO);
		model.addAttribute("operVO", operVO);
		model.addAttribute("devVO", devVO);
		
		
		return "views/admin_dashboard";
	}
	
}














