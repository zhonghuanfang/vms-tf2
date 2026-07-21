package cn.tf.vms.system.service.impl;

import java.util.List;
import cn.tf.vms.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tf.vms.system.mapper.VmsVoucherTemplateMapper;
import cn.tf.vms.system.domain.VmsVoucherTemplate;
import cn.tf.vms.system.service.IVmsVoucherTemplateService;

/**
 * 凭证模版Service业务层处理
 *
 * @author zhonghuanfang
 * @date 2026-07-21
 */
@Service
public class VmsVoucherTemplateServiceImpl implements IVmsVoucherTemplateService
{
    @Autowired
    private VmsVoucherTemplateMapper vmsVoucherTemplateMapper;

    /**
     * 查询凭证模版
     *
     * @param oid 凭证模版主键
     * @return 凭证模版
     */
    @Override
    public VmsVoucherTemplate selectVmsVoucherTemplateByOid(Long oid)
    {
        return vmsVoucherTemplateMapper.selectVmsVoucherTemplateByOid(oid);
    }

    /**
     * 查询凭证模版列表
     *
     * @param vmsVoucherTemplate 凭证模版
     * @return 凭证模版
     */
    @Override
    public List<VmsVoucherTemplate> selectVmsVoucherTemplateList(VmsVoucherTemplate vmsVoucherTemplate)
    {
        return vmsVoucherTemplateMapper.selectVmsVoucherTemplateList(vmsVoucherTemplate);
    }

    /**
     * 新增凭证模版
     *
     * @param vmsVoucherTemplate 凭证模版
     * @return 结果
     */
    @Override
    public int insertVmsVoucherTemplate(VmsVoucherTemplate vmsVoucherTemplate)
    {
        vmsVoucherTemplate.setCreateTime(DateUtils.getNowDate());
        return vmsVoucherTemplateMapper.insertVmsVoucherTemplate(vmsVoucherTemplate);
    }

    /**
     * 修改凭证模版
     *
     * @param vmsVoucherTemplate 凭证模版
     * @return 结果
     */
    @Override
    public int updateVmsVoucherTemplate(VmsVoucherTemplate vmsVoucherTemplate)
    {
        vmsVoucherTemplate.setUpdateTime(DateUtils.getNowDate());
        return vmsVoucherTemplateMapper.updateVmsVoucherTemplate(vmsVoucherTemplate);
    }

    /**
     * 批量删除凭证模版
     *
     * @param oids 需要删除的凭证模版主键
     * @return 结果
     */
    @Override
    public int deleteVmsVoucherTemplateByOids(Long[] oids)
    {
        return vmsVoucherTemplateMapper.deleteVmsVoucherTemplateByOids(oids);
    }

    /**
     * 删除凭证模版信息
     *
     * @param oid 凭证模版主键
     * @return 结果
     */
    @Override
    public int deleteVmsVoucherTemplateByOid(Long oid)
    {
        return vmsVoucherTemplateMapper.deleteVmsVoucherTemplateByOid(oid);
    }
}
