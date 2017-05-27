package net.su.ref.valueObject;

public class MemValueObject {
	private int mem_seq; // 회원 고유값
	private String mem_id; // 회원 아이디
	private String mem_pw; // 회원 비밀번호
	private String mem_nme; // 회원 이름
	private String mem_gendr; // 회원 성별
	private int mem_age; // 회원 나이
	private String refrigerator_nme; // 냉장고 이름
	private int refrigerator_seq; // 냉장고 seq

	
	

	public int getRefrigerator_seq() {
		return refrigerator_seq;
	}
	public void setRefrigerator_seq(int refrigerator_seq) {
		this.refrigerator_seq = refrigerator_seq;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getRefrigerator_nme() {
		return refrigerator_nme;
	}
	public void setRefrigerator_nme(String refrigerator_nme) {
		this.refrigerator_nme = refrigerator_nme;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_nme() {
		return mem_nme;
	}
	public void setMem_nme(String mem_nme) {
		this.mem_nme = mem_nme;
	}
	public String getMem_gendr() {
		return mem_gendr;
	}
	public void setMem_gendr(String mem_gendr) {
		this.mem_gendr = mem_gendr;
	}
	public int getMem_age() {
		return mem_age;
	}
	public void setMem_age(int mem_age) {
		this.mem_age = mem_age;
	}
}
