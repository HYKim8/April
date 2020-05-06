/**
 * <pre>
 * com.april.groupware.attendance
 * Class Name : UserUpdateVO.java
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
package com.april.groupware.attendance.service;

import com.april.groupware.cmn.DTO;

/**
 * @author JIEUN 
 *
 */
public class UserUpdateVO extends DTO {
	/**아이디*/
	private String userId;
	/**비밀번호*/
	private String userPassword;
	/**부서명*/
	private String deptName;
	/**부서코드*/
	private String deptCode;
	/**상위 부서코드*/
	private String parentDeptCode;
	/**권한*/
	private String authority;
	/**이름*/
	private String userName;
	/**직급*/
	private String position;
	/**휴대폰 번호*/
	private String cellPhone;
	/**이메일 주소*/
	private String email;
	/**주소*/
	private String address;
	/**입사일*/
	private String hiredate;
	/**생년월일*/
	private String birthday;
	/**휴가일수*/
	private String vacationCnt;
	/**병역*/
	private String militaryYN;
	/**장애*/
	private String dspsnYN;
	/**학력*/
	private String grade;
	/**원본 사진 경로*/
	private String orgFileName;
	/**수정 사진 경로*/
	private String modFileName;
	/**저장된 사진 경로*/
	private String imgPath;
	/**사진 확장자*/
	private String ext;
	/**사진 확장자*/
	private String fileSize;
	/**등록자*/
	private String regId;
	/**등록일*/
	private String regDate;
	/**수정자*/
	private String modId;
	/**수정일*/
	private String modDate;
	
	public UserUpdateVO() {
		
	}

	public UserUpdateVO(String userId, String userPassword, String deptName, String deptCode, String parentDeptCode,
			String authority, String userName, String position, String cellPhone, String email, String address,
			String hiredate, String birthday, String vacationCnt, String militaryYN, String dspsnYN, String grade,
			String orgFileName, String modFileName, String imgPath, String ext, String fileSize, String regId,
			String regDate, String modId, String modDate) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.deptName = deptName;
		this.deptCode = deptCode;
		this.parentDeptCode = parentDeptCode;
		this.authority = authority;
		this.userName = userName;
		this.position = position;
		this.cellPhone = cellPhone;
		this.email = email;
		this.address = address;
		this.hiredate = hiredate;
		this.birthday = birthday;
		this.vacationCnt = vacationCnt;
		this.militaryYN = militaryYN;
		this.dspsnYN = dspsnYN;
		this.grade = grade;
		this.orgFileName = orgFileName;
		this.modFileName = modFileName;
		this.imgPath = imgPath;
		this.ext = ext;
		this.fileSize = fileSize;
		this.regId = regId;
		this.regDate = regDate;
		this.modId = modId;
		this.modDate = modDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getParentDeptCode() {
		return parentDeptCode;
	}

	public void setParentDeptCode(String parentDeptCode) {
		this.parentDeptCode = parentDeptCode;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getCellPhone() {
		return cellPhone;
	}

	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getVacationCnt() {
		return vacationCnt;
	}

	public void setVacationCnt(String vacationCnt) {
		this.vacationCnt = vacationCnt;
	}

	public String getMilitaryYN() {
		return militaryYN;
	}

	public void setMilitaryYN(String militaryYN) {
		this.militaryYN = militaryYN;
	}

	public String getDspsnYN() {
		return dspsnYN;
	}

	public void setDspsnYN(String dspsnYN) {
		this.dspsnYN = dspsnYN;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getModFileName() {
		return modFileName;
	}

	public void setModFileName(String modFileName) {
		this.modFileName = modFileName;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getModId() {
		return modId;
	}

	public void setModId(String modId) {
		this.modId = modId;
	}

	public String getModDate() {
		return modDate;
	}

	public void setModDate(String modDate) {
		this.modDate = modDate;
	}

	@Override
	public String toString() {
		return "UserUpdateVO [userId=" + userId + ", userPassword=" + userPassword + ", deptName=" + deptName
				+ ", deptCode=" + deptCode + ", parentDeptCode=" + parentDeptCode + ", authority=" + authority
				+ ", userName=" + userName + ", position=" + position + ", cellPhone=" + cellPhone + ", email=" + email
				+ ", address=" + address + ", hiredate=" + hiredate + ", birthday=" + birthday + ", vacationCnt="
				+ vacationCnt + ", militaryYN=" + militaryYN + ", dspsnYN=" + dspsnYN + ", grade=" + grade
				+ ", orgFileName=" + orgFileName + ", modFileName=" + modFileName + ", imgPath=" + imgPath + ", ext="
				+ ext + ", fileSize=" + fileSize + ", regId=" + regId + ", regDate=" + regDate + ", modId=" + modId
				+ ", modDate=" + modDate + ", toString()=" + super.toString() + "]";
	}

}
