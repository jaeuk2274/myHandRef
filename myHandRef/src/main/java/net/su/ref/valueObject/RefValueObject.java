package net.su.ref.valueObject;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import net.su.common.valueObject.SearchAndPageValueObject;

public class RefValueObject extends SearchAndPageValueObject {

	private int mem_seq=0; // 회원 고유값
	private String mem_nme=""; // 회원 이름
	private BigInteger barcd; // 바코드 번호
	private String food_nme=""; // 식품 이름
	private String food_img=""; // 식품 이미지 경로
	
	private int avg_expiration_dat=0; // 평균 유통기한 일수
	
	private float supplied_amount=0; // 1회 제공량
	private float calorie=0; // 열량
	private float carbohydrate=0; // 탄수화물
	private float protein=0; // 단백질
	private float fat=0; // 지방
	private float sugars=0; // 당류
	private float salt=0; // 나트륨
	private float cholesterol=0;  // 콜레스테롤
	private float saturated_fat=0; // 포화지방산
	private float unsaturated_fat=0; // 트랜스지방산
	
	private int input_history_seq=0; // 입고내역 고유값
	
	private String deadLine=""; // 유통기한 임박 7일 기준, (Y, N) 7일 이내 Y
	
	private String expiration_dat=""; //  유통기한
	private String input_datetime=""; // 입고일
	private String order_by="input_datetime"; // 정렬 기준
	private int input_cont=0; // 입고횟수

	private List<Integer> refChkGroup = null; // 식품 체크박스 그룹
	private List<Integer> fmyCheckGroup = null; // 가족구성원 체크박스 그룹
	private List<RefValueObject> fmyGroup = null; // 가족구성원  그룹
	private float intk_rat=0; // 섭취율
	
	private List<HashMap<String, Object>> refList = null; 
	private int fmyNum=0; // 선택 가족구성원 수
	
	private String nut_nme=""; // 영양소 명
	private String state=""; // 상태
	
	private String count=""; // 개수(투데이 섭취 식품 비고)
	
	private String search_dat = null; // 검색 기간
	private String start_dat; // 검색 시작 기간
	private String end_dat; // 검색 종료 기간
	
	private List<Integer> nutAnalCheckGroup; // 영양성분 분석  체크박스 그룹
	
	private int refrigerator_seq; // 냉장고 seq
	
	private float calorie0to4=0; // 열량
	private float calorie4to8=0; 
	private float calorie8to12=0;
	private float calorie12to16=0;
	private float calorie16to20=0;
	private float calorie20to24=0;
	
	private float carbohydrate0to4=0; // 탄수화물
	private float carbohydrate4to8=0; 
	private float carbohydrate8to12=0; 
	private float carbohydrate12to16=0; 
	private float carbohydrate16to20=0; 
	private float carbohydrate20to24=0; 
	
	private float protein0to4=0; // 단백질
	private float protein4to8=0; 
	private float protein8to12=0; 
	private float protein12to16=0; 
	private float protein16to20=0; 
	private float protein20to24=0; 
	
	private float fat0to4=0; // 지방
	private float fat4to8=0; 
	private float fat8to12=0; 
	private float fat12to16=0; 
	private float fat16to20=0; 
	private float fat20to24=0;
	
	private float carbohydrate1=0; // 탄수화물(가족구성원)
	private float carbohydrate2=0; 
	private float carbohydrate3=0; 
	private float carbohydrate4=0; 
	private float carbohydrate5=0; 
	private float carbohydrate6=0;
	
	private float protein1=0; // 단백질
	private float protein2=0;
	private float protein3=0;
	private float protein4=0;
	private float protein5=0;
	private float protein6=0;
	
	private float fat1=0; // 지방
	private float fat2=0;
	private float fat3=0;
	private float fat4=0;
	private float fat5=0;
	private float fat6=0;
	
	
	public List<RefValueObject> getFmyGroup() {
		return fmyGroup;
	}
	public void setFmyGroup(List<RefValueObject> fmyGroup) {
		this.fmyGroup = fmyGroup;
	}
	public float getCarbohydrate1() {
		return carbohydrate1;
	}
	public void setCarbohydrate1(float carbohydrate1) {
		this.carbohydrate1 = carbohydrate1;
	}
	public float getCarbohydrate2() {
		return carbohydrate2;
	}
	public void setCarbohydrate2(float carbohydrate2) {
		this.carbohydrate2 = carbohydrate2;
	}
	public float getCarbohydrate3() {
		return carbohydrate3;
	}
	public void setCarbohydrate3(float carbohydrate3) {
		this.carbohydrate3 = carbohydrate3;
	}
	public float getCarbohydrate4() {
		return carbohydrate4;
	}
	public void setCarbohydrate4(float carbohydrate4) {
		this.carbohydrate4 = carbohydrate4;
	}
	public float getCarbohydrate5() {
		return carbohydrate5;
	}
	public void setCarbohydrate5(float carbohydrate5) {
		this.carbohydrate5 = carbohydrate5;
	}
	public float getCarbohydrate6() {
		return carbohydrate6;
	}
	public void setCarbohydrate6(float carbohydrate6) {
		this.carbohydrate6 = carbohydrate6;
	}
	public float getProtein1() {
		return protein1;
	}
	public void setProtein1(float protein1) {
		this.protein1 = protein1;
	}
	public float getProtein2() {
		return protein2;
	}
	public void setProtein2(float protein2) {
		this.protein2 = protein2;
	}
	public float getProtein3() {
		return protein3;
	}
	public void setProtein3(float protein3) {
		this.protein3 = protein3;
	}
	public float getProtein4() {
		return protein4;
	}
	public void setProtein4(float protein4) {
		this.protein4 = protein4;
	}
	public float getProtein5() {
		return protein5;
	}
	public void setProtein5(float protein5) {
		this.protein5 = protein5;
	}
	public float getProtein6() {
		return protein6;
	}
	public void setProtein6(float protein6) {
		this.protein6 = protein6;
	}
	public float getFat1() {
		return fat1;
	}
	public void setFat1(float fat1) {
		this.fat1 = fat1;
	}
	public float getFat2() {
		return fat2;
	}
	public void setFat2(float fat2) {
		this.fat2 = fat2;
	}
	public float getFat3() {
		return fat3;
	}
	public void setFat3(float fat3) {
		this.fat3 = fat3;
	}
	public float getFat4() {
		return fat4;
	}
	public void setFat4(float fat4) {
		this.fat4 = fat4;
	}
	public float getFat5() {
		return fat5;
	}
	public void setFat5(float fat5) {
		this.fat5 = fat5;
	}
	public float getFat6() {
		return fat6;
	}
	public void setFat6(float fat6) {
		this.fat6 = fat6;
	}
	public float getCalorie20to24() {
		return calorie20to24;
	}
	public void setCalorie20to24(float calorie20to24) {
		this.calorie20to24 = calorie20to24;
	}
	public float getCarbohydrate20to24() {
		return carbohydrate20to24;
	}
	public void setCarbohydrate20to24(float carbohydrate20to24) {
		this.carbohydrate20to24 = carbohydrate20to24;
	}
	public float getProtein20to24() {
		return protein20to24;
	}
	public void setProtein20to24(float protein20to24) {
		this.protein20to24 = protein20to24;
	}
	public float getFat20to24() {
		return fat20to24;
	}
	public void setFat20to24(float fat20to24) {
		this.fat20to24 = fat20to24;
	}
	public float getCalorie0to4() {
		return calorie0to4;
	}
	public void setCalorie0to4(float calorie0to4) {
		this.calorie0to4 = calorie0to4;
	}
	public float getCalorie4to8() {
		return calorie4to8;
	}
	public void setCalorie4to8(float calorie4to8) {
		this.calorie4to8 = calorie4to8;
	}
	public float getCalorie8to12() {
		return calorie8to12;
	}
	public void setCalorie8to12(float calorie8to12) {
		this.calorie8to12 = calorie8to12;
	}
	public float getCalorie12to16() {
		return calorie12to16;
	}
	public void setCalorie12to16(float calorie12to16) {
		this.calorie12to16 = calorie12to16;
	}
	public float getCalorie16to20() {
		return calorie16to20;
	}
	public void setCalorie16to20(float calorie16to20) {
		this.calorie16to20 = calorie16to20;
	}
	public float getCarbohydrate0to4() {
		return carbohydrate0to4;
	}
	public void setCarbohydrate0to4(float carbohydrate0to4) {
		this.carbohydrate0to4 = carbohydrate0to4;
	}
	public float getCarbohydrate4to8() {
		return carbohydrate4to8;
	}
	public void setCarbohydrate4to8(float carbohydrate4to8) {
		this.carbohydrate4to8 = carbohydrate4to8;
	}
	public float getCarbohydrate8to12() {
		return carbohydrate8to12;
	}
	public void setCarbohydrate8to12(float carbohydrate8to12) {
		this.carbohydrate8to12 = carbohydrate8to12;
	}
	public float getCarbohydrate12to16() {
		return carbohydrate12to16;
	}
	public void setCarbohydrate12to16(float carbohydrate12to16) {
		this.carbohydrate12to16 = carbohydrate12to16;
	}
	public float getCarbohydrate16to20() {
		return carbohydrate16to20;
	}
	public void setCarbohydrate16to20(float carbohydrate16to20) {
		this.carbohydrate16to20 = carbohydrate16to20;
	}
	public float getProtein0to4() {
		return protein0to4;
	}
	public void setProtein0to4(float protein0to4) {
		this.protein0to4 = protein0to4;
	}
	public float getProtein4to8() {
		return protein4to8;
	}
	public void setProtein4to8(float protein4to8) {
		this.protein4to8 = protein4to8;
	}
	public float getProtein8to12() {
		return protein8to12;
	}
	public void setProtein8to12(float protein8to12) {
		this.protein8to12 = protein8to12;
	}
	public float getProtein12to16() {
		return protein12to16;
	}
	public void setProtein12to16(float protein12to16) {
		this.protein12to16 = protein12to16;
	}
	public float getProtein16to20() {
		return protein16to20;
	}
	public void setProtein16to20(float protein16to20) {
		this.protein16to20 = protein16to20;
	}
	public float getFat0to4() {
		return fat0to4;
	}
	public void setFat0to4(float fat0to4) {
		this.fat0to4 = fat0to4;
	}
	public float getFat4to8() {
		return fat4to8;
	}
	public void setFat4to8(float fat4to8) {
		this.fat4to8 = fat4to8;
	}
	public float getFat8to12() {
		return fat8to12;
	}
	public void setFat8to12(float fat8to12) {
		this.fat8to12 = fat8to12;
	}
	public float getFat12to16() {
		return fat12to16;
	}
	public void setFat12to16(float fat12to16) {
		this.fat12to16 = fat12to16;
	}
	public float getFat16to20() {
		return fat16to20;
	}
	public void setFat16to20(float fat16to20) {
		this.fat16to20 = fat16to20;
	}
	public String getOrder_by() {
		return order_by;
	}
	public void setOrder_by(String order_by) {
		this.order_by = order_by;
	}
	public int getRefrigerator_seq() {
		return refrigerator_seq;
	}
	public void setRefrigerator_seq(int refrigerator_seq) {
		this.refrigerator_seq = refrigerator_seq;
	}
	public List<Integer> getNutAnalCheckGroup() {
		return nutAnalCheckGroup;
	}
	public void setNutAnalCheckGroup(List<Integer> nutAnalCheckGroup) {
		this.nutAnalCheckGroup = nutAnalCheckGroup;
	}
	public String getSearch_dat() {
		return search_dat;
	}
	public void setSearch_dat(String search_dat) {
		this.search_dat = search_dat;
	}
	public String getStart_dat() {
		return start_dat;
	}
	public void setStart_dat(String start_dat) {
		this.start_dat = start_dat;
	}
	public String getEnd_dat() {
		return end_dat;
	}
	public void setEnd_dat(String end_dat) {
		this.end_dat = end_dat;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getNut_nme() {
		return nut_nme;
	}
	public void setNut_nme(String nut_nme) {
		this.nut_nme = nut_nme;
	}
	public List<HashMap<String, Object>> getRefList() {
		return refList;
	}
	public void setRefList(List<HashMap<String, Object>> refList) {
		this.refList = refList;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getMem_nme() {
		return mem_nme;
	}
	public void setMem_nme(String mem_nme) {
		this.mem_nme = mem_nme;
	}
	public BigInteger getBarcd() {
		return barcd;
	}
	public void setBarcd(BigInteger barcd) {
		this.barcd = barcd;
	}
	public String getFood_nme() {
		return food_nme;
	}
	public void setFood_nme(String food_nme) {
		this.food_nme = food_nme;
	}
	public String getFood_img() {
		return food_img;
	}
	public void setFood_img(String food_img) {
		this.food_img = food_img;
	}
	public int getAvg_expiration_dat() {
		return avg_expiration_dat;
	}
	public void setAvg_expiration_dat(int avg_expiration_dat) {
		this.avg_expiration_dat = avg_expiration_dat;
	}
	public float getSupplied_amount() {
		return supplied_amount;
	}
	public void setSupplied_amount(float supplied_amount) {
		this.supplied_amount = supplied_amount;
	}
	public float getCalorie() {
		return calorie;
	}
	public void setCalorie(float calorie) {
		this.calorie = calorie;
	}
	public float getCarbohydrate() {
		return carbohydrate;
	}
	public void setCarbohydrate(float carbohydrate) {
		this.carbohydrate = carbohydrate;
	}
	public float getProtein() {
		return protein;
	}
	public void setProtein(float protein) {
		this.protein = protein;
	}
	public float getFat() {
		return fat;
	}
	public void setFat(float fat) {
		this.fat = fat;
	}
	public float getSugars() {
		return sugars;
	}
	public void setSugars(float sugars) {
		this.sugars = sugars;
	}
	public float getSalt() {
		return salt;
	}
	public void setSalt(float salt) {
		this.salt = salt;
	}
	public float getCholesterol() {
		return cholesterol;
	}
	public void setCholesterol(float cholesterol) {
		this.cholesterol = cholesterol;
	}
	public float getSaturated_fat() {
		return saturated_fat;
	}
	public void setSaturated_fat(float saturated_fat) {
		this.saturated_fat = saturated_fat;
	}
	public float getUnsaturated_fat() {
		return unsaturated_fat;
	}
	public void setUnsaturated_fat(float unsaturated_fat) {
		this.unsaturated_fat = unsaturated_fat;
	}
	public int getInput_history_seq() {
		return input_history_seq;
	}
	public void setInput_history_seq(int input_history_seq) {
		this.input_history_seq = input_history_seq;
	}
	public String getDeadLine() {
		return deadLine;
	}
	public void setDeadLine(String deadLine) {
		this.deadLine = deadLine;
	}
	public String getExpiration_dat() {
		return expiration_dat;
	}
	public void setExpiration_dat(String expiration_dat) {
		this.expiration_dat = expiration_dat;
	}
	public String getInput_datetime() {
		return input_datetime;
	}
	public void setInput_datetime(String input_datetime) {
		this.input_datetime = input_datetime;
	}
	public int getInput_cont() {
		return input_cont;
	}
	public void setInput_cont(int input_cont) {
		this.input_cont = input_cont;
	}
	public List<Integer> getRefChkGroup() {
		return refChkGroup;
	}
	public void setRefChkGroup(List<Integer> refChkGroup) {
		this.refChkGroup = refChkGroup;
	}
	public List<Integer> getFmyCheckGroup() {
		return fmyCheckGroup;
	}
	public void setFmyCheckGroup(List<Integer> fmyCheckGroup) {
		this.fmyCheckGroup = fmyCheckGroup;
	}
	public float getIntk_rat() {
		return intk_rat;
	}
	public void setIntk_rat(float intk_rat) {
		this.intk_rat = intk_rat;
	}
	public int getFmyNum() {
		return fmyNum;
	}
	public void setFmyNum(int fmyNum) {
		this.fmyNum = fmyNum;
	}
	
	
	

	
	
}
