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
import com.april.groupware.nboard.service.NBoardService;
import com.april.groupware.nboard.service.NBoardVO;
import com.google.gson.Gson;


@Controller
public class NBoardContoller {
Logger  LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	NBoardService boardService;
	
	@Autowired
	CodeService codeService;
	
	@Autowired
	MessageSource messageSource;
	
	//목록조회
	@RequestMapping(value = "nboard/do_retrieve.do",method = RequestMethod.GET)
	public String doRetrieve(SearchVO  search,Model model) {
		//param 기본값 처리
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
		//검색조건 화면으로 전달.
		model.addAttribute("vo", search);
		//TODO: codeTable : 검색조건,페이지 사이즈
		//검색조건
		CodeVO  code=new CodeVO();
		code.setCodeTypeId("BOARD_SEARCH");
		List<CodeVO> searchList=(List<CodeVO>) this.codeService.doRetrieve(code);
		LOG.debug("1.1=searchList="+searchList);
		model.addAttribute("searchList", searchList);
		
		//페이지 사이즈: PAGE_SIZE
		code.setCodeTypeId("PAGE_SIZE");
		List<CodeVO> pageSizeList=(List<CodeVO>) this.codeService.doRetrieve(code);
		LOG.debug("1.1=pageSizeList="+pageSizeList);
		model.addAttribute("pageSizeList", pageSizeList);
		
		
		List<NBoardVO> list = (List<NBoardVO>) this.boardService.doRetrieve(search);
		//조회결과 화면 전달
		model.addAttribute("list", list);
		for(NBoardVO vo:list) {
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
		return "views/nboard_list";// "/board/board_list.jsp
	}
	
	//수정
	@RequestMapping(value = "nboard/do_update.do",method = RequestMethod.POST
			,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doUpdate(NBoardVO  board,Locale locale) {
		LOG.debug("1=================");
		LOG.debug("1=param="+board);
		LOG.debug("1=================");
				
		if( 0 == board.getNbNo()) {		

			throw new IllegalArgumentException("nbNo를 확인 하세요.");			
		}
		
		int flag = this.boardService.doUpdate(board);
		
		MessageVO message=new MessageVO();
		
		if(flag>0) {
			message.setMsgId(String.valueOf(flag));
			message.setMsgMsg("수정 성공.");
		}else {
			message.setMsgId(String.valueOf(flag));
			message.setMsgMsg("수정 실패.");			
		}
		
		Gson gson=new Gson();
		String jsonStr = gson.toJson(message);
		LOG.debug("1.2=================");
		LOG.debug("1.2=jsonStr="+jsonStr);
		LOG.debug("1.2=================");		
		return jsonStr;
	}
	
	//삭제
	@RequestMapping(value = "nboard/do_delete.do",method = RequestMethod.POST
			,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(NBoardVO  board,Locale locale) {
		//param board_id
		LOG.debug("1=================");
		LOG.debug("1=param="+board);
		LOG.debug("1=================");
		
		if( 0 == board.getNbNo()) {		

			throw new IllegalArgumentException("nbNo를 확인 하세요.");			
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
		
		LOG.debug("1=================");
		LOG.debug("1=gsonStr="+gsonStr);
		LOG.debug("1=================");	
		
		
		return gsonStr;
	}
	
	//단건조회
	@RequestMapping(value = "nboard/do_selectone.do",method = RequestMethod.GET)
	public String doSelectOne(NBoardVO  board,Locale locale,Model model) {
		//param NbNo
		LOG.debug("1=================");
		LOG.debug("1=param="+board);
		LOG.debug("1=================");
		
		if( 0 == board.getNbNo()) {		

			throw new IllegalArgumentException("nbNo를 확인 하세요.");			
		}
		
		NBoardVO  outVO =(NBoardVO) this.boardService.doSelectOne(board);
		LOG.debug("1.1.=================");
		LOG.debug("1.1=outVO="+outVO);
		LOG.debug("1.1=================");	
		model.addAttribute("vo", outVO);
		
		return "views/nboard_read"; // views/nboard_read.jsp
	}
	
	//등록화면으로 이동
//	@RequestMapping(value = "nboard/do_insert_view.do",method = RequestMethod.GET)
//	public String doInsertView(Locale locale) {
//		
//		LOG.debug("1=================");
//		LOG.debug("1=views/nboard_write");
//		LOG.debug("1=================");
//		return "views/nboard_write";
//	}
	
	//등록
	@RequestMapping(value = "nboard/do_insert.do",method = RequestMethod.POST
			,produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String doInsert(NBoardVO nboard,Locale locale) {
		LOG.debug("1=================");
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
		LOG.debug("1.2=================");
		LOG.debug("1.2=jsonStr="+jsonStr);
		LOG.debug("1.2=================");		
		return jsonStr;
	}
}
