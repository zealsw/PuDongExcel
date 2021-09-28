package com.hesicare.health.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hesicare.health.entity.BloodPressure;
import com.hesicare.health.entity.PatientBloodPressureView;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface viewPressureDao extends BaseMapper<PatientBloodPressureView> {
    @Update("update patient_blood_pressure_view set  data_status=#{status} where id=#{id}")
    int updatebyid(@Param("id") Long id, @Param("status") int status);
        }
