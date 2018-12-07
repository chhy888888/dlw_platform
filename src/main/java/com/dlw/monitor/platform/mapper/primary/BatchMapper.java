package com.dlw.monitor.platform.mapper.primary;


import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.annotations.Param;


public interface BatchMapper {
    int deleteByPrimaryKey(Integer id);
    int updateBatch(List members);//批量更新
    List<HashMap<String,String>> selectAllByJD(@Param("sql")String sql);
}