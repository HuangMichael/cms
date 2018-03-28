package com.subway.memberWorks;

import com.subway.object.ReturnObject;
import com.subway.service.app.BaseService;
import com.subway.service.commonData.CommonDataService;
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
public class MemberWorksService extends BaseService {


    @Autowired
    MemberWorksRepository memberWorksRepository;

    @Autowired
    CommonDataService commonDataService;


    /**
     * @param memberWorks
     * @return 保存信息
     */
    public ReturnObject save(MemberWorks memberWorks) {
        memberWorks = memberWorksRepository.save(memberWorks);
        return commonDataService.getReturnType(memberWorks != null, SAVE_SUCCESS, SAVE_FAILURE);
    }


    /**
     * @param id
     * @return 查询会员作品
     */
    public MemberWorks findById(Long id) {
        return memberWorksRepository.getOne(id);
    }


    /**
     * @param id
     * @return 删除记录
     */
    public ReturnObject delete(Long id) {
        memberWorksRepository.delete(id);
        MemberWorks memberWorks = memberWorksRepository.getOne(id);
        return commonDataService.getReturnType(memberWorks == null, DELETE_SUCCESS, DELETE_FAILURE);
    }


    /**
     * @param filePath 文件路径
     * @param recordId 上传会员作品
     */
    @Override
    public void writeUploadLog(String filePath, Long recordId) {
        MemberWorks memberWorks = memberWorksRepository.getOne(recordId);
        memberWorks.setPhotoUrl(filePath);
        memberWorksRepository.save(memberWorks);
    }
}
