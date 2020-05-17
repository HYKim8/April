package com.april.groupware.nboard;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;

import com.april.groupware.nboard.service.NBoardService;
import com.april.groupware.nboard.service.NBoardVO;
import com.april.groupware.nboard.service.imple.NBoardDaoImple;
import com.google.gson.Gson;


@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		                           "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
                                   })
public class TestNBoardController {

	private final Logger  LOG = LoggerFactory.getLogger(TestNBoardController.class);
	
	@Autowired
	WebApplicationContext  webApplicationContext;
	
	private List<NBoardVO> boardList;
	
	@Autowired
	NBoardService  boardService;
	
	@Autowired
	NBoardDaoImple  dao;
	
	 
	//브라우저 대신 Mock
	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		LOG.debug("*********************");
		LOG.debug("=setUp()=");
		LOG.debug("*********************");
		
		/*
		nboardList = Arrays.asList(
				 new NBoardVO(1,"J01_제목_124",0,"J01_내용","jamesol01@paran.com","NO_DATE")
				,new BoardVO(2,"J02_제목_124",0,"J02_내용","jamesol02@paran.com","NO_DATE")					
				,new BoardVO(3,"J03_제목_124",0,"J03_내용","jamesol03@paran.com","NO_DATE")
				);
				*/
				
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
		LOG.debug("=====================");
		LOG.debug("=webApplicationContext="+webApplicationContext);
		LOG.debug("=mockMvc="+mockMvc);
		
		LOG.debug("=====================");		

	}
	
	@Test
	public void doRetrieve()  throws Exception {
		//1.전체삭제
		//2.3건입력
		//3.조회
	
		
	}
	
	@Test
	@Ignore
	public void doUpdate() throws Exception {
		//1.전체 삭제
		//2.단건입력
		//3.단건조회:board_id조회
		//3.1.단건수정
		//4.수정
		//5.수정데이터 조회
		//6.비교 
		
	}
	
	@Test
	@Ignore
	public void doDelete() throws Exception {
		//1.전체 삭제
		//2.단건입력
		//3.단건조회:board_id조회
		//4.삭제
		  		
				
	}
	
	//단건조회
	@Test
	@Ignore
	public void doSelectOne() throws Exception {
		 		

	}
	
	@Test
	@Ignore
	public void add() throws Exception {
		dao.doDeleteAll();
		
		MockHttpServletRequestBuilder createMessage = 
				MockMvcRequestBuilders.post("/nboard/do_insert.do")
				.param("nbTitle", boardList.get(0).getNbTitle())
				.param("nbContents", boardList.get(0).getNbContents())
				.param("regId", boardList.get(0).getRegId())
				;
		
		ResultActions  resultActions =mockMvc.perform(createMessage)
				       .andExpect(MockMvcResultMatchers.content().contentType("application/json;charset=UTF-8"))
				       .andExpect(MockMvcResultMatchers.jsonPath("$.msgId", is("1")))
				;
		String result = resultActions.andDo(print())
						.andReturn()
						.getResponse().getContentAsString();
		LOG.debug("=====================");
		LOG.debug("=result="+result);
		LOG.debug("=====================");  
		
		NBoardVO titleVO = (NBoardVO) dao.doSelectOneTitle(boardList.get(0));
		NBoardVO vsVO = (NBoardVO) dao.doSelectOne(titleVO);
		checkSameUser(vsVO,boardList.get(0));
	}
	
	public void checkSameUser(NBoardVO orgVO, NBoardVO vsVO) {
		//assertTrue(orgVO.equals(vsVO));
		assertThat(orgVO.getNbTitle(), is(vsVO.getNbTitle()));
		assertThat(orgVO.getNbContents(), is(vsVO.getNbContents()));
		assertThat(orgVO.getRegId(), is(vsVO.getRegId()));
	}
	
	@Test
	public void test() {
		LOG.debug("=====================");
		LOG.debug("=test()=");
		LOG.debug("=====================");
		
		LOG.debug("=====================");
		LOG.debug("=boardService="+boardService);
		LOG.debug("=dao="+dao);
		LOG.debug("=====================");		
		assertNotNull(boardService);
		assertNotNull(dao);
		assertThat(1, is(1));
	
	}
	
	
	

	

}
