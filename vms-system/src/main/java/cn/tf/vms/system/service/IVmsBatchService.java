package cn.tf.vms.system.service;

import java.util.List;
import cn.tf.vms.system.domain.VmsBatch;

public interface IVmsBatchService
{
    public VmsBatch selectVmsBatchByOid(Long oid);
    public VmsBatch selectVmsBatchByBatchNo(String batchNo);
    public List<VmsBatch> selectVmsBatchList(VmsBatch vmsBatch);
    public int insertVmsBatch(VmsBatch vmsBatch);
    public int updateVmsBatch(VmsBatch vmsBatch);
    public int deleteVmsBatchByOids(Long[] oids);
    public int deleteVmsBatchByOid(Long oid);
}
