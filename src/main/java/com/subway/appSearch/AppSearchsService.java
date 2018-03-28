package com.subway.appSearch;

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
* 应用查询配置表业务类
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/
@Service
public class AppSearchsService extends BaseService {


@Autowired
AppSearchRepository appSearchRepository;


@Autowired
CommonDataService commonDataService;

public List
<AppSearch> findAll() {
return  appSearchRepository.findAll();
}


public Page< AppSearch> findAll(Pageable pageable) {
return  appSearchRepository.findAll(pageable);
}


/**
* @param id id
* @return 根据id删除对象
*/
public ReturnObject delete(Long id) {
appSearchRepository.delete(id);
AppSearch appSearch = appSearchRepository.getOne(id);
return commonDataService.getReturnType(appSearch == null, DELETE_SUCCESS, DELETE_FAILURE);
}


/**
* @param appSearch
* @return 保存信息
*/
public ReturnObject save(AppSearch appSearch) {

appSearch = appSearchRepository.save(appSearch);
return commonDataService.getReturnType(appSearch != null, SAVE_SUCCESS, SAVE_FAILURE);
}


public  AppSearch findById(Long id) {
return  appSearchRepository.getOne(id);
}

}
