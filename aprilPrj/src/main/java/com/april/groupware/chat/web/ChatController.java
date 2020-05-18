package com.april.groupware.chat.web;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.april.groupware.chat.service.ChatService;
import com.april.groupware.chat.service.ChatVO;
import com.april.groupware.cmn.SearchVO;
import com.april.groupware.cmn.StringUtil;

@Controller
public class ChatController {

	Logger  LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ChatService chatService;
	
	@RequestMapping(value = "chat/do_retrieve.do",method = RequestMethod.GET)
	public String doRetrieve(SearchVO search, Model model) {
		if(search.getPageNum()==0) {
			search.setPageNum(1);
		}
		
		if(search.getPageSize()==0) {
			search.setPageSize(10);
		}
		
		search.setSearchDiv(StringUtil.nvl(search.getSearchDiv()));
		search.setSearchWord(StringUtil.nvl(search.getSearchWord().trim()));

		LOG.debug("1=================");
		LOG.debug("1=param="+search);
		LOG.debug("1=================");
		
		//페이지 사이즈: PAGE_SIZE
		//화면에서 페이즈 사이즈 받아와서 searchVO에 넣어주고
		//값이없으면 default값 하나 지정해두고
		//지정된 버튼 가저오고

		//검색조건 화면으로 전달.
		model.addAttribute("vo", search);
		//TODO: codeTable : 검색조건,페이지 사이즈

		
		List<ChatVO> list = (List<ChatVO>) this.chatService.doRetrieve(search);
		//조회결과 화면 전달
		model.addAttribute("list", list);
		for(ChatVO vo:list) {
			LOG.debug("1.1=out="+vo);
		}
		
		//총건수
		int totalCnt = 0;
		if(null !=list &&  list.size()>0) {
			totalCnt = list.get(0).getTotalCnt();
		}
		
		LOG.debug("1.2=================");
		LOG.debug("1.2=totalCnt="+totalCnt);
		LOG.debug("1.2=================");
		//조회결과 화면 전달
		model.addAttribute("totalCnt", totalCnt);
		return "chat/user_list";// /board/board_list.jsp
	
		
		
	}
	
	
	
	@RequestMapping(value = "chat/do_selectone.do",method = RequestMethod.GET)
	public String doSelectOne(ChatVO user,Locale locale,Model model) {
	
		//param board_id
		LOG.debug("1=================");
		LOG.debug("1=param="+user);
		LOG.debug("1=================");
		
//		user.setId("kim56");
		
//		if( null == user.getId()) {		
//
//			throw new IllegalArgumentException("사용자 ID를 확인 하세요.");			
//		}
		
		ChatVO outVO =(ChatVO) this.chatService.doSelectOne(user);
		LOG.debug("1.1.=================");
		LOG.debug("1.1=outVO="+outVO);
		LOG.debug("1.1=================");	
		model.addAttribute("vo", outVO);
		
		//여기에 자동으로 /+
		return "views/chat_mng"; //원하는 채팅 화면으로 이동 jsp경로라거나 아니면 controller 
	
	}
	
	
	
	
}

