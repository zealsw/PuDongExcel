package com.hesicare.common.jobs;

import cn.hutool.http.Header;
import cn.hutool.http.HttpRequest;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.hesicare.common.utils.Constants;
import com.hesicare.common.utils.wonders.InterfaceEnCode;
import com.hesicare.health.dao.BmiDao;
import com.hesicare.health.dao.GlucoseDao;
import com.hesicare.health.dao.PressureDao;
import com.hesicare.health.dao.viewPressureDao;
import com.hesicare.health.entity.PatientBloodPressureView;
import com.hesicare.health.services.impl.Testccimpl;
import com.hesicare.health.services.testcc;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class job {
    @Autowired
    private viewPressureDao pressureDao;
    @Autowired
    private PressureJob  pressureJob;
    @Autowired
    private GlucoseJob glucoseJob;
    //@Scheduled(cron = "0 0/1 * * * ?")
    public void doPressure() throws Exception {
        pressureJob.doXueYaIt();

    }
   // @Scheduled(cron = "0 0/1 * * * ?")
    public void doGlucose() throws Exception {
        glucoseJob.doXueTangIt();

    }

}
