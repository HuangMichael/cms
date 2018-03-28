package com.subway.basicMenu;

import java.util.List;
import java.util.Map;

import com.subway.service.app.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import com.subway.service.commonData.CommonDataService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.subway.object.ReturnObject;
import static com.subway.utils.ConstantUtils.*;


/**
* 菜单信息业务类
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/
@Service
public class BasicMenuService extends BaseService {


@Autowired
BasicMenuRepository basicMenuRepository;


@Autowired
CommonDataService commonDataService;

public List
<BasicMenu> findAll() {
return  basicMenuRepository.findAll();
}


public Page< BasicMenu> findAll(Pageable pageable) {
return  basicMenuRepository.findAll(pageable);
}


/**
* @param id id
* @return 根据id删除对象
*/
public ReturnObject delete(Long id) {
basicMenuRepository.delete(id);
BasicMenu basicMenu = basicMenuRepository.getOne(id);
return commonDataService.getReturnType(basicMenu == null, DELETE_SUCCESS, DELETE_FAILURE);
}


/**
* @param basicMenu
* @return 保存信息
*/
public ReturnObject save(BasicMenu basicMenu) {

basicMenu = basicMenuRepository.save(basicMenu);
return commonDataService.getReturnType(basicMenu != null, SAVE_SUCCESS, SAVE_FAILURE);
}


public  BasicMenu findById(Long id) {
return  basicMenuRepository.getOne(id);
}

}
