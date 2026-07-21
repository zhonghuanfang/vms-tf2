package cn.tf.vms.system.mapper;

import java.util.List;
import cn.tf.vms.system.domain.VmsBatchVendorOrder;

public interface VmsBatchVendorOrderMapper
{
    public VmsBatchVendorOrder selectVmsBatchVendorOrderByOid(Long oid);
    public List<VmsBatchVendorOrder> selectVmsBatchVendorOrderList(VmsBatchVendorOrder vmsBatchVendorOrder);
    public int insertVmsBatchVendorOrder(VmsBatchVendorOrder vmsBatchVendorOrder);
    public int updateVmsBatchVendorOrder(VmsBatchVendorOrder vmsBatchVendorOrder);
    public int deleteVmsBatchVendorOrderByOids(Long[] oids);
    public int deleteVmsBatchVendorOrderByOid(Long oid);
}
