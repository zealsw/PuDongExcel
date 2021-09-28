package com.hesicare.health.dao;


public class DataBloodGlucose {

  private double id;
  private String value;
  private String status;
  private java.sql.Timestamp measureTime;
  private String patientId;
  private String cardNumber;
  private String opratorId;
  private double operateState;
  private double operateType;
  private String remark;


  public double getId() {
    return id;
  }

  public void setId(double id) {
    this.id = id;
  }


  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }


  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }


  public java.sql.Timestamp getMeasureTime() {
    return measureTime;
  }

  public void setMeasureTime(java.sql.Timestamp measureTime) {
    this.measureTime = measureTime;
  }


  public String getPatientId() {
    return patientId;
  }

  public void setPatientId(String patientId) {
    this.patientId = patientId;
  }


  public String getCardNumber() {
    return cardNumber;
  }

  public void setCardNumber(String cardNumber) {
    this.cardNumber = cardNumber;
  }


  public String getOpratorId() {
    return opratorId;
  }

  public void setOpratorId(String opratorId) {
    this.opratorId = opratorId;
  }


  public double getOperateState() {
    return operateState;
  }

  public void setOperateState(double operateState) {
    this.operateState = operateState;
  }


  public double getOperateType() {
    return operateType;
  }

  public void setOperateType(double operateType) {
    this.operateType = operateType;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

}
