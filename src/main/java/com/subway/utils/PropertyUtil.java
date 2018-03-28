package com.subway.utils;

import lombok.extern.slf4j.Slf4j;
import java.io.*;
import java.util.Properties;


/**
 * 从properties中读取配置项
 */

@Slf4j
public class PropertyUtil {
    private static Properties props;

    static {
        loadProps();
    }

    synchronized static private void loadProps() {
        log.info("开始加载properties文件内容.......");
        props = new Properties();
        InputStream in = null;
        try {
            in = PropertyUtil.class.getClassLoader().getResourceAsStream("autoCode.properties");
            props.load(in);
        } catch (FileNotFoundException e) {
            log.error("application.properties文件未找到");
        } catch (IOException e) {
            log.error("出现IOException");
        } finally {
            try {
                if (null != in) {
                    in.close();
                }
            } catch (IOException e) {
                log.error("jdbc.properties文件流关闭出现异常");
            }
        }
        log.info("加载properties文件内容完成...........");
        log.info("properties文件内容：" + props);
    }

    public static String getProperty(String key) {
        if (null == props) {
            loadProps();
        }
        return props.getProperty(key);
    }

    public static String getProperty(String key, String defaultValue) {
        if (null == props) {
            loadProps();
        }
        return props.getProperty(key, defaultValue);
    }
}
