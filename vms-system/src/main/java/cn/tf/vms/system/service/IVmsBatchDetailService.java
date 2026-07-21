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
    public List<VmsBatchSummaryVo> selectBatchSummary(String batchNo, String branchOrgId, String status);
}
