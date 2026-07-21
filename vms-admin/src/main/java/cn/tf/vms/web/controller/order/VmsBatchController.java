//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.tf.vms.web.controller.order;

import cn.tf.vms.common.annotation.Log;
import cn.tf.vms.common.core.controller.BaseController;
import cn.tf.vms.common.core.domain.AjaxResult;
import cn.tf.vms.common.core.domain.entity.SysDept;
import cn.tf.vms.common.core.page.TableDataInfo;
import cn.tf.vms.common.enums.BusinessType;
import cn.tf.vms.common.utils.SecurityUtils;
import cn.tf.vms.common.utils.StringUtils;
import cn.tf.vms.system.domain.VmsBatch;
import cn.tf.vms.system.domain.VmsBatchDetail;
import cn.tf.vms.system.domain.VmsBatchOrderSegment;
import cn.tf.vms.system.domain.VmsBatchOrgStatus;
import cn.tf.vms.system.domain.VmsBatchSummaryVo;
import cn.tf.vms.system.domain.VmsBusinessLog;
import cn.tf.vms.system.domain.VmsOrder;
import cn.tf.vms.system.service.ISysDeptService;
import cn.tf.vms.system.service.IVmsBatchDetailService;
import cn.tf.vms.system.service.IVmsBatchOrderSegmentService;
import cn.tf.vms.system.service.IVmsBatchOrgStatusService;
import cn.tf.vms.system.service.IVmsBatchService;
import cn.tf.vms.system.service.IVmsBatchVendorOrderService;
import cn.tf.vms.system.service.IVmsBusinessLogService;
import cn.tf.vms.system.service.IVmsOrderService;
import java.util.Iterator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping({"/order/batch"})
public class VmsBatchController extends BaseController {
    @Autowired
    private IVmsBatchService vmsBatchService;
    @Autowired
    private IVmsBatchDetailService vmsBatchDetailService;
    @Autowired
    private ISysDeptService sysDeptService;
    @Autowired
    private IVmsBatchOrgStatusService vmsBatchOrgStatusService;
    @Autowired
    private IVmsBatchOrderSegmentService vmsBatchOrderSegmentService;
    @Autowired
    private IVmsBatchVendorOrderService vmsBatchVendorOrderService;
    @Autowired
    private IVmsOrderService vmsOrderService;
    @Autowired
    private IVmsBusinessLogService vmsBusinessLogService;

    public VmsBatchController() {
    }

    @PreAuthorize("@ss.hasPermi('order:batch:list')")
    @GetMapping({"/list"})
    public TableDataInfo list(VmsBatch vmsBatch) {
        this.startPage();
        List<VmsBatch> list = this.vmsBatchService.selectVmsBatchList(vmsBatch);
        return this.getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('order:batch:query')")
    @GetMapping({"/{oid}"})
    public AjaxResult getInfo(@PathVariable("oid") Long oid) {
        return this.success(this.vmsBatchService.selectVmsBatchByOid(oid));
    }

    @PreAuthorize("@ss.hasPermi('order:batch:add')")
    @Log(
            title = "订购批次",
            businessType = BusinessType.INSERT
    )
    @PostMapping
    public AjaxResult add(@RequestBody VmsBatch vmsBatch) {
        Long deptId = SecurityUtils.getLoginUser().getUser().getDeptId();
        SysDept headDept = this.sysDeptService.selectDeptById(deptId);
        if (headDept != null && "1".equals(headDept.getDeptLevel())) {
            vmsBatch.setCreatedBy(SecurityUtils.getUsername());
            vmsBatch.setStatus("20");
            vmsBatch.setHeadOrgId(headDept.getDeptCode());
            int result = this.vmsBatchService.insertVmsBatch(vmsBatch);
            String headDeptIdStr = String.valueOf(deptId);
            List<SysDept> allDepts = this.sysDeptService.selectDeptList(new SysDept());
            Iterator var7 = allDepts.iterator();

            while(var7.hasNext()) {
                SysDept branch = (SysDept)var7.next();
                if ("2".equals(branch.getDeptLevel()) && StringUtils.isNotNull(branch.getAncestors()) && branch.getAncestors().contains(headDeptIdStr) && StringUtils.isNotEmpty(branch.getDeptCode())) {
                    VmsBatchOrgStatus orgStatus = new VmsBatchOrgStatus();
                    orgStatus.setBatchNo(vmsBatch.getBatchNo());
                    orgStatus.setOrgId(branch.getDeptCode());
                    orgStatus.setDetailStatus("10");
                    orgStatus.setCreatedBy(SecurityUtils.getUsername());
                    this.vmsBatchOrgStatusService.insertVmsBatchOrgStatus(orgStatus);
                }
            }

            return this.toAjax(result);
        } else {
            return this.error("仅总行管理员可新增批次");
        }
    }

    @PreAuthorize("@ss.hasPermi('order:batch:edit')")
    @Log(
            title = "订购批次",
            businessType = BusinessType.UPDATE
    )
    @PutMapping
    public AjaxResult edit(@RequestBody VmsBatch vmsBatch) {
        return this.toAjax(this.vmsBatchService.updateVmsBatch(vmsBatch));
    }

    @PreAuthorize("@ss.hasPermi('order:batch:remove')")
    @Log(
            title = "订购批次",
            businessType = BusinessType.DELETE
    )
    @DeleteMapping({"/{oids}"})
    public AjaxResult remove(@PathVariable Long[] oids) {
        return this.toAjax(this.vmsBatchService.deleteVmsBatchByOids(oids));
    }

    @PreAuthorize("@ss.hasPermi('order:batch:lock')")
    @Log(
            title = "批次锁定",
            businessType = BusinessType.UPDATE
    )
    @PutMapping({"/lock"})
    public AjaxResult lock(@RequestBody VmsBatch vmsBatch) {
        VmsBatch batch = this.vmsBatchService.selectVmsBatchByOid(vmsBatch.getOid());
        if (batch == null) {
            return this.error("批次不存在");
        } else {
            String username = SecurityUtils.getUsername();
            batch.setStatus("21");
            batch.setStatusRemark(vmsBatch.getStatusRemark());
            this.vmsBatchService.updateVmsBatch(batch);
            VmsBusinessLog log = new VmsBusinessLog();
            log.setBatchNo(batch.getBatchNo());
            log.setActionType("LOCK");
            log.setActionDesc("锁定批次");
            log.setOperatorId(username);
            log.setOperatorName(username);
            this.vmsBusinessLogService.insertVmsBusinessLog(log);
            return this.success();
        }
    }

    @PreAuthorize("@ss.hasPermi('order:batch:unlock')")
    @Log(
            title = "批次解锁",
            businessType = BusinessType.UPDATE
    )
    @PutMapping({"/unlock"})
    public AjaxResult unlock(@RequestBody VmsBatch vmsBatch) {
        VmsBatch batch = this.vmsBatchService.selectVmsBatchByOid(vmsBatch.getOid());
        if (batch == null) {
            return this.error("批次不存在");
        } else {
            String username = SecurityUtils.getUsername();
            batch.setStatus("20");
            batch.setStatusRemark(vmsBatch.getStatusRemark());
            this.vmsBatchService.updateVmsBatch(batch);
            VmsBusinessLog log = new VmsBusinessLog();
            log.setBatchNo(batch.getBatchNo());
            log.setActionType("UNLOCK");
            log.setActionDesc("解锁批次");
            log.setOperatorId(username);
            log.setOperatorName(username);
            this.vmsBusinessLogService.insertVmsBusinessLog(log);
            return this.success();
        }
    }

    @PreAuthorize("@ss.hasPermi('order:batch:submit')")
    @Log(
            title = "批次提交审核",
            businessType = BusinessType.UPDATE
    )
    @PutMapping({"/submitReview"})
    public AjaxResult submitReview(@RequestBody VmsBatch vmsBatch) {
        VmsBatch batch = this.vmsBatchService.selectVmsBatchByOid(vmsBatch.getOid());
        if (batch == null) {
            return this.error("批次不存在");
        } else {
            String username = SecurityUtils.getUsername();
            batch.setStatus("22");
            batch.setStatusRemark(vmsBatch.getStatusRemark());
            this.vmsBatchService.updateVmsBatch(batch);
            VmsBusinessLog log = new VmsBusinessLog();
            log.setBatchNo(batch.getBatchNo());
            log.setActionType("SUBMIT_REVIEW");
            log.setActionDesc("提交审核");
            log.setOperatorId(username);
            log.setOperatorName(username);
            this.vmsBusinessLogService.insertVmsBusinessLog(log);
            return this.success();
        }
    }

    @PreAuthorize("@ss.hasPermi('order:batch:approve')")
    @Log(
            title = "批次审核通过",
            businessType = BusinessType.UPDATE
    )
    @PutMapping({"/approve"})
    public AjaxResult approve(@RequestBody VmsBatch vmsBatch) {
        VmsBatch batch = this.vmsBatchService.selectVmsBatchByOid(vmsBatch.getOid());
        if (batch == null) {
            return this.error("批次不存在");
        } else {
            String username = SecurityUtils.getUsername();
            batch.setStatus("100");
            batch.setStatusRemark(vmsBatch.getStatusRemark());
            this.vmsBatchService.updateVmsBatch(batch);
            VmsBusinessLog log = new VmsBusinessLog();
            log.setBatchNo(batch.getBatchNo());
            log.setActionType("APPROVE");
            log.setActionDesc("审核通过，生成订单");
            log.setOperatorId(username);
            log.setOperatorName(username);
            this.vmsBusinessLogService.insertVmsBusinessLog(log);
            return this.success();
        }
    }

    @PreAuthorize("@ss.hasPermi('order:batch:reject')")
    @Log(
            title = "批次审核驳回",
            businessType = BusinessType.UPDATE
    )
    @PutMapping({"/reject"})
    public AjaxResult reject(@RequestBody VmsBatch vmsBatch) {
        VmsBatch batch = this.vmsBatchService.selectVmsBatchByOid(vmsBatch.getOid());
        if (batch == null) {
            return this.error("批次不存在");
        } else {
            String username = SecurityUtils.getUsername();
            batch.setStatus("23");
            batch.setStatusRemark(vmsBatch.getStatusRemark());
            this.vmsBatchService.updateVmsBatch(batch);
            VmsBusinessLog log = new VmsBusinessLog();
            log.setBatchNo(batch.getBatchNo());
            log.setActionType("REJECT");
            log.setActionDesc("审核驳回");
            log.setOperatorId(username);
            log.setOperatorName(username);
            this.vmsBusinessLogService.insertVmsBusinessLog(log);
            return this.success();
        }
    }

    @PreAuthorize("@ss.hasPermi('order:detail:list')")
    @GetMapping({"/detail/list"})
    public TableDataInfo detailList(VmsBatchDetail vmsBatchDetail) {
        this.startPage();
        List<VmsBatchDetail> list = this.vmsBatchDetailService.selectVmsBatchDetailList(vmsBatchDetail);
        return this.getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('order:detail:query')")
    @GetMapping({"/detail/{oid}"})
    public AjaxResult detailInfo(@PathVariable("oid") Long oid) {
        return this.success(this.vmsBatchDetailService.selectVmsBatchDetailByOid(oid));
    }

    @PreAuthorize("@ss.hasPermi('order:detail:add')")
    @Log(
            title = "批次明细",
            businessType = BusinessType.INSERT
    )
    @PostMapping({"/detail"})
    public AjaxResult addDetail(@RequestBody VmsBatchDetail vmsBatchDetail) {
        if (StringUtils.isEmpty(vmsBatchDetail.getSubbranchOrgId())) {
            return this.error("支行号不能为空");
        } else {
            this.fillBranchAndHeadOrg(vmsBatchDetail);
            AjaxResult checkResult = this.checkBatchDetailOperateStatus(vmsBatchDetail.getBatchNo(), vmsBatchDetail.getBranchOrgId(), vmsBatchDetail.getSubbranchOrgId());
            if (checkResult != null) {
                return checkResult;
            } else {
                vmsBatchDetail.setCreatedBy(SecurityUtils.getUsername());
                vmsBatchDetail.setDetailStatus("00");
                return this.toAjax(this.vmsBatchDetailService.insertVmsBatchDetail(vmsBatchDetail));
            }
        }
    }

    @PreAuthorize("@ss.hasPermi('order:detail:edit')")
    @Log(
            title = "批次明细",
            businessType = BusinessType.UPDATE
    )
    @PutMapping({"/detail"})
    public AjaxResult editDetail(@RequestBody VmsBatchDetail vmsBatchDetail) {
        AjaxResult checkResult = this.checkBatchDetailOperateStatus(vmsBatchDetail.getBatchNo(), vmsBatchDetail.getBranchOrgId(), vmsBatchDetail.getSubbranchOrgId());
        return checkResult != null ? checkResult : this.toAjax(this.vmsBatchDetailService.updateVmsBatchDetail(vmsBatchDetail));
    }

    @PreAuthorize("@ss.hasPermi('order:detail:reject')")
    @Log(
            title = "批次明细",
            businessType = BusinessType.UPDATE
    )
    @PutMapping({"/detail/reject"})
    public AjaxResult rejectDetail(@RequestBody VmsBatchDetail vmsBatchDetail) {
        VmsBatchDetail detail = this.vmsBatchDetailService.selectVmsBatchDetailByOid(vmsBatchDetail.getOid());
        if (detail == null) {
            return this.error("明细不存在");
        } else {
            detail.setDetailStatus("01");
            return this.toAjax(this.vmsBatchDetailService.updateVmsBatchDetail(detail));
        }
    }

    @PreAuthorize("@ss.hasPermi('order:detail:remove')")
    @Log(
            title = "批次明细",
            businessType = BusinessType.DELETE
    )
    @DeleteMapping({"/detail/{oids}"})
    public AjaxResult removeDetail(@PathVariable Long[] oids) {
        if (oids != null && oids.length > 0) {
            VmsBatchDetail detail = this.vmsBatchDetailService.selectVmsBatchDetailByOid(oids[0]);
            if (detail != null) {
                AjaxResult checkResult = this.checkBatchDetailOperateStatus(detail.getBatchNo(), detail.getBranchOrgId(), detail.getSubbranchOrgId());
                if (checkResult != null) {
                    return checkResult;
                }
            }
        }

        return this.toAjax(this.vmsBatchDetailService.deleteVmsBatchDetailByOids(oids));
    }

    @PreAuthorize("@ss.hasPermi('order:segment:list')")
    @GetMapping({"/segment/list"})
    public TableDataInfo segmentList(VmsBatchOrderSegment vmsBatchOrderSegment) {
        this.startPage();
        List<VmsBatchOrderSegment> list = this.vmsBatchOrderSegmentService.selectVmsBatchOrderSegmentList(vmsBatchOrderSegment);
        return this.getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('order:segment:edit')")
    @Log(
            title = "号段管理",
            businessType = BusinessType.UPDATE
    )
    @PostMapping({"/segment/save"})
    public AjaxResult saveSegment(@RequestBody VmsBatchOrderSegment vmsBatchOrderSegment) {
        return vmsBatchOrderSegment.getOid() != null ? this.toAjax(this.vmsBatchOrderSegmentService.updateVmsBatchOrderSegment(vmsBatchOrderSegment)) : this.toAjax(this.vmsBatchOrderSegmentService.insertVmsBatchOrderSegment(vmsBatchOrderSegment));
    }

    @PreAuthorize("@ss.hasPermi('order:order:list')")
    @GetMapping({"/order/list"})
    public TableDataInfo orderList(VmsOrder vmsOrder) {
        this.startPage();
        List<VmsOrder> list = this.vmsOrderService.selectVmsOrderList(vmsOrder);
        return this.getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('order:order:query')")
    @GetMapping({"/order/{oid}"})
    public AjaxResult orderInfo(@PathVariable("oid") Long oid) {
        return this.success(this.vmsOrderService.selectVmsOrderByOid(oid));
    }

    @PreAuthorize("@ss.hasPermi('order:log:list')")
    @GetMapping({"/log/list"})
    public TableDataInfo logList(VmsBusinessLog vmsBusinessLog) {
        this.startPage();
        List<VmsBusinessLog> list = this.vmsBusinessLogService.selectVmsBusinessLogList(vmsBusinessLog);
        return this.getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('order:batch:summary')")
    @GetMapping({"/summary"})
    public AjaxResult batchSummary(@RequestParam String batchNo, @RequestParam(required = true) String status) {
        SysDept userDept = null;
        Long deptId = SecurityUtils.getLoginUser().getUser().getDeptId();
        if (deptId != null) {
            userDept = this.sysDeptService.selectDeptById(deptId);
        }

        if (userDept != null && !StringUtils.isEmpty(userDept.getDeptLevel())) {
            String branchOrgId;
            if ("1".equals(userDept.getDeptLevel())) {
                branchOrgId = null;
            } else {
                if (!"2".equals(userDept.getDeptLevel())) {
                    return this.success();
                }

                branchOrgId = userDept.getDeptCode();
            }

            List<VmsBatchSummaryVo> list = this.vmsBatchDetailService.selectBatchSummary(batchNo, branchOrgId, status);
            return this.success(list);
        } else {
            return this.success();
        }
    }

    private AjaxResult checkBatchDetailOperateStatus(String batchNo, String branchOrgId, String subbranchOrgId) {
        VmsBatch batchQuery = new VmsBatch();
        batchQuery.setBatchNo(batchNo);
        List<VmsBatch> batchList = this.vmsBatchService.selectVmsBatchList(batchQuery);
        if (batchList.isEmpty()) {
            return this.error("批次不存在");
        } else {
            VmsBatch batch = (VmsBatch)batchList.get(0);
            if (!"20".equals(batch.getStatus())) {
                return this.error("当前批次状态不允許增删改操作");
            } else {
                VmsBatchOrgStatus orgStatusQuery = new VmsBatchOrgStatus();
                orgStatusQuery.setBatchNo(batchNo);
                orgStatusQuery.setOrgId(branchOrgId);
                List<VmsBatchOrgStatus> orgStatusList = this.vmsBatchOrgStatusService.selectVmsBatchOrgStatusList(orgStatusQuery);
                if (orgStatusList.isEmpty()) {
                    return this.error("未找到机构状态记录");
                } else {
                    String detailStatus = ((VmsBatchOrgStatus)orgStatusList.get(0)).getDetailStatus();
                    return !"10".equals(detailStatus) && !"13".equals(detailStatus) ? this.error("当前机构状态不允许增删改操作") : null;
                }
            }
        }
    }

    private void fillBranchAndHeadOrg(VmsBatchDetail detail) {
        if (!StringUtils.isEmpty(detail.getSubbranchOrgId())) {
            SysDept userDept = null;

            try {
                Long deptId = SecurityUtils.getLoginUser().getUser().getDeptId();
                if (deptId != null) {
                    userDept = this.sysDeptService.selectDeptById(deptId);
                }
            } catch (Exception var7) {
            }

            if (userDept != null && !StringUtils.isEmpty(userDept.getAncestors())) {
                String[] ancestorIds = userDept.getAncestors().split(",");

                for(int i = ancestorIds.length - 1; i >= 0; --i) {
                    String ancestorId = ancestorIds[i].trim();
                    if (!ancestorId.equals("0")) {
                        try {
                            SysDept parent = this.sysDeptService.selectDeptById(Long.parseLong(ancestorId));
                            if (parent != null) {
                                if ("1".equals(parent.getDeptLevel()) && StringUtils.isEmpty(detail.getHeadOrgId())) {
                                    detail.setHeadOrgId(parent.getDeptCode());
                                } else if ("2".equals(parent.getDeptLevel()) && StringUtils.isEmpty(detail.getBranchOrgId())) {
                                    detail.setBranchOrgId(parent.getDeptCode());
                                }
                            }
                        } catch (Exception var8) {
                        }
                    }
                }

                if (StringUtils.isEmpty(detail.getBranchOrgId()) && "2".equals(userDept.getDeptLevel())) {
                    detail.setBranchOrgId(userDept.getDeptCode());
                }

                if (StringUtils.isEmpty(detail.getHeadOrgId()) && "1".equals(userDept.getDeptLevel())) {
                    detail.setHeadOrgId(userDept.getDeptCode());
                }

            }
        }
    }
}
