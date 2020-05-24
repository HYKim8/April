package com.april.groupware.nboard.service;
import com.april.groupware.cmn.DTO;

/**
 * 
 */

/**
 * @author 양은영
 *
 */
public class NBAnswerVO extends DTO {
	
	int	awNo			; /*	댓글번호	*/
	int	nbNo			; /*	게시글순번	*/
	String	awContents	; /*	내용	*/
	String	regId		; /*	작성자	*/
	String	modId		; /*	수정자	*/
	String	regDate		; /*	작성일	*/
	String	modDate		; /*	수정일	*/
	
	public NBAnswerVO() {}

	public int getAwNo() {
		return awNo;
	}

	public void setAwNo(int awNo) {
		this.awNo = awNo;
	}

	public int getNbNo() {
		return nbNo;
	}

	public void setNbNo(int nbNo) {
		this.nbNo = nbNo;
	}

	public String getAwContents() {
		return awContents;
	}

	public void setAwContents(String awContents) {
		this.awContents = awContents;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getModId() {
		return modId;
	}

	public void setModId(String modId) {
		this.modId = modId;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getModDate() {
		return modDate;
	}

	public void setModDate(String modDate) {
		this.modDate = modDate;
	}

	@Override
	public String toString() {
		return "NBAnswerVO [awNo=" + awNo + ", nbNo=" + nbNo + ", awContents=" + awContents + ", regId=" + regId
				+ ", modId=" + modId + ", regDate=" + regDate + ", modDate=" + modDate + ", toString()="
				+ super.toString() + "]";
	}

	public NBAnswerVO(int awNo, int nbNo, String awContents, String regId, String modId, String regDate,
			String modDate) {
		super();
		this.awNo = awNo;
		this.nbNo = nbNo;
		this.awContents = awContents;
		this.regId = regId;
		this.modId = modId;
		this.regDate = regDate;
		this.modDate = modDate;
	}
	
	

	
}