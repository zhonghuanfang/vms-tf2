package cn.tf.vms.system.mapper;

import java.util.List;
import cn.tf.vms.system.domain.VmsBatch;
import org.apache.ibatis.annotations.Param;

public interface VmsBatchMapper
{
    public VmsBatch selectVmsBatchByOid(Long oid);
    public VmsBatch selectVmsBatchByBatchNo(String batchNo);
    public List<VmsBatch> selectVmsBatchList(VmsBatch vmsBatch);
    public List<VmsBatch> selectVmsBatchListByOrgId(@Param("orgId") String orgId, @Param("batch") VmsBatch batch);
    public int insertVmsBatch(VmsBatch vmsBatch);
    public int updateVmsBatch(VmsBatch vmsBatch);
    public int deleteVmsBatchByOids(Long[] oids);
    public int deleteVmsBatchByOid(Long oid);
}
