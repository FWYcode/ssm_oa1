package model;

import java.io.Serializable;
import java.sql.Date;


public class Mail implements Serializable{

	private int id;
	private String name;
	private String matter;
	// 描述邮件状态0未读1已读
	private Integer state;
	private Date date;
	// 发件人id
	private Integer seid;
	// 收件人id
	private Integer reid;
	private String filename;
	//标记mail删除的类型 0不删除，1逻辑删除
	private Integer sign;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMatter() {
		return matter;
	}
	public void setMatter(String matter) {
		this.matter = matter;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getSeid() {
		return seid;
	}
	public void setSeid(Integer seid) {
		this.seid = seid;
	}
	public Integer getReid() {
		return reid;
	}
	public void setReid(Integer reid) {
		this.reid = reid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Integer getSign() {
		return sign;
	}
	public void setSign(Integer sign) {
		this.sign = sign;
	}
	@Override
	public String toString() {
		return "Mail [id=" + id + ", name=" + name + ", matter=" + matter + ", state=" + state + ", date=" + date
				+ ", seid=" + seid + ", reid=" + reid + ", filename=" + filename + ", sign=" + sign + "]";
	}


}
