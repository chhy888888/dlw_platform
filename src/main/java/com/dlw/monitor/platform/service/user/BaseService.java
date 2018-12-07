package com.dlw.monitor.platform.service.user;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2017/8/16.
 */
public interface BaseService {

    String addEntity(String sql);
    String updateEntity(String sql);
    String deleteEntity(String sql);
    Map selectAllEntities(int pageNum, int pageSize,String sql,HttpServletRequest request);
}
