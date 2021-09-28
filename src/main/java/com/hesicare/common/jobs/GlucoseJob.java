package com.hesicare.common.jobs;

import cn.hutool.core.date.DateUtil;
import cn.hutool.log.StaticLog;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hesicare.common.utils.*;
import com.hesicare.common.utils.wonders.InterfaceEnCode;
import com.hesicare.health.dao.GlucoseDao;
import com.hesicare.health.dao.PressureDao;
import com.hesicare.health.entity.BloodGlucose;
import com.hesicare.health.entity.BloodGlucoseVo;
import com.hesicare.health.entity.BloodPressure;
/*import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;*/
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
@Service
public class GlucoseJob {
    @Autowired
    private GlucoseDao glucoseDao;
    @Autowired
    public void doXueTangIt() throws IOException {
        StaticLog.info("血糖定时器启动");
        try {
            QueryWrapper<BloodGlucose> newpatientQueryWrapper = new QueryWrapper();
            newpatientQueryWrapper.eq("data_status",1);
            List<BloodGlucose> bloodGlucoses1 =glucoseDao.selectList(newpatientQueryWrapper);
            for (BloodGlucose bloodGlucose : bloodGlucoses1) {
                boolean result = requestXT(bloodGlucose);
                if (result) {
                    glucoseDao.updatebyid(bloodGlucose.getId(),"2");
                }
                else{
                    glucoseDao.updatebyid(bloodGlucose.getId(),"3");
                }
                Thread.sleep(1000);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean requestXT(BloodGlucose bloodGlucose) throws Exception {
        boolean requestXT = false;
        String url = "http://10.232.135.22:9071/measure/api/patSignSubmit";
        Patdata patdata = new Patdata();
        IdcardInfoExtractor idcardInfo = new IdcardInfoExtractor(String.valueOf(bloodGlucose.getIdentifyCard()));
        patdata.setPersoncard(bloodGlucose.getIdentifyCard());
        patdata.setMeasureTime(String.valueOf(DateUtil.date(bloodGlucose.getMeasureTime()).toString()));
        patdata.setMeasureSourceId(String.valueOf("0001"));
        patdata.setMeasureLocation(String.valueOf(1));
        patdata.setMeasureOrgId("42505784600");
        patdata.setMeasureMode(String.valueOf(1));
        patdata.setDeviceId(bloodGlucose.getDevicesn());
        patdata.setDeviceType(String.valueOf("Ascensia"));

        BloodGlucoseVo bloodGlucoseVo=new BloodGlucoseVo();

        String bgStatus = bloodGlucose.getStatus();
        String status = "";
        switch (bgStatus) {
            case "KF":
                status = "1";
                break;
            case "CH":
                status = "2";
                break;
            case "ZCH":
                status = "2";
                break;
            case "WUCQ":
                status = "1";
                break;
            case "WUCH":
                status = "2";
                break;
            case "WACQ":
                status = "1";
                break;
            case "WACH":
                status = "2";
                break;
            case "SQ":
                status = "3";
                break;
            case "LC":
                status = "3";
                break;
            case "LC3":
                status = "3";
                break;
            case "SJ":
                status = "3";
                break;
            default:
                break;
        }

        Double value = bloodGlucose.getMeatureValue();
        String resultBg = "";

        if (value < 3.3) {
            resultBg ="4";
        }else if (!value.equals(991) && !value.equals(990) && value > 11.0){
            resultBg ="3";
        }else if (value.equals(991) || value.equals(990)){
            resultBg ="2";
        }else
            resultBg = "1";
        bloodGlucoseVo.setMeasureType("2001");
        bloodGlucoseVo.setMeasureData(bloodGlucose.getMeatureValue()+"|"+"mmol/L" +"|"+"0.6-33.3"+"|"+resultBg+"|"+status+"|"+ "1");
        List<BloodGlucoseVo> datalist = new ArrayList<BloodGlucoseVo>();
        datalist.add(bloodGlucoseVo);
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

        return requestXT;
    }
    }
