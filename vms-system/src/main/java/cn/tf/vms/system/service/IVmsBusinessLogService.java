package cn.tf.vms.system.service;

import java.util.List;
import cn.tf.vms.system.domain.VmsBusinessLog;

public interface IVmsBusinessLogService
{
    public VmsBusinessLog selectVmsBusinessLogByOid(Long oid);
    public List<VmsBusinessLog> selectVmsBusinessLogList(VmsBusinessLog vmsBusinessLog);
    public int insertVmsBusinessLog(VmsBusinessLog vmsBusinessLog);
    public int updateVmsBusinessLog(VmsBusinessLog vmsBusinessLog);
    public int deleteVmsBusinessLogByOids(Long[] oids);
    public int deleteVmsBusinessLogByOid(Long oid);
}
