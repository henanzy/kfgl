package com.hnzy.hot.pojo;

public class Hrzgd {

	private int id;
	private String gdNum; //工单编号
	private String hrz;//电话
	private String telephone;//电话
	private String visCon;//回访内容
	private String tjName;//提交人
	private String tjTime;//提交时间
	private String state;//状态

    private String gdState;//工单状态
	private String auditors;//审核人
	private String auditOpin;//审核意见
    private String auditTime;//审核时间
    private String completetime;//完成时间
    private String pickName;//审核时间
    private String pickTime;//完成时间
    private String gdlb;//工单类别
    private String JS_Name;//接单人
    private String JS_Time;//接单时间
    private String WC_Name;//完成人
    private String WC_Time;//完成时间
    private String cljg;//处理结果
    private String count;//工单数量
    public String getHrz() {
		return hrz;
	}
	public void setHrz(String hrz) {
		this.hrz = hrz;
	}
    
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getGdlb() {
		return gdlb;
	}
	public void setGdlb(String gdlb) {
		this.gdlb = gdlb;
	}
	public String getJS_Name() {
		return JS_Name;
	}
	public void setJS_Name(String jS_Name) {
		JS_Name = jS_Name;
	}
	public String getJS_Time() {
		return JS_Time;
	}
	public void setJS_Time(String jS_Time) {
		JS_Time = jS_Time;
	}
	public String getWC_Name() {
		return WC_Name;
	}
	public void setWC_Name(String wC_Name) {
		WC_Name = wC_Name;
	}
	public String getWC_Time() {
		return WC_Time;
	}
	public void setWC_Time(String wC_Time) {
		WC_Time = wC_Time;
	}
	public String getCljg() {
		return cljg;
	}
	public void setCljg(String cljg) {
		this.cljg = cljg;
	}
	public String getPickName() {
		return pickName;
	}
	public void setPickName(String pickName) {
		this.pickName = pickName;
	}
	public String getPickTime() {
		return pickTime;
	}
	public void setPickTime(String pickTime) {
		this.pickTime = pickTime;
	}
	public String getCompletetime() {
		return completetime;
	}
	public void setCompletetime(String completetime) {
		this.completetime = completetime;
	}
	public String getAuditors() {
		return auditors;
	}
	public void setAuditors(String auditors) {
		this.auditors = auditors;
	}
	public String getAuditOpin() {
		return auditOpin;
	}
	public void setAuditOpin(String auditOpin) {
		this.auditOpin = auditOpin;
	}
	
	public String getAuditTime() {
		return auditTime;
	}
	public void setAuditTime(String auditTime) {
		this.auditTime = auditTime;
	}
	public String getGdState() {
		return gdState;
	}
	public void setGdState(String gdState) {
		this.gdState = gdState;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGdNum() {
		return gdNum;
	}
	public void setGdNum(String gdNum) {
		this.gdNum = gdNum;
	}
	
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getVisCon() {
		return visCon;
	}
	public void setVisCon(String visCon) {
		this.visCon = visCon;
	}
	public String getTjName() {
		return tjName;
	}
	public void setTjName(String tjName) {
		this.tjName = tjName;
	}
	
	public String getTjTime() {
		return tjTime;
	}
	public void setTjTime(String tjTime) {
		this.tjTime = tjTime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
