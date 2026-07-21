package cn.tf.vms.system.service.impl;

import java.util.List;
import cn.tf.vms.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tf.vms.system.mapper.VmsOrderMapper;
import cn.tf.vms.system.domain.VmsOrder;
import cn.tf.vms.system.service.IVmsOrderService;

@Service
public class VmsOrderServiceImpl implements IVmsOrderService
{
    @Autowired
    private VmsOrderMapper vmsOrderMapper;

    @Override public VmsOrder selectVmsOrderByOid(Long oid) { return vmsOrderMapper.selectVmsOrderByOid(oid); }
    @Override public List<VmsOrder> selectVmsOrderList(VmsOrder vmsOrder) { return vmsOrderMapper.selectVmsOrderList(vmsOrder); }
    @Override public int insertVmsOrder(VmsOrder vmsOrder) { vmsOrder.setCreateTime(DateUtils.getNowDate()); return vmsOrderMapper.insertVmsOrder(vmsOrder); }
    @Override public int updateVmsOrder(VmsOrder vmsOrder) { vmsOrder.setUpdateTime(DateUtils.getNowDate()); return vmsOrderMapper.updateVmsOrder(vmsOrder); }
    @Override public int deleteVmsOrderByOids(Long[] oids) { return vmsOrderMapper.deleteVmsOrderByOids(oids); }
    @Override public int deleteVmsOrderByOid(Long oid) { return vmsOrderMapper.deleteVmsOrderByOid(oid); }
}
