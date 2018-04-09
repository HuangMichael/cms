package com.subway.template;

import java.util.List;
import java.util.Map;

import com.subway.object.ReturnObject;
import com.subway.service.app.BaseService;
import com.subway.service.commonData.CommonDataService;
import com.subway.site.Site;
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
     * @return
     */
    public List<Template> findAll() {
        return templateRepository.findAll();
    }


    public Page<Template> findAll(Pageable pageable) {
        return templateRepository.findAll(pageable);
    }


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

}
