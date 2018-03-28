package com.subway.tableColumnConfig;

import com.subway.service.app.BaseService;
import com.subway.tableConfig.TableConfig;
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
public class TableColumnConfigService extends BaseService {


    @Autowired
    TableColumnConfigRepository tableColumnConfigRepository;

    /**
     * @return
     */
    public List<TableColumnConfig> findAll() {
        return tableColumnConfigRepository.findAll();
    }


    /**
     * @param pageable
     * @return
     */
    public Page<TableColumnConfig> findAll(Pageable pageable) {
        return tableColumnConfigRepository.findAll(pageable);
    }


    /**
     * @param id
     * @return
     */
    public TableColumnConfig findById(Long id) {
        return tableColumnConfigRepository.getOne(id);
    }


    /**
     * @param tableConfig
     * @param status
     * @return
     */
    public List<TableColumnConfig> findByTableConfigAndStatus(TableConfig tableConfig,String status) {
        return tableColumnConfigRepository.findByTableConfigAndStatus(tableConfig, status);
    }

}
