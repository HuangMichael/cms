package com.subway.tableConfig;

import com.subway.object.ReturnObject;
import com.subway.service.app.BaseService;
import com.subway.service.commonData.CommonDataService;
import com.subway.tableColumnConfig.TableColumnConfig;
import com.subway.tableColumnConfig.TableColumnConfigRepository;
import com.subway.utils.ConstantUtils;
import com.subway.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.subway.utils.ConstantUtils.SAVE_FAILURE;
import static com.subway.utils.ConstantUtils.SAVE_SUCCESS;

/**
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Service
public class TableConfigService extends BaseService {


    @Autowired
    TableConfigRepository tableConfigRepository;


    @Autowired
    TableColumnConfigRepository tableColumnConfigRepository;


    @Autowired
    CommonDataService commonDataService;


    /**
     * @param id
     * @return 根据配置id查询
     */
    public TableConfig findById(Long id) {
        return tableConfigRepository.getOne(id);
    }




    /**
     * @return 查询所有表信息
     */
    public List<TableConfig> findAll() {
        return tableConfigRepository.findAll();
    }


    /**
     * @param id 表配置id
     * @return 更新配置数据
     * 将数据库字段修改为类属性
     */
    public ReturnObject formatConfig(Long id) {
        TableConfig tableConfig = tableConfigRepository.getOne(id);
        List<TableColumnConfig> tableColumnConfigList = tableColumnConfigRepository.findByTableConfigAndStatus(tableConfig, ConstantUtils.STATUS_YES);
        String originName;
        String classType;
        //下划线进行替换
        for (TableColumnConfig columnConfig : tableColumnConfigList) {
            originName = columnConfig.getColName();
            classType = columnConfig.getClassType();
            if (originName.contains("_")) {
                columnConfig.setColName(StringUtils.convertColName(originName));
            }
            if (classType.startsWith("varchar")) {
                columnConfig.setClassType("String");
            } else if (classType.contains("int")) {
                columnConfig.setClassType("Long");
            } else if (classType.contains("double")) {
                columnConfig.setClassType("Double");
            } else if (classType.contains("bit")) {
                columnConfig.setClassType("Boolean");
            }
            tableColumnConfigRepository.save(columnConfig);
        }
        return commonDataService.getReturnType(!tableColumnConfigList.isEmpty(), "数据列配置格式成功", "数据列配置格式失败");
    }


    /**
     * @param tableConfig 数据库表配置信息
     * @return
     */
    public ReturnObject save(TableConfig tableConfig) {

        tableConfig = tableConfigRepository.save(tableConfig);
        return commonDataService.getReturnType(tableConfig != null, SAVE_SUCCESS, SAVE_FAILURE);
    }

}
