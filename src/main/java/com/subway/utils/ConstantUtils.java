package com.subway.utils;

/**
 * 定义常数
 */
public class ConstantUtils {
    public static final String STATUS_YES = "1"; //状态1 表示启用 有效 正常
    public static final String STATUS_NO = "0";  //状态0 表示禁用 无效 异常

    public static final String CONTEXT_PATH = "E:/dev/project2018/cms/src/main/webapp/";  //上下文路径
    public static final String GEN_FILE_PATH = "E:/dev/project2018/cms/";  //上下文路径

    public static final String ORDER_STATUS_REPORTED = "0"; //加入报修车
    public static final String ORDER_STATUS_SENT = "1"; //派工
    public static final String ORDER_STATUS_REPAIRING = "2"; //维修中
    public static final String ORDER_STATUS_FINISHED = "3"; //已完工
    public static final String ORDER_STATUS_ABORTED = "4"; //取消
    public static final String ORDER_STATUS_PAUSED = "5"; //暂停


    public static final String SAVE_SUCCESS = "信息保存成功"; //
    public static final String SAVE_FAILURE = "信息保存失败"; //发布
    public static final String DELETE_SUCCESS = "信息删除成功"; //发布
    public static final String DELETE_FAILURE = "信息删除失败"; //发布


    public static final String REPORT_FIX_SUCCESS = "报修成功"; //发布
    public static final String REPORT_FIX_FAILURE = "报修失败"; //发布


    public static final String ORDER_ABORT_SUCCESS = "工单取消成功"; //发布
    public static final String ORDER_ABORT_FAILURE = "工单取消失败"; //发布

}
