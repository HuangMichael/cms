package com.subway.object;

import lombok.Data;

/**
 * Created by huangbin on 2016/4/18.
 * 返回对象
 */
@Data
public class ReturnObject {
    private Boolean result;  //返回结果
    private String resultDesc;//返回描述
    private Object object;
}
