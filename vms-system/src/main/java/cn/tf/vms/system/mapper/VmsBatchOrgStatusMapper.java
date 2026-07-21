package cn.tf.vms.system.mapper;

import java.util.List;
import cn.tf.vms.system.domain.VmsBatchOrgStatus;

public interface VmsBatchOrgStatusMapper
{
    public VmsBatchOrgStatus selectVmsBatchOrgStatusByOid(Long oid);
    public List<VmsBatchOrgStatus> selectVmsBatchOrgStatusList(VmsBatchOrgStatus vmsBatchOrgStatus);
    public int insertVmsBatchOrgStatus(VmsBatchOrgStatus vmsBatchOrgStatus);
    public int updateVmsBatchOrgStatus(VmsBatchOrgStatus vmsBatchOrgStatus);
    /** 带乐观锁的状态更新，返回受影响行数（0表示并发冲突） */
    public int updateOrgStatusWithVersionCheck(VmsBatchOrgStatus vmsBatchOrgStatus);
    public int deleteVmsBatchOrgStatusByOids(Long[] oids);
    public int deleteVmsBatchOrgStatusByOid(Long oid);
}
