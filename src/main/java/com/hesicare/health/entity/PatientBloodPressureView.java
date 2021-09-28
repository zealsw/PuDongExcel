package com.hesicare.health.entity;


public class PatientBloodPressureView {

  private long id;
  private long userid;
  private String name;
  private java.sql.Date birth;
  private String sex;
  private java.sql.Timestamp measureTime;
  private String identifyCard;
  private String cardNumber;
  private double systolic;
  private double diastolic;
  private double pluse;
  private String isAverage;
  private String evaluation;
  private String hand;
  private String devicesn;
  private long parentId;
  private String status;
  private long deptid;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getUserid() {
    return userid;
  }

  public void setUserid(long userid) {
    this.userid = userid;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public java.sql.Date getBirth() {
    return birth;
  }

  public void setBirth(java.sql.Date birth) {
    this.birth = birth;
  }


  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }


  public java.sql.Timestamp getMeasureTime() {
    return measureTime;
  }

  public void setMeasureTime(java.sql.Timestamp measureTime) {
    this.measureTime = measureTime;
  }


  public String getIdentifyCard() {
    return identifyCard;
  }

  public void setIdentifyCard(String identifyCard) {
    this.identifyCard = identifyCard;
  }


  public String getCardNumber() {
    return cardNumber;
  }

  public void setCardNumber(String cardNumber) {
    this.cardNumber = cardNumber;
  }


  public double getSystolic() {
    return systolic;
  }

  public void setSystolic(double systolic) {
    this.systolic = systolic;
  }


  public double getDiastolic() {
    return diastolic;
  }

  public void setDiastolic(double diastolic) {
    this.diastolic = diastolic;
  }


  public double getPluse() {
    return pluse;
  }

  public void setPluse(double pluse) {
    this.pluse = pluse;
  }


  public String getIsAverage() {
    return isAverage;
  }

  public void setIsAverage(String isAverage) {
    this.isAverage = isAverage;
  }


  public String getEvaluation() {
    return evaluation;
  }

  public void setEvaluation(String evaluation) {
    this.evaluation = evaluation;
  }


  public String getHand() {
    return hand;
  }

  public void setHand(String hand) {
    this.hand = hand;
  }


  public String getDevicesn() {
    return devicesn;
  }

  public void setDevicesn(String devicesn) {
    this.devicesn = devicesn;
  }


  public long getParentId() {
    return parentId;
  }

  public void setParentId(long parentId) {
    this.parentId = parentId;
  }


  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }


  public long getDeptid() {
    return deptid;
  }

  public void setDeptid(long deptid) {
    this.deptid = deptid;
  }

  @Override
  public String toString() {
    return "PatientBloodPressureView{" +
            "id=" + id +
            ", userid=" + userid +
            ", name='" + name + '\'' +
            ", birth=" + birth +
            ", sex='" + sex + '\'' +
            ", measureTime=" + measureTime +
            ", identifyCard='" + identifyCard + '\'' +
            ", cardNumber='" + cardNumber + '\'' +
            ", systolic=" + systolic +
            ", diastolic=" + diastolic +
            ", pluse=" + pluse +
            ", isAverage='" + isAverage + '\'' +
            ", evaluation='" + evaluation + '\'' +
            ", hand='" + hand + '\'' +
            ", devicesn='" + devicesn + '\'' +
            ", parentId=" + parentId +
            ", status='" + status + '\'' +
            ", deptid=" + deptid +
            '}';
  }
}
