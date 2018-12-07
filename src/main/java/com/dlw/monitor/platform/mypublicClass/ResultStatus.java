package com.dlw.monitor.platform.mypublicClass;

/**
 * 返回结果状态值
 */
public class ResultStatus {
    public static final int UPLOAD_ERROR_CODE = 1000;
    public static final String  UPLOAD_ERROR_STRING = "上传失败";

    public static final String  COLLECTION_SUCCESS_STRING = "收藏成功";

    public static final String SUCESS_STRING = "成功";

    public static final int     ERROR_CODE = 9999 ;
    public static final String ERROR_STRING ="失败";

    public static final int SEND_ERROR_CODE =1001;
    public static final String SEND_ERROR_STRING ="发送失败";
    public static final String SEND_SUCCESS_STRING="发送成功";

    public static final int REGISTER_ERROR_CODE =1002;
    public static final String REGISTER_ERROR_STRING ="注册失败";
    public static final String REGISTER_SUCCESS_STRING="注册成功";

    public static final int EDIT_ERROR_CODE = 1003;
    public static final String EDIT_ERROR_STRING = "编辑失败";
    public static final String EDIT_SUCCESS_STRING = "编辑成功";

    public static final int LOGIN_ERROR_CODE =1004;
    public static final String  LOGIN_ERROR_STRING = "用户未登录";

    public static final int AUTHORITY_ERROR_CODE =1005;
    public static final String  AUTHORITY_ERROR_STRING = "用户没权限";

    public static final int     COLLECTION_ERROR_CODE = 1005;
    public static final String  COLLECTION_ERROR_STRING = "不能重复收藏";
}
