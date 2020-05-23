package com.april.groupware.chat.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.april.groupware.chat.service.ChatService;
import com.april.groupware.chat.service.ChatVO;
import com.april.groupware.cmn.SearchVO;
import com.april.groupware.cmn.StringUtil;
import com.april.groupware.code.service.CodeService;
import com.april.groupware.code.service.CodeVO;

@Controller
public class ChatController {

	Logger  LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	CodeService codeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String chat(Locale locale, Model model) {
		LOG.debug("~환영~ 채팅방 좀 열려라 시발 ~ {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
	
		return "views/chatchat";
	}
	
	
	
	@RequestMapping(value = "chat/do_retrieve.do",method = RequestMethod.GET)
	public String doRetrieve(SearchVO search, Model model) {
		if(search.getPageNum()==0) {
			search.setPageNum(1);
		}
		
		if(search.getPageSize()==0) {
			search.setPageSize(10);
		}
		
		search.setSearchDiv(StringUtil.nvl(search.getSearchDiv()));
		search.setSearchWord(StringUtil.nvl(search .getSearchWord().trim()));

		LOG.debug("1=================");
		LOG.debug("1=param="+search);
		LOG.debug("1=================");
		//검색조건 화면으로 전달.
		model.addAttribute("vo", search);
		
		//TODO: codeTable : 검색조건,페이지 사이즈
		//검색조건
		CodeVO code=new CodeVO();
		code.setCodeTypeId("CHAT_SEARCH");
		List<CodeVO> searchList=(List<CodeVO>) this.codeService.doRetrieve(code);
		LOG.debug("1.1=searchList="+searchList);
		model.addAttribute("searchList", searchList);
		
		//페이지 사이즈: PAGE_SIZE
		code.setCodeTypeId("PAGE_SIZE");
		List<CodeVO> pageSizeList=(List<CodeVO>) this.codeService.doRetrieve(code);
		LOG.debug("1.1=pageSizeList="+pageSizeList);
		model.addAttribute("pageSizeList", pageSizeList);
		
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
		return "views/chat_list";// /board/board_list.jsp
	
	}
	
	
	
	@RequestMapping(value = "chat/do_selectone.do",method = RequestMethod.GET)
	public String doSelectOne(ChatVO user,Locale locale,Model model) {

		//param board_id
		LOG.debug("1=================");
		LOG.debug("1=param="+user);
		LOG.debug("1=================");
		
//		if( null == user.getId()) {		
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

