package cn.tf.vms.system.mapper;

import java.util.List;
import cn.tf.vms.system.domain.VmsBatch;

public interface VmsBatchMapper
{
    public VmsBatch selectVmsBatchByOid(Long oid);
    public List<VmsBatch> selectVmsBatchList(VmsBatch vmsBatch);
    public int insertVmsBatch(VmsBatch vmsBatch);
    public int updateVmsBatch(VmsBatch vmsBatch);
    public int deleteVmsBatchByOids(Long[] oids);
    public int deleteVmsBatchByOid(Long oid);
}
