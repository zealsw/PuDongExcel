package com.hesicare.health.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@TableName("patient_blood_glucose_view")
public class BloodGlucose {

  private long id;
  private Date measureTime;
  private String identifyCard;
  private double meatureValue;
  private String evaluation;
  private String devicesn;
  private String dataStatus;
  private String status;
  private String cardNumber;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public Date getMeasureTime() {
    return measureTime;
  }

  public void setMeasureTime(Date measureTime) {
    this.measureTime = measureTime;
  }


  public String getIdentifyCard() {
    return identifyCard;
  }

  public void setIdentifyCard(String identifyCard) {
    this.identifyCard = identifyCard;
  }


  public double getMeatureValue() {
    return meatureValue;
  }

  public void setMeatureValue(double meatureValue) {
    this.meatureValue = meatureValue;
  }


  public String getEvaluation() {
    return evaluation;
  }

  public void setEvaluation(String evaluation) {
    this.evaluation = evaluation;
  }


  public String getDevicesn() {
    return devicesn;
  }

  public void setDevicesn(String devicesn) {
    this.devicesn = devicesn;
  }


  public String getDataStatus() {
    return dataStatus;
  }

  public void setDataStatus(String dataStatus) {
    this.dataStatus = dataStatus;
  }




  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }


  public String getCardNumber() {
    return cardNumber;
  }

  public void setCardNumber(String cardNumber) {
    this.cardNumber = cardNumber;
  }

}
