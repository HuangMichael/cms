package com.subway.pavilionAuthor;

import java.util.List;
import java.util.Map;

import com.subway.member.Member;
import com.subway.memberWorks.MemberWorks;
import com.subway.object.ReturnObject;
import com.subway.service.app.BaseService;
import com.subway.service.commonData.CommonDataService;
import com.subway.utils.ConstantUtils;
import com.subway.utils.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 * 展馆作者信息业务类
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
     * @return
     */
    public List<PavilionAuthor> findAll() {
        return pavilionAuthorRepository.findAll();
    }


    /**
     * @param pageable
     * @return
     */
    public Page<PavilionAuthor> findAll(Pageable pageable) {
        return pavilionAuthorRepository.findAll(pageable);
    }


    /**
     * @param id
     * @return
     */
    public PavilionAuthor findById(Long id) {
        return pavilionAuthorRepository.getOne(id);
    }


    /**
     * @param id 记录id
     * @return 根据id删除记录
     */
    public ReturnObject delete(Long id) {
        pavilionAuthorRepository.delete(id);
        PavilionAuthor pavilionAuthor = pavilionAuthorRepository.getOne(id);
        return commonDataService.getReturnType(pavilionAuthor == null, "记录删除成功", "记录删除失败");
    }

    /**
     * @param recordId 记录id
     * @param filePath 文件的路径
     */
    @Override
    public void writeUploadLog(String filePath, Long recordId) {
        PavilionAuthor pavilionAuthor = pavilionAuthorRepository.getOne(recordId);
        pavilionAuthor.setPhotoUrl(filePath);
        pavilionAuthor.setHasPhoto(ConstantUtils.STATUS_YES);
        pavilionAuthorRepository.save(pavilionAuthor);
    }

}
