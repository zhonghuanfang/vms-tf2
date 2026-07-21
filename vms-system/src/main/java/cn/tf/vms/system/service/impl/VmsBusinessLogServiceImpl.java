package cn.tf.vms.system.service.impl;

import java.util.List;
import cn.tf.vms.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tf.vms.system.mapper.VmsBusinessLogMapper;
import cn.tf.vms.system.domain.VmsBusinessLog;
import cn.tf.vms.system.service.IVmsBusinessLogService;

@Service
public class VmsBusinessLogServiceImpl implements IVmsBusinessLogService
{
    @Autowired
    private VmsBusinessLogMapper vmsBusinessLogMapper;

    @Override public VmsBusinessLog selectVmsBusinessLogByOid(Long oid) { return vmsBusinessLogMapper.selectVmsBusinessLogByOid(oid); }
    @Override public List<VmsBusinessLog> selectVmsBusinessLogList(VmsBusinessLog vmsBusinessLog) { return vmsBusinessLogMapper.selectVmsBusinessLogList(vmsBusinessLog); }
    @Override public int insertVmsBusinessLog(VmsBusinessLog vmsBusinessLog) { vmsBusinessLog.setCreateTime(DateUtils.getNowDate()); return vmsBusinessLogMapper.insertVmsBusinessLog(vmsBusinessLog); }
    @Override public int updateVmsBusinessLog(VmsBusinessLog vmsBusinessLog) { vmsBusinessLog.setUpdateTime(DateUtils.getNowDate()); return vmsBusinessLogMapper.updateVmsBusinessLog(vmsBusinessLog); }
    @Override public int deleteVmsBusinessLogByOids(Long[] oids) { return vmsBusinessLogMapper.deleteVmsBusinessLogByOids(oids); }
    @Override public int deleteVmsBusinessLogByOid(Long oid) { return vmsBusinessLogMapper.deleteVmsBusinessLogByOid(oid); }
}
