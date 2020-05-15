/**
 * <pre>
 * com.april.groupware
 * Class Name : TestUserUpdateDao.java
 * Description : 
 * Modification Information
 * 
 * 수정일         수정자        수정내용
 * ------------ ----------- -------------------------------
 * 2020-05-02           최초생성
 *
 * @author 쌍용교육센터 E반 April
 * @since 2020-05-02 
 * @version 1.0
 * 
 *  Copyright (C) by April All right reserved.
 * </pre>
 */
package com.april.groupware.mail;

import static org.hamcrest.CoreMatchers.is;
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

import com.april.groupware.mail.service.MailService;
import com.april.groupware.mail.service.MailVO;

/**
 * @author MINJI
 *
 */
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class TestMailService {
	private final Logger LOG = LoggerFactory.getLogger(TestMailService.class);

	@Autowired
	WebApplicationContext webApplicationContext;

	@Autowired
	MailService mailService;

	// 참조 없는 거
	MailVO mail01;
	MailVO mail02;

	// 참조 있는 거
	MailVO mail03;
	MailVO mail04;

	/**
	 * Method Name:setUp 작성일: 2020. 5. 8. 작성자: MINJI 설명:
	 * 
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		LOG.debug("======================");
		LOG.debug("WebApplicationContext : " + webApplicationContext);
		LOG.debug("======================");

//		String mailId, String category, String sender, String senderId, String senDate, String title,
//		String fileId, String contents, String receiver, String receiverId, String recDate, String disableYn,
//		String read

		// 참조 없는 메일
		mail01 = new MailVO("", "mail", "김민지", "kimmj", "", "제목01", "", "내용01", "홍길동01", "", "", "N", "0");
		mail02 = new MailVO("", "mail", "김민지", "kimmj", "", "제목02", "", "내용02", "홍길동02", "", "", "N", "0");
		// 참조 있는 메일
		mail03 = new MailVO("", "mail", "김민지", "kimmj", "", "제목03", "", "내용03", "홍길동01,홍길동02", "", "", "N",
				"0");
		mail04 = new MailVO("", "mail", "김민지", "kimmj", "", "제목04", "", "내용04", "홍길동01,홍길동02,홍길동03", "",
				"", "N", "0");

	}

	/**
	 * Method Name:tearDown 작성일: 2020. 5. 8. 작성자: MINJI 설명:
	 * 
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	/**
	 * Method Name : doInsert 작성일: 2020. 5. 14. 작성자: MINJI 설명: 메일 보내기 클릭 시 doInsert
	 * 
	 * @throws java.lang.Exception
	 */
	@Test
	//@Ignore
	public void doInsert() {
		// -----------------------------------
		// 1. 모두삭제 (이건 나중에 doDelete 만들고 나서)
		// 2. 등록
		// 3. 값 확인
		// -----------------------------------

		// 2. 등록
		int flag = this.mailService.doInsert(mail01);
		flag += this.mailService.doInsert(mail02);
		flag += this.mailService.doInsert(mail03);
		flag += this.mailService.doInsert(mail04);

//		int flag = this.mailRecService.doInsert(mail01);
//		flag += this.mailRecService.doInsert(mail02);
//		flag += this.mailRecService.doInsert(mail03);
//		flag += this.mailRecService.doInsert(mail04);

		// 3. 값 확인
		assertThat(flag, is(7));
	}

	/**
	 * Method Name : doSelectOne 작성일: 2020. 5. 8. 작성자: MINJI 설명: 메일 단건 조회 (List에서
	 * 클릭했을 시)
	 * 
	 * @throws java.lang.Exception
	 */
	@Test
	@Ignore
	public void doSelectOne() {
		// MailRecipientVO inVO = new
		// MailRecipientVO("M200508_01","","이상무","leesm","","","","","M200508_01_R1","홍길동","honggd","","","0");
//		MailVO inVO = new MailVO("","","김민지","kimmj","","","","","정진우","jungjw","","","0");
//		MailVO outVO = (MailVO) this.mailService.doSelectOne(inVO);
//		LOG.debug("=================Test doSelectOne Start===================");
//		LOG.debug("=outVO="+outVO);
//		LOG.debug("=================Test doSelectOne End===================");

	}

	/**
	 * Method Name : doDelete 작성일: 2020. 5. 8. 작성자: MINJI 설명: 메일 삭제
	 * 
	 * @throws java.lang.Exception
	 */
	@Test
	@Ignore
	public void doDelete() {

		// 1. 삭제할 메일
		// String mail_seq, String mail_id, String receiver, String receiver_id, String
		// rec_date
		// RecipientVO recipientVO = new
		// RecipientVO("M200508_01_R1","M200508_01","홍길동","honggd","");
//		RecipientVO recipientVO01 = new RecipientVO("M200508_04_R5","M200508_04","김정우","honggd","");
//		RecipientVO recipientVO02 = new RecipientVO("M200508_04_R6","M200508_04","이동혁","honggd","");
//		RecipientVO recipientVO03 = new RecipientVO("M200508_04_R7","M200508_04","정재현","honggd","");

		// 2. 단건 삭제
//		int flag = this.mailRecService.doDelete(recipientVO01);
//		flag += this.mailRecService.doDelete(recipientVO02);
//		flag += this.mailRecService.doDelete(recipientVO03);

		// 3. 값 확인
		// assertThat(flag, is(3));

	}

	@Test
	public void doRetrieve() {

		// 검색
		//String searchDiv, String searchWord, int pageSize, int pageNum
		//int pageSize, int pageNum, String searchDiv, String searchWord
		//SearchVO inVO = new SearchVO(10, 1, "10", "_124");
		//List<MailVO> list = (List<MailVO>) this.mailService.doRetrieve(inVO);

//		for (MailVO outVO : list) {
//			LOG.debug(outVO.toString());
//		}
//
//		assertThat(list.size(), is(3));
	}

}
