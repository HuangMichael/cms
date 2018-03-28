package com.subway.pavilionAuthor;

import com.subway.object.ReturnObject;
import com.subway.service.app.BaseService;
import com.subway.service.commonData.CommonDataService;
import com.subway.utils.ConstantUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.subway.utils.ConstantUtils.*;

/**
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Service
public class PavilionAuthorService extends BaseService {


    @Autowired
    PavilionAuthorRepository pavilionAuthorRepository;


    @Autowired
    CommonDataService commonDataService;

    /**
     * @param id
     * @return
     */
    public PavilionAuthor findById(Long id) {
        return pavilionAuthorRepository.getOne(id);
    }


    /**
     * @param id
     * @return
     */
    public ReturnObject delete(Long id) {
        pavilionAuthorRepository.delete(id);
        PavilionAuthor pavilionAuthor = pavilionAuthorRepository.getOne(id);
        return commonDataService.getReturnType(pavilionAuthor == null, DELETE_SUCCESS, DELETE_FAILURE);
    }




    /**
     * @param pavilionAuthor
     * @return 保存信息
     */
    public ReturnObject save( PavilionAuthor pavilionAuthor) {
        pavilionAuthor = pavilionAuthorRepository.save(pavilionAuthor);
        return commonDataService.getReturnType(pavilionAuthor != null, SAVE_SUCCESS, SAVE_FAILURE);
    }


    /**
     * @param filePath
     * @param recordId
     * 写入上传日志
     */
    @Override
    public void writeUploadLog(String filePath, Long recordId) {
        PavilionAuthor pavilionAuthor = pavilionAuthorRepository.getOne(recordId);
        pavilionAuthor.setPhotoUrl(filePath);
        pavilionAuthor.setHasPhoto(ConstantUtils.STATUS_YES);
        pavilionAuthorRepository.save(pavilionAuthor);
    }

}
