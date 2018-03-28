package com.subway.columns;

import com.subway.object.ReturnObject;
import com.subway.service.app.BaseService;
import com.subway.service.commonData.CommonDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.subway.utils.ConstantUtils.*;


/**
 * 栏目信息业务类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Service
public class ColumnsService extends BaseService {


    @Autowired
    ColumnsRepository columnsRepository;


    @Autowired
    CommonDataService commonDataService;

    /**
     * @param id id
     * @return 根据id删除对象
     */
    public ReturnObject delete(Long id) {
        columnsRepository.delete(id);
        Columns columns = columnsRepository.findOne(id);
        return commonDataService.getReturnType(columns == null, DELETE_SUCCESS, DELETE_FAILURE);
    }


    /**
     * @param columns
     * @return 保存信息
     */
    public ReturnObject save(Columns columns) {

        columns = columnsRepository.save(columns);
        return commonDataService.getReturnType(columns != null, SAVE_SUCCESS, SAVE_FAILURE);
    }


    /**
     * @param id
     * @return
     */
    public Columns findById(Long id) {
        return columnsRepository.getOne(id);
    }

}
