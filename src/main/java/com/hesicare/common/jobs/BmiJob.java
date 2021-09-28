package com.hesicare.common.jobs;

import com.hesicare.common.utils.*;
import com.hesicare.common.utils.wonders.InterfaceEnCode;
import com.hesicare.health.dao.BmiDao;
import com.hesicare.health.entity.BloodGlucoseVo;
import com.hesicare.health.entity.PatientBmiView;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
@Service
public class BmiJob {
    @Autowired
    private BmiDao patientBmiViewDao;
    @Autowired
    static  String path_begin="D:/Hesicare/java项目/logs/sg/";
    static  String url="";
    public void doBmiIt() throws IOException {
         try{
            List<PatientBmiView> bmiview =patientBmiViewDao.selectList(null);
            for (PatientBmiView patientBmiView : bmiview) {
             //   HospitalEnum hospitalEnum=jobUtils.info(String.valueOf(patientBmiView.getDeptid()));
               // boolean result = requestSG(patientBmiView,hospitalEnum.getComcode(),hospitalEnum.getName());
                /*数据状态：1 发送成功， 2 在1 的基础上第二次发送成功   3   第一次发送失败  */
                /*if (result){
                    patientBmiViewDao.updatebyid(patientBmiView.getId(),(short) 1);
                             }
                else{
                    patientBmiViewDao.updatebyid(patientBmiView.getId(),(short) 3);
                    }*/
                Thread.sleep(1000);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }

    }
    public boolean requestSG(PatientBmiView patientBmiView, String comcode, String name) throws Exception {
        boolean resultSg=false;
        Patdata patdata = new Patdata();
        IdcardInfoExtractor idcardInfo = new IdcardInfoExtractor(String.valueOf(patientBmiView.getIdcard()));
        patdata.setPersoncard(patientBmiView.getIdcard());
        patdata.setMeasureTime(Constants.convert(Constants.convert(patientBmiView.getMearsureTime(), Constants.format2), Constants.format2));
        patdata.setMeasureSourceId(String.valueOf("0002"));
        patdata.setMeasureLocation(String.valueOf(1));
        patdata.setMeasureOrgId(comcode);
        patdata.setMeasureMode(String.valueOf(1));
        patdata.setDeviceId("2019082419072633005003");
        patdata.setDeviceType(String.valueOf("HS-3001"));
        BloodGlucoseVo bloodGlucoseVo=new BloodGlucoseVo();
        BloodGlucoseVo bloodGlucoseVo2=new BloodGlucoseVo();
        bloodGlucoseVo.setMeasureType("1003");
        bloodGlucoseVo.setMeasureData(patientBmiView.getHight());
        bloodGlucoseVo2.setMeasureType("1004");
        bloodGlucoseVo2.setMeasureData(patientBmiView.getWeight());
        List<BloodGlucoseVo> datalist = new ArrayList<BloodGlucoseVo>();
        datalist.add(bloodGlucoseVo);
        datalist.add(bloodGlucoseVo2);
        patdata.setDataList(datalist);
        Map<String, String> map = new HashMap<String, String>();
        JsonConfig jsonConfig = new JsonConfig();
        PropertyFilter filter = new PropertyFilter() {
            public boolean apply(Object object, String fieldName, Object fieldValue) {
                return null == fieldValue;
                                                                                     }
                                                                                      };
        jsonConfig.setJsonPropertyFilter(filter);
        JSONObject json = JSONObject.fromObject(patdata, jsonConfig);

        return resultSg;
    }
}
