package com.dlw.monitor.platform.mapper.second;


import java.util.List;

import com.dlw.monitor.platform.model.User;


public interface UserMapperOfOracle {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<User> selectAllUser();
}