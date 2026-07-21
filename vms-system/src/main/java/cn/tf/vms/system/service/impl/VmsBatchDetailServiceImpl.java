package cn.tf.vms.system.service.impl;

import java.util.List;
import cn.tf.vms.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tf.vms.system.mapper.VmsBatchDetailMapper;
import cn.tf.vms.system.domain.VmsBatchDetail;
import cn.tf.vms.system.service.IVmsBatchDetailService;

import cn.tf.vms.system.domain.VmsBatchSummaryVo;
@Service
public class VmsBatchDetailServiceImpl implements IVmsBatchDetailService
{
    @Autowired
    private VmsBatchDetailMapper vmsBatchDetailMapper;

    @Override public VmsBatchDetail selectVmsBatchDetailByOid(Long oid) { return vmsBatchDetailMapper.selectVmsBatchDetailByOid(oid); }
    @Override public List<VmsBatchDetail> selectVmsBatchDetailList(VmsBatchDetail vmsBatchDetail) { return vmsBatchDetailMapper.selectVmsBatchDetailList(vmsBatchDetail); }
    @Override public int insertVmsBatchDetail(VmsBatchDetail vmsBatchDetail) { vmsBatchDetail.setCreateTime(DateUtils.getNowDate()); return vmsBatchDetailMapper.insertVmsBatchDetail(vmsBatchDetail); }
    @Override public int updateVmsBatchDetail(VmsBatchDetail vmsBatchDetail) { vmsBatchDetail.setUpdateTime(DateUtils.getNowDate()); return vmsBatchDetailMapper.updateVmsBatchDetail(vmsBatchDetail); }
    @Override public int deleteVmsBatchDetailByOids(Long[] oids) { return vmsBatchDetailMapper.deleteVmsBatchDetailByOids(oids); }
    @Override public List<VmsBatchSummaryVo> selectBatchSummary(String batchNo, String branchOrgId, String status) {
        if (branchOrgId != null && !branchOrgId.isEmpty()) { return vmsBatchDetailMapper.selectBranchSummary(batchNo, branchOrgId); }
        else { return vmsBatchDetailMapper.selectHeadSummary(batchNo, status); }
    }
    @Override public int deleteVmsBatchDetailByOid(Long oid) { return vmsBatchDetailMapper.deleteVmsBatchDetailByOid(oid); }
}
