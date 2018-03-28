package com.subway.columnsContent;
import com.subway.service.app.BaseService;
import com.subway.utils.search.SortedSearchable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.List;

/**
* 栏目内容业务查询类
*
* @author huangbin
* @generate by autoCode
* @Date 2018-3-1
*/
@Service
public class  ColumnsContentSearchService extends BaseService implements SortedSearchable {

@Autowired
ColumnsContentRepository  columnsContentRepository;


public List< ColumnsContent> findByConditions(String searchPhrase, int paramsSize) {
String array[] = super.assembleSearchArray(searchPhrase, paramsSize);
return  columnsContentRepository.findAll();
}


public Page< ColumnsContent> findByConditions(String searchPhrase, int paramsSize, Pageable pageable) {
String array[] = super.assembleSearchArray(searchPhrase, paramsSize);
return  columnsContentRepository.findAll( pageable);
}

}