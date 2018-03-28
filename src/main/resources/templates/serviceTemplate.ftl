package com.subway.${subDirName};

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
* ${comment}业务类
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/
@Service
public class ${className}Service extends BaseService {


@Autowired
${className}Repository ${subDirName}Repository;


@Autowired
CommonDataService commonDataService;

public List
<${className}> findAll() {
return  ${subDirName}Repository.findAll();
}


public Page< ${className}> findAll(Pageable pageable) {
return  ${subDirName}Repository.findAll(pageable);
}


/**
* @param id id
* @return 根据id删除对象
*/
public ReturnObject delete(Long id) {
${subDirName}Repository.delete(id);
${className} ${subDirName} = ${subDirName}Repository.findOne(id);
return commonDataService.getReturnType(${subDirName} == null, DELETE_SUCCESS, DELETE_FAILURE);
}


/**
* @param ${subDirName}
* @return 保存信息
*/
public ReturnObject save(${className} ${subDirName}) {

${subDirName} = ${subDirName}Repository.save(${subDirName});
return commonDataService.getReturnType(${subDirName} != null, SAVE_SUCCESS, SAVE_FAILURE);
}


public  ${className} findById(Long id) {
return  ${subDirName}Repository.getOne(id);
}

}
