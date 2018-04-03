package com.study.member.vo;

import java.io.Serializable;

public class Member implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//외부 네트워크 분산환경에서도 해당 객체를 제대로 읽을 수 있도록
	private String mem_id;
	private String mem_name;
	private String mem_pwd;
	private String mem_phone;
	private String mem_email;
	private int mem_mileage;
	private String reg_date;
	
	public Member(String mem_id, String mem_name, String mem_pwd, String mem_email) {
		super();
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.mem_pwd = mem_pwd;
		this.mem_email = mem_email;
	}
	
	public Member(String mem_id, String mem_name, String mem_pwd, String mem_phone, String mem_email, int mem_mileage) {
		super();
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.mem_pwd = mem_pwd;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
		this.mem_mileage = mem_mileage;
	}

	//default Constructor
	public Member() {

	}

	public String getMem_id() {
		
		return mem_id;
		
	}
	
	public void setMem_id(String mem_id) {
		
		this.mem_id = mem_id;
	}
	
	public String getMem_name() {
		
		return mem_name;
	}
	
	public void setMem_name(String mem_name) {
		
		this.mem_name = mem_name;
	}
	
	public String getMem_pwd() {
		
		return mem_pwd;
	}
	
	public void setMem_pwd(String mem_pwd) {
		
		this.mem_pwd = mem_pwd;
	}
	
	public String getMem_phone() {
		return mem_phone;
	}
	
	public void setMem_phone(String mem_phone) {
		
		this.mem_phone = mem_phone;
		
	}
	public String getMem_email() {
		
		return mem_email;
	}
	
	public void setMem_email(String mem_email) {
		
		this.mem_email = mem_email;
		
	}
	
	public int getMem_mileage() {
		
		return mem_mileage;
	}
	public void setMem_mileage(int mem_mileage) {
		
		this.mem_mileage = mem_mileage;
	}
	
	public String getReg_date() {
		
		return reg_date;
	}
	
	public void setReg_date(String reg_date) {
		
		this.reg_date = reg_date;
	}
	
}