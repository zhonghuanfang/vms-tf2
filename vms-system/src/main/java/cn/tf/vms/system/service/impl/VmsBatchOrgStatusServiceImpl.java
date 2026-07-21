package cn.tf.vms.system.service.impl;

import java.util.List;
import cn.tf.vms.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tf.vms.system.mapper.VmsBatchOrgStatusMapper;
import cn.tf.vms.system.domain.VmsBatchOrgStatus;
import cn.tf.vms.system.service.IVmsBatchOrgStatusService;

@Service
public class VmsBatchOrgStatusServiceImpl implements IVmsBatchOrgStatusService
{
    @Autowired
    private VmsBatchOrgStatusMapper vmsBatchOrgStatusMapper;

    @Override public VmsBatchOrgStatus selectVmsBatchOrgStatusByOid(Long oid) { return vmsBatchOrgStatusMapper.selectVmsBatchOrgStatusByOid(oid); }
    @Override public List<VmsBatchOrgStatus> selectVmsBatchOrgStatusList(VmsBatchOrgStatus vmsBatchOrgStatus) { return vmsBatchOrgStatusMapper.selectVmsBatchOrgStatusList(vmsBatchOrgStatus); }
    @Override public int insertVmsBatchOrgStatus(VmsBatchOrgStatus vmsBatchOrgStatus) { vmsBatchOrgStatus.setCreateTime(DateUtils.getNowDate()); return vmsBatchOrgStatusMapper.insertVmsBatchOrgStatus(vmsBatchOrgStatus); }
    @Override public int updateVmsBatchOrgStatus(VmsBatchOrgStatus vmsBatchOrgStatus) { vmsBatchOrgStatus.setUpdateTime(DateUtils.getNowDate()); return vmsBatchOrgStatusMapper.updateVmsBatchOrgStatus(vmsBatchOrgStatus); }
    @Override public int deleteVmsBatchOrgStatusByOids(Long[] oids) { return vmsBatchOrgStatusMapper.deleteVmsBatchOrgStatusByOids(oids); }
    @Override public int deleteVmsBatchOrgStatusByOid(Long oid) { return vmsBatchOrgStatusMapper.deleteVmsBatchOrgStatusByOid(oid); }
}
