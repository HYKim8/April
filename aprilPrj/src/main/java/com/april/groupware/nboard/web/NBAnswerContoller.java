package com.april.groupware.nboard.web;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.april.groupware.cmn.MessageVO;
import com.april.groupware.cmn.SearchVO;
import com.april.groupware.cmn.StringUtil;
import com.april.groupware.code.service.CodeService;
import com.april.groupware.code.service.CodeVO;
import com.april.groupware.nboard.service.NBAnswerService;
import com.april.groupware.nboard.service.NBAnswerVO;
import com.april.groupware.nboard.service.NBoardService;
import com.april.groupware.nboard.service.NBoardVO;
import com.google.gson.Gson;


@Controller
public class NBAnswerContoller {
	Logger  LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	NBAnswerService boardService;
	
	@Autowired
	CodeService codeService;
	
	@Autowired
	MessageSource messageSource;
	
	//목록조회
	@RequestMapping(value = "nbAnswer/do_retrieve.do",method = RequestMethod.GET)
	public String doRetrieve(SearchVO  search,Model model) {
		//param 기본값 처리
		if(search.getPageNum()==0) {
			search.setPageNum(1);
		}
		
		if(search.getPageSize()==0) {
			search.setPageSize(10);
		}
		
		LOG.debug("1=====NBAnswerContoller=doRetrieve===========");
		LOG.debug("1=param="+search);
		LOG.debug("1=================");
		//검색조건 화면으로 전달.
		model.addAttribute("vo", search);
		//TODO: codeTable : 페이지 사이즈
		
		//페이지 사이즈: PAGE_SIZE
		CodeVO  code=new CodeVO();
		code.setCodeTypeId("PAGE_SIZE");
		List<CodeVO> pageSizeList=(List<CodeVO>) this.codeService.doRetrieve(code);
		LOG.debug("1.1=pageSizeList="+pageSizeList);
		model.addAttribute("pageSizeList", pageSizeList);
		
		
		List<NBAnswerVO> list = (List<NBAnswerVO>) this.boardService.doRetrieve(search);
		//조회결과 화면 전달
		model.addAttribute("list", list);
		for(NBAnswerVO vo:list) {
			LOG.debug("1.1=out="+vo);
		}
		
		//총건수
		int totalCnt = 0;
		if(null !=list &&  list.size()>0) {
			totalCnt = list.get(0).getTotalCnt();
		}
		
		LOG.debug("1.2======NBAnswerContoller=doRetrieve===========");
		LOG.debug("1.2=totalCnt="+totalCnt);
		LOG.debug("1.2=================");
		//조회결과 화면 전달
		model.addAttribute("totalCnt", totalCnt);
		return "views/nboard_read";// "/views/nboard_read.jsp
	}
	
	
	//삭제
	@RequestMapping(value = "nbAnswer/do_delete.do",method = RequestMethod.POST
			,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(NBAnswerVO  board,Locale locale) {
		//param board_id
		LOG.debug("1======NBoardContoller==doDelete=========");
		LOG.debug("1=param="+board);
		LOG.debug("1=================");
		
		if( 0 == board.getNbNo()) {		

			throw new IllegalArgumentException("nbNo를 확인 하세요.");			
		}	
		if( 0 == board.getAwNo()) {		

			throw new IllegalArgumentException("awNo를 확인 하세요.");			
		}
		
		int flag = this.boardService.doDelete(board);
		MessageVO message=new MessageVO();
		//삭제 성공
		if(flag>0) {
			message.setMsgId(String.valueOf(flag));
			message.setMsgMsg("삭제 되었습니다.");
		//실패	
		}else {
			message.setMsgId(String.valueOf(flag));
			message.setMsgMsg("삭제 실패.");			
		}
		
		Gson gson=new Gson();
		String gsonStr = gson.toJson(message);
		
		LOG.debug("1======NBoardContoller==doDelete=========");
		LOG.debug("1=gsonStr="+gsonStr);
		LOG.debug("1=================");	
		
		
		return gsonStr;
	}
	
	
	//등록
	@RequestMapping(value = "nbAnswer/do_insert.do",method = RequestMethod.POST
			,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doInsert(NBAnswerVO nboard,Locale locale) {
		LOG.debug("1====NBoardContoller=doInsert============");
		LOG.debug("1=param="+nboard);
		LOG.debug("1=================");
		
		int flag = this.boardService.doInsert(nboard);
		
		MessageVO message=new MessageVO();
		
		if(flag>0) {
			message.setMsgId(String.valueOf(flag));
			message.setMsgMsg("등록 성공.");
		}else {
			message.setMsgId(String.valueOf(flag));
			message.setMsgMsg("등록 실패.");			
		}
		
		Gson gson=new Gson();
		String jsonStr = gson.toJson(message);
		LOG.debug("1.2====NBoardContoller=doInsert============");
		LOG.debug("1.2=jsonStr="+jsonStr);
		LOG.debug("1.2=================");		
		return jsonStr;
	}
}
