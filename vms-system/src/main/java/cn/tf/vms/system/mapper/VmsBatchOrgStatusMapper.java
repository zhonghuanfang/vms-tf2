package cn.tf.vms.system.mapper;

import java.util.List;
import cn.tf.vms.system.domain.VmsBatchOrgStatus;

public interface VmsBatchOrgStatusMapper
{
    public VmsBatchOrgStatus selectVmsBatchOrgStatusByOid(Long oid);
    public List<VmsBatchOrgStatus> selectVmsBatchOrgStatusList(VmsBatchOrgStatus vmsBatchOrgStatus);
    public int insertVmsBatchOrgStatus(VmsBatchOrgStatus vmsBatchOrgStatus);
    public int updateVmsBatchOrgStatus(VmsBatchOrgStatus vmsBatchOrgStatus);
    public int deleteVmsBatchOrgStatusByOids(Long[] oids);
    public int deleteVmsBatchOrgStatusByOid(Long oid);
}
