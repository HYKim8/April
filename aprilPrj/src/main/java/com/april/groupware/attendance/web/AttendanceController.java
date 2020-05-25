package com.april.groupware.attendance.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.april.groupware.attendance.service.AttendanceDao;
import com.april.groupware.attendance.service.AttendanceVO;
import com.april.groupware.cmn.MessageVO;
import com.google.gson.Gson;

@Controller
public class AttendanceController {
	private final Logger LOG = LoggerFactory.getLogger(AttendanceController.class);
	
	@Autowired
	AttendanceDao attendanceDao;
	
	@RequestMapping(value="attend/do_insert.do", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String doInsert(AttendanceVO attendVO) throws ParseException {
		LOG.debug("====================");
		LOG.debug("=doInsert user= : "+attendVO);
		LOG.debug("====================");
		
		int flag  = attendanceDao.doInsert(attendVO);
		LOG.debug("====================");
		LOG.debug("=doInsert flag= : "+flag);
		LOG.debug("====================");
		
		MessageVO message = new MessageVO();
		
		message.setMsgId(String.valueOf(flag));
		
		Date date = new Date();
		DateFormat format = DateFormat.getDateInstance(DateFormat.FULL);
		String today = format.format(date);
		
		if(flag == 1) {
			message.setMsgMsg(attendVO.getId()+"님 \n"+today+" 출근이 완료되었습니다.");
		} else {
			message.setMsgMsg("출근을 완료하지 못했습니다. \n관리자에게 문의해주세요.");
		}
		
		//Json(Gson)
		Gson gson = new Gson();
		String json = gson.toJson(message);
		
		LOG.debug("====================");
		LOG.debug("=doInsert json= : "+json);
		LOG.debug("====================");
		
		return json;
	}
	
	@RequestMapping(value="attend/do_update.do", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String doUpdate(AttendanceVO attendVO) {
		LOG.debug("====================");
		LOG.debug("=doUpdate user= : "+attendVO);
		LOG.debug("====================");
		
		if(attendVO.getId() == null) {
			throw new IllegalArgumentException("ID를 입력하세요");
		}
		
		int flag = attendanceDao.doUpdate(attendVO);
		LOG.debug("====================");
		LOG.debug("=doUpdate flag= : "+flag);
		LOG.debug("====================");
		
		MessageVO message = new MessageVO();
		
		message.setMsgId(String.valueOf(flag));
		
		if(flag == 1) {
			message.setMsgMsg(attendVO.getId()+"성공");
		} else {
			message.setMsgMsg(attendVO.getId()+"실패");
		}
		
		//Json(Gson)
		Gson gson = new Gson();
		String json = gson.toJson(message);
		
		LOG.debug("====================");
		LOG.debug("=doUpdate json= : "+json);
		LOG.debug("====================");
		
		return json;
	}
	
	@RequestMapping(value="attend/early_leave.do", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String doEarlyLeave(AttendanceVO attendVO) {
		LOG.debug("====================");
		LOG.debug("=doEarlyLeave user= : "+attendVO);
		LOG.debug("====================");
		
		if(attendVO.getId() == null) {
			throw new IllegalArgumentException("ID를 입력하세요");
		}
		
		//TODO
		attendVO.setLeaveYN("1");
		
		int flag = attendanceDao.doLeaveUpdate(attendVO);
		LOG.debug("====================");
		LOG.debug("=doEarlyLeave flag= : "+flag);
		LOG.debug("====================");
		
		MessageVO message = new MessageVO();
		
		message.setMsgId(String.valueOf(flag));
		
		Date date = new Date();
		DateFormat format = DateFormat.getDateInstance(DateFormat.FULL);
		String today = format.format(date);
		
		if(flag == 1) {
			message.setMsgMsg(attendVO.getId()+"님 \n"+today+" 조퇴 처리되었습니다.");
		} else {
			message.setMsgMsg("조퇴 처리를 완료하지 못했습니다. \n관리자에게 문의해주세요.");
		}
		
		//Json(Gson)
		Gson gson = new Gson();
		String json = gson.toJson(message);
		
		LOG.debug("====================");
		LOG.debug("=doEarlyLeave json= : "+json);
		LOG.debug("====================");
		
		return json;
	}
	
	@RequestMapping(value="attend/leave_update.do", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String doLeaveUpdate(AttendanceVO attendVO) {
		LOG.debug("====================");
		LOG.debug("=doLeaveUpdate user= : "+attendVO);
		LOG.debug("====================");
		
		if(attendVO.getId() == null) {
			throw new IllegalArgumentException("ID를 입력하세요");
		}
		
		//TODO
		attendVO.setLeaveYN("1");
		
		int flag = attendanceDao.doLeaveUpdate(attendVO);
		LOG.debug("====================");
		LOG.debug("=doLeaveUpdate flag= : "+flag);
		LOG.debug("====================");
		
		MessageVO message = new MessageVO();
		
		message.setMsgId(String.valueOf(flag));
		
		Date date = new Date();
		DateFormat format = DateFormat.getDateInstance(DateFormat.FULL);
		String today = format.format(date);
		
		if(flag == 1) {
			message.setMsgMsg(attendVO.getId()+"님 \n"+today+" 퇴근이 완료되었습니다.");
		} else {
			message.setMsgMsg("퇴근을 완료하지 못했습니다. \n관리자에게 문의해주세요.");
		}
		
		//Json(Gson)
		Gson gson = new Gson();
		String json = gson.toJson(message);
		
		LOG.debug("====================");
		LOG.debug("=doLeaveUpdate json= : "+json);
		LOG.debug("====================");
		
		return json;
	}
	
	@RequestMapping(value="attend/do_delete.do", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String doDelete(AttendanceVO attendVO) {
		LOG.debug("====================");
		LOG.debug("=doDelete user= : "+attendVO);
		LOG.debug("====================");
		
		//TODO 로그인 
		attendVO.setId("kimjh1");
		
		if(attendVO.getId() == null) {
			throw new IllegalArgumentException("ID를 입력하세요");
		}
		
		int flag = attendanceDao.doDelete(attendVO);
		LOG.debug("====================");
		LOG.debug("=doDelete flag= : "+flag);
		LOG.debug("====================");
		
		MessageVO message = new MessageVO();
		
		message.setMsgId(String.valueOf(flag));
		
		if(flag > 0) {
			message.setMsgId(String.valueOf(flag));
			message.setMsgMsg("삭제 성공");
		} else {
			message.setMsgId(String.valueOf(flag));
			message.setMsgMsg("삭제 실패");
		}
		
		//Json(Gson)
		Gson gson = new Gson();
		String json = gson.toJson(message);
		
		LOG.debug("====================");
		LOG.debug("=doDelete json= : "+json);
		LOG.debug("====================");
		
		return json;
	}
	
	@RequestMapping(value="attend/do_select_one.do", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	public String doSelectOne(AttendanceVO attendVO, Model model) {
		LOG.debug("====================");
		LOG.debug("=doSelectOne attendVO= : "+attendVO);
		LOG.debug("====================");
		
		//로그인 세션
		attendVO.setId("kimjh1");

		//날짜 검색
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM");
		String today = format.format(date)+"/01";
		LOG.debug("=today= : "+today);
		//날짜 검색어 set
		attendVO.setSearchDate(today);
		
		//today ex)2020/05/01
		AttendanceVO outVO = (AttendanceVO) attendanceDao.doSelectOne(attendVO);
		
		//View에 연도 출력
		SimpleDateFormat yFormat = new SimpleDateFormat("yyyy");
		String year = yFormat.format(date);
		outVO.setYear(year);
		LOG.debug("=year= : "+year);

		//View에 월 출력
		SimpleDateFormat mFormat = new SimpleDateFormat("MM");
		String month = mFormat.format(date);
		outVO.setMonth(month);
		LOG.debug("=month= : "+month);
		
		LOG.debug("====================");
		LOG.debug("=doSelectOne outVO= : "+outVO);
		LOG.debug("====================");
		
		model.addAttribute("attendanceVO", outVO);
		
		List<AttendanceVO> outList = (List<AttendanceVO>) attendanceDao.getAll(attendVO);
		LOG.debug("====================");
		LOG.debug("=getAll outList= : "+outList);
		LOG.debug("====================");
		
		model.addAttribute("attendanceList", outList);
		
		//Json(Gson)
		Gson gson = new Gson();
		String json = gson.toJson(outVO);
		
		LOG.debug("====================");
		LOG.debug("=doSelectOne json= : "+json);
		LOG.debug("====================");
		
		return "/views/attendance";
	}
	
	@RequestMapping(value="attend/do_get_all.do", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	public String getAllSearchDate(AttendanceVO attendVO, Model model) {
		LOG.debug("====================");
		LOG.debug("=doSelectOne attendVO= : "+attendVO);
		LOG.debug("====================");
		
		attendVO.setId("kimjh1");
		
		String year = attendVO.getYear();
		String month = attendVO.getMonth();
		String searchDate = year+"/"+month+"/01";
		//날짜 검색어 set
		attendVO.setSearchDate(searchDate);
		LOG.debug("=today= : "+searchDate);
		
		//today ex)2020/05/01
		AttendanceVO outVO = (AttendanceVO) attendanceDao.doSelectOne(attendVO);
		//View에 연도 출력
		outVO.setYear(year);
		LOG.debug("=year= : "+year);

		//View에 월 출력
		outVO.setMonth(month);
		LOG.debug("=month= : "+month);
		
		LOG.debug("====================");
		LOG.debug("=doSelectOne outVO= : "+outVO);
		LOG.debug("====================");
		
		model.addAttribute("attendanceVO", outVO);
		
		List<AttendanceVO> outList = (List<AttendanceVO>) attendanceDao.getAll(attendVO);
		LOG.debug("====================");
		LOG.debug("=getAll outList= : "+outList);
		LOG.debug("====================");
		
		model.addAttribute("attendanceList", outList);
		
		//Json(Gson)
		Gson gson = new Gson();
		String json = gson.toJson(outList);
		
		LOG.debug("====================");
		LOG.debug("=doSelectOne json= : "+json);
		LOG.debug("====================");
		
		return "/views/attendance";
	}
	
//	@RequestMapping(value="attend/get_all.do", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
//	public String getAll(AttendanceVO attendVO, Model model) {
//		LOG.debug("====================");
//		LOG.debug("=getAll user= : "+attendVO);
//		LOG.debug("====================");
//		
//		List<AttendanceVO> outList = (List<AttendanceVO>) attendanceDao.getAll(attendVO);
//		LOG.debug("====================");
//		LOG.debug("=getAll outList= : "+outList);
//		LOG.debug("====================");
//		
//		model.addAttribute("attendanceList", outList);
//		
//		//Json(Gson)
////		Gson gson = new Gson();
////		String json = gson.toJson(outVO);
////		
////		LOG.debug("====================");
////		LOG.debug("=doSelectOne json= : "+json);
////		LOG.debug("====================");
//		
//		return "/views/attendance";
//	}
	
}
