package com.subway.pavilionAuthor;

import com.subway.service.app.BaseService;
import com.subway.utils.ConstantUtils;
import com.subway.utils.search.SortedSearchable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 展馆作者信息业务查询类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Service
public class PavilionAuthorSearchService extends BaseService implements SortedSearchable {

    @Autowired
    PavilionAuthorRepository pavilionAuthorRepository;


    public List<PavilionAuthor> findByConditions(String searchPhrase, int paramsSize) {
        String array[] = super.assembleSearchArray(searchPhrase, paramsSize);
        return pavilionAuthorRepository.findByNameContainingAndStatus(array[0], ConstantUtils.STATUS_YES);
    }


    public Page<PavilionAuthor> findByConditions(String searchPhrase, int paramsSize, Pageable pageable) {
        String array[] = super.assembleSearchArray(searchPhrase, paramsSize);
        return pavilionAuthorRepository.findByNameContainingAndStatus(array[0], ConstantUtils.STATUS_YES,pageable);
    }

}