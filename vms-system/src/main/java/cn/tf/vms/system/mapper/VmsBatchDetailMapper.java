package cn.tf.vms.system.mapper;

import java.util.List;
import cn.tf.vms.system.domain.VmsBatchDetail;
import cn.tf.vms.system.domain.VmsBatchSummaryVo;
import cn.tf.vms.system.domain.VmsOrder;
import org.apache.ibatis.annotations.Param;

public interface VmsBatchDetailMapper
{
    public VmsBatchDetail selectVmsBatchDetailByOid(Long oid);
    public List<VmsBatchDetail> selectVmsBatchDetailList(VmsBatchDetail vmsBatchDetail);
    public int insertVmsBatchDetail(VmsBatchDetail vmsBatchDetail);
    public int updateVmsBatchDetail(VmsBatchDetail vmsBatchDetail);
    public int deleteVmsBatchDetailByOids(Long[] oids);
    public int deleteVmsBatchDetailByOid(Long oid);

    /** 带乐观锁的更新，返回受影响行数（0表示并发冲突） */
    public int updateDetailWithVersionCheck(VmsBatchDetail vmsBatchDetail);

    /** 带乐观锁的单条删除，返回受影响行数（0表示并发冲突） */
    public int deleteDetailWithVersionCheck(VmsBatchDetail vmsBatchDetail);

    public List<VmsBatchSummaryVo> selectBranchSummary(@Param("batchNo") String batchNo, @Param("branchOrgId") String branchOrgId);
    public List<VmsBatchSummaryVo> selectHeadSummary(@Param("batchNo") String batchNo, @Param("status") String status);

    /** 审核通过时按凭证种类+分行汇总生成订单，仅汇总机构状态为"总行复核员审核中"(22)的分行 */
    public List<VmsOrder> selectOrderSummaryForApprove(@Param("batchNo") String batchNo);
}
