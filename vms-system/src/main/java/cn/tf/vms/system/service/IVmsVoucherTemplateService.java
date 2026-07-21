package cn.tf.vms.system.service;

import java.util.List;
import cn.tf.vms.system.domain.VmsVoucherTemplate;

/**
 * 凭证模版Service接口
 *
 * @author zhonghuanfang
 * @date 2026-07-21
 */
public interface IVmsVoucherTemplateService
{
    /**
     * 查询凭证模版
     *
     * @param oid 凭证模版主键
     * @return 凭证模版
     */
    public VmsVoucherTemplate selectVmsVoucherTemplateByOid(Long oid);

    /**
     * 查询凭证模版列表
     *
     * @param vmsVoucherTemplate 凭证模版
     * @return 凭证模版集合
     */
    public List<VmsVoucherTemplate> selectVmsVoucherTemplateList(VmsVoucherTemplate vmsVoucherTemplate);

    /**
     * 新增凭证模版
     *
     * @param vmsVoucherTemplate 凭证模版
     * @return 结果
     */
    public int insertVmsVoucherTemplate(VmsVoucherTemplate vmsVoucherTemplate);

    /**
     * 修改凭证模版
     *
     * @param vmsVoucherTemplate 凭证模版
     * @return 结果
     */
    public int updateVmsVoucherTemplate(VmsVoucherTemplate vmsVoucherTemplate);

    /**
     * 批量删除凭证模版
     *
     * @param oids 需要删除的凭证模版主键集合
     * @return 结果
     */
    public int deleteVmsVoucherTemplateByOids(Long[] oids);

    /**
     * 删除凭证模版信息
     *
     * @param oid 凭证模版主键
     * @return 结果
     */
    public int deleteVmsVoucherTemplateByOid(Long oid);
}
