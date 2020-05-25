package com.april.groupware.member.web;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;

import com.april.groupware.cmn.MessageVO;
import com.april.groupware.member.service.UserService;
import com.april.groupware.member.service.UserVO;
import com.google.gson.Gson;

@Controller
public class MemberController {

	private final Logger  LOG = LoggerFactory.getLogger(MemberController.class);

	//@Qualifier("dummyMailSender") : root-context.xml bean id
	@Autowired
	UserService userService;

	/**
	 * Login
	 * @param user
	 * @param session
	 * @return json
	 */
	@RequestMapping(value = "login/logout.do",method = RequestMethod.GET)
	public String doLogout(HttpSession session) {
		session.removeAttribute("user");

		
        return "login/login";
	}
	/**
	 * Login
	 * @param user
	 * @param session
	 * @return json
	 */
	@RequestMapping(value = "login/login.do",method = RequestMethod.POST,produces ="application/json; charset=UTF-8" )
	@ResponseBody
	public String doLogin(UserVO user, HttpSession session
			,HttpServletRequest req, HttpServletResponse res) {
		//1.idPassCheck call
		//1.1. return 10 -> "ID를 확인하세요."
		//1.2. return 20 -> "비번을 확인하세요."
		//1.3. return 30 -> "로그인 성공"
		//    1.3.1. 단건조회 -> session Write
		LOG.debug("1===================");
		LOG.debug("1=user="+user);
		LOG.debug("1===================");
		String message = "";
		if(null == user.getId() || "".equals(user.getId().trim())) {
			message="ID를 입력 하세요.";
			throw new IllegalArgumentException(message);
		}

		if(null == user.getPassword() || "".equals(user.getPassword().trim())) {
			message="비번을 입력 하세요.";
			throw new IllegalArgumentException(message);
		}

		int flag = this.userService.idPassCheck(user);
		MessageVO  messageVO=new MessageVO();
		messageVO.setMsgId(String.valueOf(flag));

		if(10==flag) {//ID CHECK
			messageVO.setMsgMsg("아이디를 확인 하세요.");
		}else if(20==flag) {// pass CHECK
			messageVO.setMsgMsg("비번를 확인 하세요.");
		}else if(30==flag) {// 성공
			messageVO.setMsgMsg("로그인 성공.");
			//사용자 정보 조회
			UserVO userInfo = (UserVO) this.userService.doSelectOne(user);
			LOG.debug("2===================");
			LOG.debug("2=userInfo="+userInfo);
			LOG.debug("2===================");
			
			
			
			session.setAttribute("user", userInfo);
		}

		Gson gson=new Gson();
		String json = gson.toJson(messageVO);
		LOG.debug("2===================");
		LOG.debug("2=json="+json);
		LOG.debug("2===================");

		return json;
	}

	@RequestMapping(value = "member/do_select_one.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doSelectOne(UserVO user) {
		LOG.debug("1===================");
		LOG.debug("1=user=" + user);
		LOG.debug("1===================");

		UserVO outVO = (UserVO) userService.doSelectOne(user);
		// outVO.setLevel(outVO.getLevel().intValue());

		LOG.debug("1.2===================");
		LOG.debug("1.2=outVO=" + outVO);
		LOG.debug("1.2===================");

		Gson gson = new Gson();
		String json = gson.toJson(outVO);

		LOG.debug("1.3===================");
		LOG.debug("1.3=json=" + json);
		LOG.debug("1.3===================");

		return json;
	}
}
