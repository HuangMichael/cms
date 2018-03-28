package com.subway.cangwei;

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
 * 仓位信息表业务类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Service
public class CangweiService extends BaseService {


    @Autowired
    CangweiRepository cangweiRepository;


    @Autowired
    CommonDataService commonDataService;

    public List
            <Cangwei> findAll() {
        return cangweiRepository.findAll();
    }


    public Page<Cangwei> findAll(Pageable pageable) {
        return cangweiRepository.findAll(pageable);
    }


    /**
     * @param id id
     * @return 根据id删除对象
     */
    public ReturnObject delete(Long id) {
        cangweiRepository.delete(id);
        Cangwei cangwei = cangweiRepository.getOne(id);
        return commonDataService.getReturnType(cangwei == null, DELETE_SUCCESS, DELETE_FAILURE);
    }


    /**
     * @param cangwei
     * @return 保存信息
     */
    public ReturnObject save(Cangwei cangwei) {

        cangwei = cangweiRepository.save(cangwei);
        return commonDataService.getReturnType(cangwei != null, SAVE_SUCCESS, SAVE_FAILURE);
    }


    public Cangwei findById(Long id) {
        return cangweiRepository.getOne(id);
    }

}
