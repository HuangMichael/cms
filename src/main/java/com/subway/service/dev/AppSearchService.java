package com.subway.service.dev;

import com.subway.dao.dev.AppRepository;
import com.subway.domain.dev.App;
import com.subway.service.app.BaseService;
import com.subway.utils.search.SortedSearchable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 应用查询业务类
 */
@Service
public class AppSearchService extends BaseService implements SortedSearchable {

    @Autowired
    AppRepository appRepository;

    /**
     * @param searchPhrase
     * @param paramsSize
     * @return
     */
    public List<App> findByConditions(String searchPhrase, int paramsSize) {
        String array[] = super.assembleSearchArray(searchPhrase, paramsSize);
        return appRepository.findByNameContaining(array[0]);
    }

    /**
     * @param searchPhrase
     * @param paramsSize
     * @return
     */
    public Page<App> findByConditions(String searchPhrase, int paramsSize, Pageable pageable) {
        String array[] = super.assembleSearchArray(searchPhrase, paramsSize);
        return appRepository.findByNameContaining(array[0], pageable);
    }


}
