package com.dlw.monitor.platform.mapper.primary;


import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface BaseMapper {
	Integer delete(@Param("sql")String sql);

    Integer insert(@Param("sql")String sql);

    String selectByPrimaryKey(@Param("sql")String sql);

    Integer update(@Param("sql")String sql);

    List<HashMap<String,String>> selectAllByPage(@Param("sql")String sql);

}