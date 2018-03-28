package com.subway.template;

import java.util.List;
import java.util.Map;

import com.subway.service.app.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

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
    TemplateRepository templateRepository;

    public List<Template> findAll() {
        return templateRepository.findAll();
    }


    public Page<Template> findAll(Pageable pageable) {
        return templateRepository.findAll(pageable);
    }


    public Template findById(Long id) {
        return templateRepository.getOne(id);
    }

}
