package com.hesicare.health.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hesicare.health.entity.A;
import com.hesicare.health.entity.BloodPressure;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ADao extends BaseMapper<A> {
}
