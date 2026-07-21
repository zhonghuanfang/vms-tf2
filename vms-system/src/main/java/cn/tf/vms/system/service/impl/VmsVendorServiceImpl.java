package cn.tf.vms.system.service.impl;

import java.util.List;
import cn.tf.vms.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tf.vms.system.mapper.VmsVendorMapper;
import cn.tf.vms.system.domain.VmsVendor;
import cn.tf.vms.system.service.IVmsVendorService;

/**
 * 厂商管理Service业务层处理
 *
 * @author zhonghuanfang
 * @date 2026-07-21
 */
@Service
public class VmsVendorServiceImpl implements IVmsVendorService
{
    @Autowired
    private VmsVendorMapper vmsVendorMapper;

    /**
     * 查询厂商管理
     *
     * @param oid 厂商管理主键
     * @return 厂商管理
     */
    @Override
    public VmsVendor selectVmsVendorByOid(Long oid)
    {
        return vmsVendorMapper.selectVmsVendorByOid(oid);
    }

    /**
     * 查询厂商管理列表
     *
     * @param vmsVendor 厂商管理
     * @return 厂商管理
     */
    @Override
    public List<VmsVendor> selectVmsVendorList(VmsVendor vmsVendor)
    {
        return vmsVendorMapper.selectVmsVendorList(vmsVendor);
    }

    /**
     * 新增厂商管理
     *
     * @param vmsVendor 厂商管理
     * @return 结果
     */
    @Override
    public int insertVmsVendor(VmsVendor vmsVendor)
    {
        vmsVendor.setCreateTime(DateUtils.getNowDate());
        return vmsVendorMapper.insertVmsVendor(vmsVendor);
    }

    /**
     * 修改厂商管理
     *
     * @param vmsVendor 厂商管理
     * @return 结果
     */
    @Override
    public int updateVmsVendor(VmsVendor vmsVendor)
    {
        vmsVendor.setUpdateTime(DateUtils.getNowDate());
        return vmsVendorMapper.updateVmsVendor(vmsVendor);
    }

    /**
     * 批量删除厂商管理
     *
     * @param oids 需要删除的厂商管理主键
     * @return 结果
     */
    @Override
    public int deleteVmsVendorByOids(Long[] oids)
    {
        return vmsVendorMapper.deleteVmsVendorByOids(oids);
    }

    /**
     * 删除厂商管理信息
     *
     * @param oid 厂商管理主键
     * @return 结果
     */
    @Override
    public int deleteVmsVendorByOid(Long oid)
    {
        return vmsVendorMapper.deleteVmsVendorByOid(oid);
    }
}
