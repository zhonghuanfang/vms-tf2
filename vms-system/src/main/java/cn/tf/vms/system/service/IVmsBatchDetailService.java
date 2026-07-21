package cn.tf.vms.system.service;

import java.util.List;
import cn.tf.vms.system.domain.VmsBatchDetail;

import cn.tf.vms.system.domain.VmsBatchSummaryVo;
public interface IVmsBatchDetailService
{
    public VmsBatchDetail selectVmsBatchDetailByOid(Long oid);
    public List<VmsBatchDetail> selectVmsBatchDetailList(VmsBatchDetail vmsBatchDetail);
    public int insertVmsBatchDetail(VmsBatchDetail vmsBatchDetail);
    public int updateVmsBatchDetail(VmsBatchDetail vmsBatchDetail);
    public int deleteVmsBatchDetailByOids(Long[] oids);
    public int deleteVmsBatchDetailByOid(Long oid);
    /** 带乐观锁的更新，返回受影响行数（0表示并发冲突） */
    public int updateDetailWithVersionCheck(VmsBatchDetail vmsBatchDetail);
    /** 带乐观锁的单条删除，返回受影响行数（0表示并发冲突） */
    public int deleteDetailWithVersionCheck(VmsBatchDetail vmsBatchDetail);
    public List<VmsBatchSummaryVo> selectBatchSummary(String batchNo, String branchOrgId, String status);
}
