package com.hesicare.common.jobs;

import cn.hutool.core.map.MapUtil;
import cn.hutool.json.JSONUtil;
import cn.hutool.log.StaticLog;
import cn.hutool.poi.excel.BigExcelWriter;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hesicare.common.utils.Constants;
import com.hesicare.common.utils.HospitalEnum;
import com.hesicare.common.utils.IdcardInfoExtractor;
import com.hesicare.common.utils.Pwdbpdata;
import com.hesicare.common.utils.wonders.InterfaceEnCode;
import com.hesicare.health.dao.PressureDao;
import com.hesicare.health.entity.BloodPressure;
import com.hesicare.health.entity.BloodPressureVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;
@Service
public class PressureJob {
    @Autowired
    private PressureDao bloodPressureDAO;
    private static  String path_begin="D:/Hesicare/java项目/logs/bp/";
    public void doXueYaIt() throws IOException {
        StaticLog.info("血压定时器启动");
        try {
            QueryWrapper<BloodPressure> newpatientQueryWrapper = new QueryWrapper();
            newpatientQueryWrapper.eq("status",1);
            List<BloodPressure> bloodPressures = bloodPressureDAO.selectList(newpatientQueryWrapper);
            Map<String, List<BloodPressure>> groupBy=bloodPressures.stream().collect(Collectors.groupingBy(BloodPressure::getParentId));
            JSONObject jsonObject = JSONObject.fromObject(groupBy);
            Iterator<Map.Entry<String, List<BloodPressure>>> it = jsonObject.entrySet().iterator();
            List<Pwdbpdata> pwdlist=new ArrayList<>();
            while (it.hasNext()) {
                Map.Entry<String, List<BloodPressure>> entry = it.next();
                JSONArray list = (JSONArray) entry.getValue();
                List<BloodPressure> bplist = (List<BloodPressure>) JSONArray.toCollection(list, BloodPressure.class);
                sortClass sort = new sortClass();
                Collections.sort(bplist, sort);
                if (String.valueOf(bplist.get(0).getIdentifyCard()).length()<15){
                    continue;
                }
                if (StringUtils.isBlank(bplist.get(0).getMeasureTime())){
                    continue;
                }
                if (StringUtils.isBlank(bplist.get(0).getHand())){
                    continue;
                }
                if (StringUtils.isBlank(String.valueOf(bplist.get(0).getDiastolic()))){
                    continue;
                }
                if (StringUtils.isBlank(String.valueOf(bplist.get(0).getSystolic()))){
                    continue;
                }
                if (bplist.size()<=2) {
                    continue;
                }
             /*   if (String.valueOf(bplist.get(0).getIsAverage()).equals("0")) {
                    continue;
                }*/
                if (String.valueOf(bplist.get(bplist.size()-1).getIsAverage()).equals("0")) {
                    continue;
                }
                Pwdbpdata result=requestBP(bplist);
                pwdlist.add(result);
                /*数据状态：1 发送成功， 2 在1 的基础上第二次发送成功   3   第一次发送失败  */
               /* if (result) {
                    for (BloodPressure bpdata : bplist){
                        bloodPressureDAO.updatebyid(bpdata.getId(), (short) 2);
                    }
                }
                else{
                    for (BloodPressure bpdata : bplist){
                        bloodPressureDAO.updatebyid(bpdata.getId(), (short) 3);
                    }
                }*/
                //Thread.sleep(1000);
            }
            pr(pwdlist);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public class sortClass implements Comparator {
        public int compare(Object arg0, Object arg1) {
            BloodPressure bp0 = (BloodPressure) arg0;
            BloodPressure bp1 = (BloodPressure) arg1;
            int flag = String.valueOf(bp0.getId()).compareTo(String.valueOf(bp1.getId()));
            return flag;
        }
    }

    /*卡号长度为9:芯片卡(社保卡)
     * 卡号长度为10:磁条卡
     * 0.社保卡 1.医保卡*/

    public Pwdbpdata requestBP(List<BloodPressure> bplist) throws Exception {
        boolean requestBP = false;
        String url = "http://10.232.135.22:9071/measure/api/chronic/submit";
        Pwdbpdata bpdata = new Pwdbpdata();
        BloodPressure bp = bplist.get(0);
        IdcardInfoExtractor idcardInfo = new IdcardInfoExtractor(String.valueOf(bp.getIdentifyCard().trim()));
        bpdata.setSfzhm(String.valueOf(bp.getIdentifyCard()).toUpperCase());
        bpdata.setClDate(Constants.convert(Constants.convert(bp.getMeasureTime(), "yyyy-MM-dd"), "yyyy-MM-dd"));
        bpdata.setClff(String.valueOf(1));
        bpdata.setClysNm(String.valueOf("XXX"));
        bpdata.setClysNo(String.valueOf(0));
        if (StringUtils.isNotBlank(String.valueOf(bp.getBirth()))) {
            bpdata.setCsDate(bp.getBirth());
        } else if (StringUtils.isNotBlank(String.valueOf(idcardInfo)) && idcardInfo.getBirthday() != null) {
            bpdata.setCsDate(Constants.convert(idcardInfo.getBirthday(), "yyyy-MM-dd"));
        } else {

            bpdata.setCsDate("");
        }
        bpdata.setJykh(bp.getCardNumber());
          if (StringUtils.isNotEmpty(bp.getCardNumber())&&bp.getCardNumber().length()==9){
            bpdata.setJyklx(String.valueOf("0"));}
            else{
            bpdata.setJyklx(String.valueOf("1"));}


        bpdata.setMeterNo(bplist.get(0).getDevicesn());
        bpdata.setMeterType(String.valueOf("AND:TM-2656VP"));
        bpdata.setOrg("42505784600");
        bpdata.setSourceId(String.valueOf("02"));
        bpdata.setStationId(String.valueOf("000"));

        if (StringUtils.isBlank(String.valueOf(idcardInfo.getGender()))) {
            bpdata.setXb("");
        } else if (StringUtils.isNotBlank(String.valueOf(idcardInfo.getGender())) && String.valueOf(idcardInfo.getGender()).equals("0")) {
            bpdata.setXb(String.valueOf("2"));
        } else {
            bpdata.setXb(idcardInfo.getGender());
        }

        bpdata.setXm(bp.getName());

        if (bp.getHand().equals("left")) {
            bpdata.setClsb("1");
        } else if (bp.getHand().equals("right")) {
            bpdata.setClsb("2");
        }
        else {
            bpdata.setClsb("3");
        }

        if (bplist.size() == 3) {

            BloodPressure bp1 = bplist.get(1);

            bpdata.setBgzmbjcTimes1("0");
            bpdata.setDbp1(bp1.getDiastolic());
            bpdata.setSbp1(bp1.getSystolic());
            bpdata.setMb1(bp1.getPluse());
            bpdata.setStydjcTimes1("0");
            bpdata.setFinishTime1(
                    Constants.convert(Constants.convert(bp1.getMeasureTime(), "yyyy-MM-dd HH:mm:ss"), "yyyy-MM-dd HH:mm:ss"));

            BloodPressure bp2 = bplist.get(2);
            bpdata.setBgzmbjcTimes2("0");
            bpdata.setDbp2(bp2.getDiastolic());
            bpdata.setSbp2(bp2.getSystolic());
            bpdata.setMb2(bp2.getPluse());
            bpdata.setStydjcTimes2("0");
            bpdata.setFinishTime2(
                    Constants.convert(Constants.convert(bp2.getMeasureTime(), "yyyy-MM-dd HH:mm:ss"), "yyyy-MM-dd HH:mm:ss"));

            BloodPressure bp3 = bplist.get(0);
            bpdata.setSbpAve(bp3.getSystolic());
            bpdata.setDbpAve(bp3.getDiastolic());
            bpdata.setMbAve(bp3.getPluse());
        }
        else if (bplist.size() >= 4) {

            BloodPressure bp1 = bplist.get(1);


            bpdata.setBgzmbjcTimes1("0");
            bpdata.setDbp1(bp1.getDiastolic());
            bpdata.setSbp1(bp1.getSystolic());
            bpdata.setMb1(bp1.getPluse());
            bpdata.setStydjcTimes1("0");
            bpdata.setFinishTime1(
                    Constants.convert(Constants.convert(bp1.getMeasureTime(), "yyyy-MM-dd HH:mm:ss"), "yyyy-MM-dd HH:mm:ss"));
            BloodPressure bp2 = bplist.get(2);
            bpdata.setBgzmbjcTimes2("0");
            bpdata.setDbp2(bp2.getDiastolic());
            bpdata.setSbp2(bp2.getSystolic());
            bpdata.setMb2(bp2.getPluse());
            bpdata.setStydjcTimes2("0");
            bpdata.setFinishTime2(
                    Constants.convert(Constants.convert(bp2.getMeasureTime(), "yyyy-MM-dd HH:mm:ss"), "yyyy-MM-dd HH:mm:ss"));

            BloodPressure bp3 = bplist.get(3);
            bpdata.setBgzmbjcTimes3("0");
            bpdata.setDbp3(bp3.getDiastolic());
            bpdata.setSbp3(bp3.getSystolic());
            bpdata.setMb3(bp3.getPluse());
            bpdata.setStydjcTimes3("0");
            bpdata.setFinishTime3(
                    Constants.convert(Constants.convert(bp3.getMeasureTime(), "yyyy-MM-dd HH:mm:ss"), "yyyy-MM-dd HH:mm:ss"));

            BloodPressure bp4 = bplist.get(0);
            bpdata.setSbpAve(bp4.getSystolic());
            bpdata.setDbpAve(bp4.getDiastolic());
            bpdata.setMbAve(bp4.getPluse());
        }
        List<Pwdbpdata> datalist = new ArrayList<>();
        datalist.add(bpdata);
        



        JsonConfig jsonConfig = new JsonConfig();
        PropertyFilter filter = new PropertyFilter() {
            public boolean apply(Object object, String fieldName, Object fieldValue) {
                return null == fieldValue;
            }
        };
        jsonConfig.setJsonPropertyFilter(filter);
        JSONObject json = JSONObject.fromObject(bpdata, jsonConfig);
        return bpdata;


 /*       StaticLog.info("请求参数 :{} ",json.toString());
        String result = sendHttpPost(url, json.toString());
        JSONObject resultJson = JSONObject.fromObject(result);
        String code = resultJson.getString("errno");
        if (code.equals("0")) {
            requestBP = true;
        }
        StaticLog.info("返回结果 :{} ",result);
        return requestBP;*/
    }
    void pr(List<Pwdbpdata> list){
        // 通过工具类创建writer
        BigExcelWriter writer = ExcelUtil.getBigWriter("c:/YW/a.xlsx");
// 合并单元格后的标题行，使用默认标题样式
// 一次性写出内容，使用默认样式，强制输出标题
        writer.write(list);
// 关闭writer，释放内存
        writer.close();
    }

}
