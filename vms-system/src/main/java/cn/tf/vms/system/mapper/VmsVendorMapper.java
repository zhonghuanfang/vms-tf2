package cn.tf.vms.system.mapper;

import java.util.List;
import cn.tf.vms.system.domain.VmsVendor;

/**
 * 厂商管理Mapper接口
 *
 * @author zhonghuanfang
 * @date 2026-07-21
 */
public interface VmsVendorMapper
{
    /**
     * 查询厂商管理
     *
     * @param oid 厂商管理主键
     * @return 厂商管理
     */
    public VmsVendor selectVmsVendorByOid(Long oid);

    /**
     * 查询厂商管理列表
     *
     * @param vmsVendor 厂商管理
     * @return 厂商管理集合
     */
    public List<VmsVendor> selectVmsVendorList(VmsVendor vmsVendor);

    /**
     * 新增厂商管理
     *
     * @param vmsVendor 厂商管理
     * @return 结果
     */
    public int insertVmsVendor(VmsVendor vmsVendor);

    /**
     * 修改厂商管理
     *
     * @param vmsVendor 厂商管理
     * @return 结果
     */
    public int updateVmsVendor(VmsVendor vmsVendor);

    /**
     * 删除厂商管理
     *
     * @param oid 厂商管理主键
     * @return 结果
     */
    public int deleteVmsVendorByOid(Long oid);

    /**
     * 批量删除厂商管理
     *
     * @param oids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVmsVendorByOids(Long[] oids);
}
