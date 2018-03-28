package com.subway.location;

import com.subway.service.app.BaseService;
import com.subway.utils.search.SortedSearchable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 位置信息查询业务类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Service
public class LocationSearchService extends BaseService implements SortedSearchable {

    @Autowired
    LocationRepository locationRepository;


    /**
     * @param searchPhrase 搜索关键字组合
     * @param paramsSize 参数个数
     * @return
     */
    public List<Location> findByConditions(String searchPhrase, int paramsSize) {
        String array[] = super.assembleSearchArrayWithAuthKey(searchPhrase, paramsSize);
        return locationRepository.findByLocNameContainingAndStatusAndAuthKeyStartingWith(array[0], array[1],"01");
    }


    /**
     * @param searchPhrase 搜索关键字组合
     * @param paramsSize
     * @param pageable
     * @return
     */
    public Page<Location> findByConditions(String searchPhrase, int paramsSize, Pageable pageable) {
        String array[] = super.assembleSearchArray(searchPhrase, paramsSize);
        return locationRepository.findByLocNameContainingAndStatusAndAuthKeyStartingWith(array[0], array[1],"01", pageable);
    }

}