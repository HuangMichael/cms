package com.subway.basicMenu;
import com.subway.service.app.BaseService;
import com.subway.utils.search.SortedSearchable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;

/**
* 菜单信息业务查询类
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/
@Service
public class  BasicMenuSearchService extends BaseService implements SortedSearchable {

@Autowired
BasicMenuRepository  basicMenuRepository;


public List< BasicMenu> findByConditions(String searchPhrase, int paramsSize) {
String array[] = super.assembleSearchArray(searchPhrase, paramsSize);
return  basicMenuRepository.findAll();
}


public Page< BasicMenu> findByConditions(String searchPhrase, int paramsSize, Pageable pageable) {
String array[] = super.assembleSearchArray(searchPhrase, paramsSize);
return  basicMenuRepository.findAll( pageable);
}

}