package com.subway.service.app;

import com.subway.utils.ConstantUtils;
import com.subway.utils.UploadUtil;
import com.subway.utils.export.docType.ExcelDoc;
import com.subway.utils.export.exporter.DataExport;
import com.subway.utils.export.exporter.ExcelDataExporter;
import lombok.Data;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by huangbin  on 2016/5/20.
 * 日志对象
 */
@Service
@Data
public class BaseService {
    protected Log log = LogFactory.getLog(this.getClass());

    protected List dataList;

    /**
     * @param request  请求
     * @param response 响应
     * @param docName  文件名称
     * @param titles   标题
     * @param colNames 字段
     */
    public void exportExcel(HttpServletRequest request, HttpServletResponse response, String docName, String[] titles, String[] colNames) {
        DataExport dataExport = new ExcelDataExporter();
        try {
            dataExport.export(new ExcelDoc(), request, response, titles, colNames, this.getDataList(), docName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * @param searchPhrase 查询字符串
     * @param paramSize    参数个数
     * @return 组装查询参数数组
     */
    public String[] assembleSearchArray(String searchPhrase, int paramSize) {


        String array[] = new String[paramSize];
        if (!searchPhrase.isEmpty()) {
            array = searchPhrase.split(",", paramSize + 1);
        } else {
            for (int i = 0; i < paramSize; i++) {
                array[i] = "";
            }
        }

        return array;
    }


    /**
     * @param searchPhrase 查询字符串
     * @param paramSize    参数个数
     * @return 组装查询参数数组
     */
    public String[] assembleSearchArrayWithAuthKey(String searchPhrase, int paramSize) {
        String array[] = new String[paramSize + 1];
        if (!searchPhrase.isEmpty()) {
            array = searchPhrase.split(",", paramSize + 1);
        } else {
            for (int i = 0; i < paramSize; i++) {
                array[i] = "";
            }
        }
        array[paramSize] = "01";
        return array;
    }


    /**
     * @param searchPhrase 查询字符串
     * @param paramSize    参数个数
     * @param separatable  是否数据隔离
     * @return 组装查询参数数组
     */
    public String[] assembleSearchArray(String searchPhrase, int paramSize, Boolean separatable, String location) {
        String array[] = new String[paramSize + 1];
        if (!searchPhrase.isEmpty()) {
            array = searchPhrase.split(",", paramSize + 1);
        } else {
            for (int i = 0; i < paramSize; i++) {
                array[i] = "";
            }
        }
        if (separatable) {
            array[paramSize] = location;
        }
        return array;
    }


    /**
     * @param sortArray
     * @return 组装排序属性对象
     */
    public Sort assembleSort(String[] sortArray) {
        List<Sort.Order> orderList = new ArrayList<Sort.Order>();
        for (String str : sortArray) {
            orderList.add(new Sort.Order(str));
        }
        Sort sort = new Sort(orderList);
        return sort;

    }

    /**
     * @param list 批量保存
     */
    public void save(List list) {


    }


    /**
     * @param object
     */
    public Object save(Object object) {
        log.info("------------------------------------调用父类的保存方法");
        return object;
    }


    /**
     * @param file 多媒体文件
     * @return 上传文件
     */
    public Boolean upload(MultipartFile file, String tempDir, Long recordId) {
        String realDir = ConstantUtils.CONTEXT_PATH + "/upload/" + tempDir + "/";
        //项目多媒体存放的文件夹，加上时间戳来唯一标识该时间上传的所有的文件
        if (!UploadUtil.createDirectory(realDir)) {
            //目录创建失败则返回null，目录存在或者创建成功就继续执行
            return null;
        }
        String fileName = file.getOriginalFilename().replace(" ", "");//文件名，去掉文件名中的空格
        String filePath = realDir + "/" + fileName;//绝对文件路径
        boolean result = UploadUtil.uploadFile(file, filePath);//上传文件到Tomcat，作为临时文件;
        String relativePath = "/upload/" + tempDir + "/" + fileName;
        this.writeUploadLog(relativePath, recordId);
        return result;

    }


    /**
     * @param relativePath
     * @param recordId
     */
    public void writeUploadLog(String relativePath, Long recordId) {
        log.info("我是超类 啥也不干");
    }

}
