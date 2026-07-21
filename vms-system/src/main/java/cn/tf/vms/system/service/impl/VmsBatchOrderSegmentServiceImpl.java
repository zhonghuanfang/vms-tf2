package cn.tf.vms.system.service.impl;

import java.util.List;
import cn.tf.vms.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tf.vms.system.mapper.VmsBatchOrderSegmentMapper;
import cn.tf.vms.system.domain.VmsBatchOrderSegment;
import cn.tf.vms.system.service.IVmsBatchOrderSegmentService;

@Service
public class VmsBatchOrderSegmentServiceImpl implements IVmsBatchOrderSegmentService
{
    @Autowired
    private VmsBatchOrderSegmentMapper vmsBatchOrderSegmentMapper;

    @Override public VmsBatchOrderSegment selectVmsBatchOrderSegmentByOid(Long oid) { return vmsBatchOrderSegmentMapper.selectVmsBatchOrderSegmentByOid(oid); }
    @Override public List<VmsBatchOrderSegment> selectVmsBatchOrderSegmentList(VmsBatchOrderSegment vmsBatchOrderSegment) { return vmsBatchOrderSegmentMapper.selectVmsBatchOrderSegmentList(vmsBatchOrderSegment); }
    @Override public int insertVmsBatchOrderSegment(VmsBatchOrderSegment vmsBatchOrderSegment) { vmsBatchOrderSegment.setCreateTime(DateUtils.getNowDate()); return vmsBatchOrderSegmentMapper.insertVmsBatchOrderSegment(vmsBatchOrderSegment); }
    @Override public int updateVmsBatchOrderSegment(VmsBatchOrderSegment vmsBatchOrderSegment) { vmsBatchOrderSegment.setUpdateTime(DateUtils.getNowDate()); return vmsBatchOrderSegmentMapper.updateVmsBatchOrderSegment(vmsBatchOrderSegment); }
    @Override public int deleteVmsBatchOrderSegmentByOids(Long[] oids) { return vmsBatchOrderSegmentMapper.deleteVmsBatchOrderSegmentByOids(oids); }
    @Override public int deleteVmsBatchOrderSegmentByOid(Long oid) { return vmsBatchOrderSegmentMapper.deleteVmsBatchOrderSegmentByOid(oid); }
}
