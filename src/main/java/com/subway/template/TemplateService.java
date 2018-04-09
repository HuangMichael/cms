package com.subway.template;

import java.io.*;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.subway.domain.dev.App;
import com.subway.object.ReturnObject;
import com.subway.service.app.BaseService;
import com.subway.service.commonData.CommonDataService;
import com.subway.site.Site;
import com.subway.tableColumnConfig.TableColumnConfig;
import com.subway.tableConfig.TableConfig;
import com.subway.utils.ConstantUtils;
import com.subway.utils.StringUtils;
import com.subway.utils.autoCode.AutoGenerationJavaCode;
import com.sun.javafx.iio.ios.IosDescriptor;
import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import freemarker.template.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import static com.subway.utils.ConstantUtils.*;

/**
 * 模板管理业务类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Service
public class TemplateService extends BaseService {


    @Autowired
    CommonDataService commonDataService;


    @Autowired
    TemplateRepository templateRepository;


    /**
     * @param id
     * @return
     */
    public Template findById(Long id) {
        return templateRepository.getOne(id);
    }


    /**
     * @param id 模板id
     * @return 删除模板信息
     */
    public ReturnObject delete(Long id) {
        templateRepository.delete(id);
        Template template = templateRepository.getOne(id);
        return commonDataService.getReturnType(template == null, DELETE_SUCCESS, DELETE_FAILURE);
    }


    /**
     * @param template
     * @return 保存模板信息
     */
    public ReturnObject save(Template template) {

        template = templateRepository.save(template);
        return commonDataService.getReturnType(template != null, SAVE_SUCCESS, SAVE_FAILURE);
    }


    /**
     * @param myTemplate 网页模板
     * @return
     * @throws IOException
     * @throws TemplateException
     */
    public boolean genPage(Template myTemplate) throws IOException, TemplateException {
        Boolean result = false;
        Configuration cfg = new Configuration(new Version("2.3.27-incubating"));
        cfg.setDefaultEncoding("UTF-8");
        String templateDir = myTemplate.getTemplateUrl();
        //设置模板文件路径
        cfg.setDirectoryForTemplateLoading(new File(templateDir));
        freemarker.template.Template temp = cfg.getTemplate(myTemplate.getTemplateName(), "UTF-8");
        String fileUrl = myTemplate.getFileUrl();
        Map<String, Object> rootMap = new HashMap<>();
        File dir = new File(fileUrl);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        File docFile = new File(fileUrl + myTemplate.getFileName());
        if (!docFile.exists()) {
            Writer docOut = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(docFile), "UTF-8"));// 完美解决乱码
            temp.process(rootMap, docOut);
            result = true;
            log.info("文件" + docFile + "不存在，已经重新生成");
        }
        return result;
    }
}
