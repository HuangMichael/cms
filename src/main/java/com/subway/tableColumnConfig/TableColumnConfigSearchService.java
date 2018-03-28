package com.subway.tableColumnConfig;

import com.subway.service.app.BaseService;
import com.subway.utils.ConstantUtils;
import com.subway.utils.search.SortedSearchable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Service
public class TableColumnConfigSearchService extends BaseService implements SortedSearchable {

    @Autowired
    TableColumnConfigRepository tableColumnConfigRepository;


    /**
     * @param searchPhrase 搜索关键字组合
     * @param paramsSize
     * @return
     */
    public List<TableColumnConfig> findByConditions(String searchPhrase, int paramsSize) {
        String array[] = super.assembleSearchArray(searchPhrase, paramsSize);
        return tableColumnConfigRepository.findByColDescContainingAndStatus(array[0], ConstantUtils.STATUS_YES);
    }


    /**
     * @param paramsSize
     * @param pageable
     * @return
     */
    public Page<TableColumnConfig> findByConditions(String searchPhrase, int paramsSize, Pageable pageable) {
        String array[] = super.assembleSearchArray(searchPhrase, paramsSize);
        return tableColumnConfigRepository.findByColDescContainingAndStatus(array[0], ConstantUtils.STATUS_YES, pageable);
    }

}