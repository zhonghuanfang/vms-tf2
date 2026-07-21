package cn.tf.vms.system.service;

import java.util.List;
import cn.tf.vms.system.domain.VmsBatchOrderSegment;

public interface IVmsBatchOrderSegmentService
{
    public VmsBatchOrderSegment selectVmsBatchOrderSegmentByOid(Long oid);
    public List<VmsBatchOrderSegment> selectVmsBatchOrderSegmentList(VmsBatchOrderSegment vmsBatchOrderSegment);
    public int insertVmsBatchOrderSegment(VmsBatchOrderSegment vmsBatchOrderSegment);
    public int updateVmsBatchOrderSegment(VmsBatchOrderSegment vmsBatchOrderSegment);
    public int deleteVmsBatchOrderSegmentByOids(Long[] oids);
    public int deleteVmsBatchOrderSegmentByOid(Long oid);
}
