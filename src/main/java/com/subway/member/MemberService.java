package com.subway.member;

import com.subway.object.ReturnObject;
import com.subway.service.app.BaseService;
import com.subway.service.commonData.CommonDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.subway.utils.ConstantUtils.*;


/**
 * 会员信息表业务类
 *
 * @author huangbin
 * @generate by autoCode
 * @Date 2018-3-1
 */
@Service
public class MemberService extends BaseService {


    @Autowired
    MemberRepository memberRepository;


    @Autowired
    CommonDataService commonDataService;

    public List<Member> findAll() {
        return memberRepository.findAll();
    }


    public Page<Member> findAll(Pageable pageable) {
        return memberRepository.findAll(pageable);
    }


    /**
     * @param id id
     * @return 根据id删除对象
     */
    public ReturnObject delete(Long id) {
        memberRepository.delete(id);
        Member member = memberRepository.findOne(id);
        return commonDataService.getReturnType(member == null, DELETE_SUCCESS, DELETE_FAILURE);
    }


    /**
     * @param member
     * @return 保存信息
     */
    public ReturnObject save(Member member) {

        member = memberRepository.save(member);
        return commonDataService.getReturnType(member != null, SAVE_SUCCESS, SAVE_FAILURE);
    }


    /**
     * @param id
     * @return
     */
    public Member findById(Long id) {
        return memberRepository.getOne(id);
    }

}
