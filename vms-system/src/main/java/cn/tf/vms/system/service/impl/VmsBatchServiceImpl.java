package cn.tf.vms.system.service.impl;

import java.util.List;
import cn.tf.vms.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tf.vms.system.mapper.VmsBatchMapper;
import cn.tf.vms.system.domain.VmsBatch;
import cn.tf.vms.system.service.IVmsBatchService;

@Service
public class VmsBatchServiceImpl implements IVmsBatchService
{
    @Autowired
    private VmsBatchMapper vmsBatchMapper;

    @Override public VmsBatch selectVmsBatchByOid(Long oid) { return vmsBatchMapper.selectVmsBatchByOid(oid); }
    @Override public List<VmsBatch> selectVmsBatchList(VmsBatch vmsBatch) { return vmsBatchMapper.selectVmsBatchList(vmsBatch); }
    @Override public int insertVmsBatch(VmsBatch vmsBatch) { vmsBatch.setCreateTime(DateUtils.getNowDate()); return vmsBatchMapper.insertVmsBatch(vmsBatch); }
    @Override public int updateVmsBatch(VmsBatch vmsBatch) { vmsBatch.setUpdateTime(DateUtils.getNowDate()); return vmsBatchMapper.updateVmsBatch(vmsBatch); }
    @Override public int deleteVmsBatchByOids(Long[] oids) { return vmsBatchMapper.deleteVmsBatchByOids(oids); }
    @Override public int deleteVmsBatchByOid(Long oid) { return vmsBatchMapper.deleteVmsBatchByOid(oid); }
}
