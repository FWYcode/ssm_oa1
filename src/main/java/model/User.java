package model;

import java.util.List;

public class User {

	private int id;
	private String name;
	private String pass;
	private String address;
	private int age;
	private String phone;
	private int power;
	private int sex;
	private List<Mail> lis;
	private List<Leaveren> leavets;
	private List<Leaveren> pleaas;
	public List<Leaveren> getPleaas() {
		return pleaas;
	}

	public void setPleaas(List<Leaveren> pleaas) {
		this.pleaas = pleaas;
	}

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

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public List<Mail> getLis() {
		return lis;
	}

	public void setLis(List<Mail> lis) {
		this.lis = lis;
	}

	public List<Leaveren> getLeavets() {
		return leavets;
	}

	public void setLeavets(List<Leaveren> leavets) {
		this.leavets = leavets;
	}

}
