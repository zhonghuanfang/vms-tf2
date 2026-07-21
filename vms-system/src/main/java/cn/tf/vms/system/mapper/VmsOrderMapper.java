package cn.tf.vms.system.mapper;

import java.util.List;
import cn.tf.vms.system.domain.VmsOrder;

public interface VmsOrderMapper
{
    public VmsOrder selectVmsOrderByOid(Long oid);
    public List<VmsOrder> selectVmsOrderList(VmsOrder vmsOrder);
    public int insertVmsOrder(VmsOrder vmsOrder);
    public int updateVmsOrder(VmsOrder vmsOrder);
    public int deleteVmsOrderByOids(Long[] oids);
    public int deleteVmsOrderByOid(Long oid);
}
