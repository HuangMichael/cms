package com.subway.columnsContent;

import com.subway.object.ReturnObject;
import com.subway.service.app.BaseService;
import com.subway.service.commonData.CommonDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.subway.utils.ConstantUtils.*;


/**
 * 栏目内容业务类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Service
public class ColumnsContentService extends BaseService {


    @Autowired
    ColumnsContentRepository columnsContentRepository;


    @Autowired
    CommonDataService commonDataService;

    public List
            <ColumnsContent> findAll() {
        return columnsContentRepository.findAll();
    }


    public Page<ColumnsContent> findAll(Pageable pageable) {
        return columnsContentRepository.findAll(pageable);
    }


    /**
     * @param id id
     * @return 根据id删除对象
     */
    public ReturnObject delete(Long id) {
        columnsContentRepository.delete(id);
        ColumnsContent columnsContent = columnsContentRepository.findOne(id);
        return commonDataService.getReturnType(columnsContent == null, DELETE_SUCCESS, DELETE_FAILURE);
    }


    /**
     * @param columnsContent
     * @return 保存信息
     */
    public ReturnObject save(ColumnsContent columnsContent) {

        columnsContent = columnsContentRepository.save(columnsContent);
        return commonDataService.getReturnType(columnsContent != null, SAVE_SUCCESS, SAVE_FAILURE);
    }


    public ColumnsContent findById(Long id) {
        return columnsContentRepository.getOne(id);
    }

}
