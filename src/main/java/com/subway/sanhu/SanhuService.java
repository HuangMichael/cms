package com.subway.sanhu;

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
 * 散户信息表业务类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Service
public class SanhuService extends BaseService {


    @Autowired
    SanhuRepository sanhuRepository;


    @Autowired
    CommonDataService commonDataService;

    public List<Sanhu> findAll() {
        return sanhuRepository.findAll();
    }


    public Page<Sanhu> findAll(Pageable pageable) {
        return sanhuRepository.findAll(pageable);
    }


    /**
     * @param id id
     * @return 根据id删除对象
     */
    public ReturnObject delete(Long id) {
        sanhuRepository.delete(id);
        Sanhu sanhu = sanhuRepository.getOne(id);
        return commonDataService.getReturnType(sanhu == null, DELETE_SUCCESS, DELETE_FAILURE);
    }


    /**
     * @param sanhu
     * @return 保存信息
     */
    public ReturnObject save(Sanhu sanhu) {

        sanhu = sanhuRepository.save(sanhu);
        return commonDataService.getReturnType(sanhu != null, SAVE_SUCCESS, SAVE_FAILURE);
    }


    public Sanhu findById(Long id) {
        return sanhuRepository.getOne(id);
    }

}
