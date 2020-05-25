package com.april.groupware.dash;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

import com.april.groupware.dash.service.DashTodoDao;
import com.april.groupware.dash.service.DashTodoService;
import com.april.groupware.dash.service.DashTodoVO;



@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		                           "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
                                   })
public class TestDashTodoDao {

	private final Logger  LOG = LoggerFactory.getLogger(TestDashTodoDao.class);
	
	@Autowired
	WebApplicationContext  webApplicationContext;

	DashTodoVO dashTodoVO01;
	DashTodoVO dashTodoVO02;
	DashTodoVO dashTodoVO03;
	DashTodoVO dashTodoVO04;	
	
	@Autowired
	
	DashTodoService  dao;
	

	
	
	@Before
	public void setUp() throws Exception {
		LOG.debug("^^^^^^^^^^^");
		LOG.debug("^WebApplicationContext^"+webApplicationContext);
		LOG.debug("^^^^^^^^^^^");
		dashTodoVO01=new DashTodoVO("kimjh","운영","기술지원","main","그룹웨어구축","삼성SDS","부산","외근","김주희","김주희","20/05/19","20/05/21");
		
	}
	
	
	@Test
	public void doSelectOne() {
		DashTodoVO dashTodoVO = (DashTodoVO) dao.doSelectOne(dashTodoVO01);
		LOG.debug("★dashTodoVO: "+ dashTodoVO);
	}

	@After
	public void tearDown() throws Exception {
		LOG.debug("^^^^^^^^^^^");
		LOG.debug("^tearDown^");
		LOG.debug("^^^^^^^^^^^");		
	}
			
	
	@Test
	@Ignore
	public void test() {
		LOG.debug("=====================");
		LOG.debug("=test()=");
		LOG.debug("=====================");
		
		
		LOG.debug("=====================");
		LOG.debug("=dao()="+dao);
		LOG.debug("=====================");		
		
		assertNotNull(dao);
		assertThat(1, is(1));
		
	}
	

}
