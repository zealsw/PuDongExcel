package com.hesicare.common.controller;

import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.hesicare.common.jobs.PressureJob;
import com.hesicare.common.utils.wonders.InterfaceEnCode;
import com.hesicare.health.dao.PressureDao;
import com.hesicare.health.entity.BloodPressure;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class Recv {
    @Autowired
    private PressureDao  pressureDao;
    @Autowired
    private PressureJob pressureJob;
    @PostMapping(value ="/recvpressure" )
    @ResponseBody
    public  String recvpressure(@RequestBody  JSONObject jsonObject) throws Exception {
        String s = String.valueOf(jsonObject.get("param"));
        BloodPressure bloodPressure = JSONUtil.toBean(InterfaceEnCode.decrypt(s), BloodPressure.class);
        int insert = pressureDao.insert(bloodPressure);
        if(insert>0){
            return "success";
        }
        return "error";
    }
    @GetMapping(value ="/getExcel" )
    @ResponseBody
    public  String getExcel() throws Exception {
     pressureJob.doXueYaIt();
        return "error";
    }
}
