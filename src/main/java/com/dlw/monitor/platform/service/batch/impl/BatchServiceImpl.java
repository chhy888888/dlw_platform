package com.dlw.monitor.platform.service.batch.impl;

import org.springframework.stereotype.Service;

import com.dlw.monitor.platform.service.batch.BatchService;


/**
 * Created by Administrator on 2017/8/16.
 */
@Service(value = "batchService")
public class BatchServiceImpl implements BatchService {

    /*@Autowired
    private BatchMapper batchMapper;
    @Autowired
    private BaseService baseService;
    @Autowired
    private KsglMapper ksglMapper;*/

    
    /**
     * 查询是否可以阅卷
     * @param request
     */
    /*@Override
    public int selectYj(HttpServletRequest request){
     	Map<String,Object> mapUser = (Map) request.getSession().getAttribute("userMap");
     	String userId = mapUser.get("id")+"";
     	String sjId = request.getParameter("sjId");
     	String userid = request.getParameter("userId");
     	Date date=new Date();
     	DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     	String time=format.format(date);
     	StringBuffer sf = new StringBuffer();
     	sf.append("SELECT * FROM TM_DT WHERE SJ_ID ='").append(sjId).append("'");
     	sf.append(" AND USER_ID='").append(userid).append("'");
     	sf.append(" AND ( YJR_ID ='' OR YJR_ID IS NULL OR YJR_ID= '").append(userId).append("' OR timestampdiff(minute,XG_SJ,'");
     	sf.append(time).append("')>=120)");
    	List<HashMap<String,String>>list = batchMapper.selectAllByJD(sf.toString());
    	int count = list.size();
    	return count;
    }*/
}
