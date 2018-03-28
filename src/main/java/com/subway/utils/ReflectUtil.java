package com.subway.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * 反射工具类
 */
public class ReflectUtil {
    /**
     * @param className
     * @return 获取类的属性
     */
    public static List<String> getFields(String className) {

        List<String> filedNameList = new ArrayList<>();
        Class clazz;
        try {
            clazz = Class.forName(className);
            Field[] fields = clazz.getDeclaredFields();
            for (Field field : fields) {
                filedNameList.add(field.getName());
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return filedNameList;
    }
}
