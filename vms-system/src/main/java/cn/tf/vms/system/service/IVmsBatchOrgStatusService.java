package cn.tf.vms.system.service;

import java.util.List;
import cn.tf.vms.system.domain.VmsBatchOrgStatus;

public interface IVmsBatchOrgStatusService
{
    public VmsBatchOrgStatus selectVmsBatchOrgStatusByOid(Long oid);
    public List<VmsBatchOrgStatus> selectVmsBatchOrgStatusList(VmsBatchOrgStatus vmsBatchOrgStatus);
    public int insertVmsBatchOrgStatus(VmsBatchOrgStatus vmsBatchOrgStatus);
    public int updateVmsBatchOrgStatus(VmsBatchOrgStatus vmsBatchOrgStatus);
    public int deleteVmsBatchOrgStatusByOids(Long[] oids);
    public int deleteVmsBatchOrgStatusByOid(Long oid);
}
