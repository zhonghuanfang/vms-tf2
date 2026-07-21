package cn.tf.vms.system.service.impl;

import java.util.List;
import cn.tf.vms.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tf.vms.system.mapper.VmsBatchVendorOrderMapper;
import cn.tf.vms.system.domain.VmsBatchVendorOrder;
import cn.tf.vms.system.service.IVmsBatchVendorOrderService;

@Service
public class VmsBatchVendorOrderServiceImpl implements IVmsBatchVendorOrderService
{
    @Autowired
    private VmsBatchVendorOrderMapper vmsBatchVendorOrderMapper;

    @Override public VmsBatchVendorOrder selectVmsBatchVendorOrderByOid(Long oid) { return vmsBatchVendorOrderMapper.selectVmsBatchVendorOrderByOid(oid); }
    @Override public List<VmsBatchVendorOrder> selectVmsBatchVendorOrderList(VmsBatchVendorOrder vmsBatchVendorOrder) { return vmsBatchVendorOrderMapper.selectVmsBatchVendorOrderList(vmsBatchVendorOrder); }
    @Override public int insertVmsBatchVendorOrder(VmsBatchVendorOrder vmsBatchVendorOrder) { vmsBatchVendorOrder.setCreateTime(DateUtils.getNowDate()); return vmsBatchVendorOrderMapper.insertVmsBatchVendorOrder(vmsBatchVendorOrder); }
    @Override public int updateVmsBatchVendorOrder(VmsBatchVendorOrder vmsBatchVendorOrder) { vmsBatchVendorOrder.setUpdateTime(DateUtils.getNowDate()); return vmsBatchVendorOrderMapper.updateVmsBatchVendorOrder(vmsBatchVendorOrder); }
    @Override public int deleteVmsBatchVendorOrderByOids(Long[] oids) { return vmsBatchVendorOrderMapper.deleteVmsBatchVendorOrderByOids(oids); }
    @Override public int deleteVmsBatchVendorOrderByOid(Long oid) { return vmsBatchVendorOrderMapper.deleteVmsBatchVendorOrderByOid(oid); }
}
