package model;

import java.sql.Date;

public class Leaveren {

	private int id;
	private Date begint;
	private Date endt;
	private Integer days;
	//审批状态0未批,1已批
	private Integer state;
	private String reasons;
	// 审批人id
	private Integer revid;
	// 申请人id
	private Integer apid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getBegint() {
		return begint;
	}
	public void setBegint(Date begint) {
		this.begint = begint;
	}
	public Date getEndt() {
		return endt;
	}
	public void setEndt(Date endt) {
		this.endt = endt;
	}
	public Integer getDays() {
		return days;
	}
	public void setDays(Integer days) {
		this.days = days;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getReasons() {
		return reasons;
	}
	public void setReasons(String reasons) {
		this.reasons = reasons;
	}
	public Integer getRevid() {
		return revid;
	}
	public void setRevid(Integer revid) {
		this.revid = revid;
	}
	public Integer getApid() {
		return apid;
	}
	public void setApid(Integer apid) {
		this.apid = apid;
	}

	
}
