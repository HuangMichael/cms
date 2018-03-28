package com.subway.pavilionWorks;

import com.subway.object.ReturnObject;
import com.subway.service.app.BaseService;
import com.subway.service.commonData.CommonDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.subway.utils.ConstantUtils.SAVE_FAILURE;
import static com.subway.utils.ConstantUtils.SAVE_SUCCESS;

/**
 * 展馆作品信息业务类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Service
public class PavilionWorksService extends BaseService {


    @Autowired
    PavilionWorksRepository pavilionWorksRepository;

    @Autowired
    CommonDataService commonDataService;

    /**
     * @return
     */
    public List<PavilionWorks> findAll() {
        return pavilionWorksRepository.findAll();
    }


    /**
     * @param pageable
     * @return
     */
    public Page<PavilionWorks> findAll(Pageable pageable) {
        return pavilionWorksRepository.findAll(pageable);
    }


    /**
     * @param id
     * @returnl
     */
    public PavilionWorks findById(Long id) {
        return pavilionWorksRepository.getOne(id);
    }


    /**
     * @param id 记录id
     * @return 根据id删除记录
     */
    public ReturnObject delete(Long id) {
        pavilionWorksRepository.delete(id);
        PavilionWorks pavilionWorks = pavilionWorksRepository.getOne(id);
        return commonDataService.getReturnType(pavilionWorks == null, "记录删除成功", "记录删除失败");
    }



    /**
     * @param pavilionWorks
     * @return 保存信息
     */
    public ReturnObject save(PavilionWorks pavilionWorks) {
        pavilionWorks = pavilionWorksRepository.save(pavilionWorks);
        return commonDataService.getReturnType(pavilionWorks != null, SAVE_SUCCESS, SAVE_FAILURE);
    }



    /**
     * @param recordId 记录id
     * @param filePath 文件的路径
     */
    public void writeUploadLog(String filePath, Long recordId) {
        super.writeUploadLog(filePath, recordId);
        PavilionWorks pavilionWorks = pavilionWorksRepository.getOne(recordId);
        pavilionWorks.setPhotoUrl(filePath);
        pavilionWorksRepository.save(pavilionWorks);
    }

}
