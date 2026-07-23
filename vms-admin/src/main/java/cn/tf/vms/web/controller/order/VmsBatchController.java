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
import cn.tf.vms.common.constant.VmsOrderConstants;
import cn.tf.vms.system.domain.VmsBatch;
import cn.tf.vms.system.domain.VmsBatchDetail;
import cn.tf.vms.system.domain.VmsBatchOrderSegment;
import cn.tf.vms.system.domain.VmsBatchOrgStatus;
import cn.tf.vms.system.domain.VmsBatchReviewVo;
import cn.tf.vms.system.domain.VmsBatchSummaryVo;
import cn.tf.vms.system.domain.VmsBatchVendorOrder;
import cn.tf.vms.system.domain.VmsBusinessLog;
import cn.tf.vms.system.domain.VmsOrder;
import cn.tf.vms.system.domain.VmsVendor;
import cn.tf.vms.system.service.ISysDeptService;
import cn.tf.vms.system.service.IVmsBatchDetailService;
import cn.tf.vms.system.service.IVmsBatchOrderSegmentService;
import cn.tf.vms.system.service.IVmsBatchOrgStatusService;
import cn.tf.vms.system.service.IVmsBatchService;
import cn.tf.vms.system.service.IVmsBatchVendorOrderService;
import cn.tf.vms.system.service.IVmsBusinessLogService;
import cn.tf.vms.system.service.IVmsOrderService;
import cn.tf.vms.system.service.IVmsVendorService;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
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
    @Autowired
    private IVmsVendorService vmsVendorService;

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
    @Log(title = "批次锁定", businessType = BusinessType.UPDATE)
    @PutMapping({"/lock"})
    public AjaxResult lock(@RequestBody VmsBatch vmsBatch) {
        VmsBatch batch = this.vmsBatchService.selectVmsBatchByOid(vmsBatch.getOid());
        if (batch == null) {
            return this.error("批次不存在");
        }
        String username = SecurityUtils.getUsername();
        String batchNo = batch.getBatchNo();
        // 1. 批次表：将批次状态改为"总行管理员汇总中"(21)
        batch.setStatus("21");
        batch.setStatusRemark(vmsBatch.getStatusRemark());
        this.vmsBatchService.updateVmsBatch(batch);
        // 2. 批次机构状态表：将当前总行下所有分行且状态为"待总行管理员汇总"(20)的记录改为"总行管理员汇总中"(21)
        VmsBatchOrgStatus branchQuery = new VmsBatchOrgStatus();
        branchQuery.setBatchNo(batchNo);
        List<VmsBatchOrgStatus> allBranchRecords = this.vmsBatchOrgStatusService.selectVmsBatchOrgStatusList(branchQuery);
        for (VmsBatchOrgStatus branch : allBranchRecords) {
            if ("20".equals(branch.getDetailStatus()) || "23".equals(branch.getDetailStatus())) {
                branch.setDetailStatus("21");
                this.vmsBatchOrgStatusService.updateOrgStatusWithVersionCheck(branch);
            }
        }
        // 3. 日志流程表新增一条数据
        VmsBusinessLog log = new VmsBusinessLog();
        log.setBatchNo(batchNo);
        log.setActionType("LOCK");
        log.setActionDesc("锁定批次");
        log.setOperatorId(username);
        log.setOperatorName(username);
        log.setOperatorOrgId(batch.getHeadOrgId());
        this.vmsBusinessLogService.insertVmsBusinessLog(log);
        return this.success();
    }

    @PreAuthorize("@ss.hasPermi('order:batch:unlock')")
    @Log(title = "批次解锁", businessType = BusinessType.UPDATE)
    @PutMapping({"/unlock"})
    public AjaxResult unlock(@RequestBody VmsBatch vmsBatch) {
        VmsBatch batch = this.vmsBatchService.selectVmsBatchByOid(vmsBatch.getOid());
        if (batch == null) {
            return this.error("批次不存在");
        }
        String username = SecurityUtils.getUsername();
        String batchNo = batch.getBatchNo();
        // 1. 批次表：将批次状态改为"待总行管理员汇总"(20)
        batch.setStatus("20");
        batch.setStatusRemark(vmsBatch.getStatusRemark());
        this.vmsBatchService.updateVmsBatch(batch);
        // 2. 批次机构状态表：将当前总行下所有分行且状态为"总行管理员汇总中"(21)的记录改为"待总行管理员汇总"(20)
        VmsBatchOrgStatus branchQuery = new VmsBatchOrgStatus();
        branchQuery.setBatchNo(batchNo);
        List<VmsBatchOrgStatus> allBranchRecords = this.vmsBatchOrgStatusService.selectVmsBatchOrgStatusList(branchQuery);
        for (VmsBatchOrgStatus branch : allBranchRecords) {
            if ("21".equals(branch.getDetailStatus())) {
                branch.setDetailStatus("20");
                this.vmsBatchOrgStatusService.updateOrgStatusWithVersionCheck(branch);
            }
        }
        // 3. 日志流程表新增一条数据
        VmsBusinessLog log = new VmsBusinessLog();
        log.setBatchNo(batchNo);
        log.setActionType("UNLOCK");
        log.setActionDesc("解锁批次");
        log.setOperatorId(username);
        log.setOperatorName(username);
        log.setOperatorOrgId(batch.getHeadOrgId());
        this.vmsBusinessLogService.insertVmsBusinessLog(log);
        return this.success();
    }

    @PreAuthorize("@ss.hasPermi('order:batch:submit')")
    @Log(
            title = "批次提交审核",
            businessType = BusinessType.UPDATE
    )
    @PutMapping({"/submitReview"})
    public AjaxResult submitReview(@RequestBody Map<String, Object> params) {
        Long oid = Long.valueOf(params.get("oid").toString());
        String statusRemark = params.get("statusRemark") != null ? params.get("statusRemark").toString() : null;
        VmsBatch batch = this.vmsBatchService.selectVmsBatchByOid(oid);
        if (batch == null) {
            return this.error("批次不存在");
        }
        // 解析号段列表
        List<Map<String, Object>> segmentMaps = (List<Map<String, Object>>) params.get("segments");
        if (segmentMaps == null || segmentMaps.isEmpty()) {
            return this.error("号段列表不能为空");
        }
        // 校验每条号段：必须填写完毕，且号段相减等于订购数量
        List<VmsBatchOrderSegment> segments = new ArrayList<>();
        for (int i = 0; i < segmentMaps.size(); i++) {
            Map<String, Object> seg = segmentMaps.get(i);
            String printStartNo = seg.get("printStartNo") != null ? seg.get("printStartNo").toString() : null;
            String printEndNo = seg.get("printEndNo") != null ? seg.get("printEndNo").toString() : null;
            Integer quantity = seg.get("totalQuantity") != null ? Integer.valueOf(seg.get("totalQuantity").toString()) : null;
            if (StringUtils.isEmpty(printStartNo) || StringUtils.isEmpty(printEndNo)) {
                return this.error("第" + (i + 1) + "行号段未填写完毕");
            }
            if (quantity == null || quantity == 0) {
                return this.error("第" + (i + 1) + "行订购数量为0");
            }
            long startNo, endNo;
            try {
                startNo = Long.parseLong(printStartNo);
                endNo = Long.parseLong(printEndNo);
            } catch (NumberFormatException e) {
                return this.error("第" + (i + 1) + "行号段格式错误，必须为数字");
            }
            if (endNo - startNo != quantity) {
                return this.error("第" + (i + 1) + "行号段差值（" + (endNo - startNo) + "）不等于订购数量（" + quantity + "）");
            }
            VmsBatchOrderSegment segment = new VmsBatchOrderSegment();
            segment.setBatchNo(batch.getBatchNo());
            segment.setTemplateOid(seg.get("templateOid") != null ? Long.valueOf(seg.get("templateOid").toString()) : null);
            segment.setVendorOid(seg.get("vendorOid") != null ? Long.valueOf(seg.get("vendorOid").toString()) : null);
            segment.setPrintStartNo(printStartNo);
            segment.setPrintEndNo(printEndNo);
            segment.setQuantity(quantity);
            segment.setSpec(seg.get("spec") != null ? seg.get("spec").toString() : null);
            segment.setPrice(seg.get("price") != null ? new java.math.BigDecimal(seg.get("price").toString()) : null);
            segment.setTotalAmount(seg.get("totalAmount") != null ? new java.math.BigDecimal(seg.get("totalAmount").toString()) : null);
            segment.setCreateBy(SecurityUtils.getUsername());
            segments.add(segment);
        }
        String username = SecurityUtils.getUsername();
        String batchNo = batch.getBatchNo();
        // 1. 号段数据落地 vms_batch_order_segment
        for (VmsBatchOrderSegment segment : segments) {
            this.vmsBatchOrderSegmentService.insertVmsBatchOrderSegment(segment);
        }
        // 2. 批次表状态改为"总行复核员审核中"(22)
        batch.setStatus("22");
        batch.setStatusRemark(statusRemark);
        this.vmsBatchService.updateVmsBatch(batch);
        // 3. 批次机构状态表：将当前总行下所有分行状态为"总行管理员汇总中"(21)的改为"总行复核员审核中"(22)
        VmsBatchOrgStatus branchQuery = new VmsBatchOrgStatus();
        branchQuery.setBatchNo(batchNo);
        List<VmsBatchOrgStatus> allBranchRecords = this.vmsBatchOrgStatusService.selectVmsBatchOrgStatusList(branchQuery);
        for (VmsBatchOrgStatus branch : allBranchRecords) {
            if ("21".equals(branch.getDetailStatus())) {
                branch.setDetailStatus("22");
                this.vmsBatchOrgStatusService.updateOrgStatusWithVersionCheck(branch);
            }
        }
        // 4. 日志流程表新增一条数据
        VmsBusinessLog log = new VmsBusinessLog();
        log.setBatchNo(batchNo);
        log.setActionType("SUBMIT_REVIEW");
        log.setActionDesc("提交审核");
        log.setOperatorId(username);
        log.setOperatorName(username);
        log.setOperatorOrgId(batch.getHeadOrgId());
        this.vmsBusinessLogService.insertVmsBusinessLog(log);
        return this.success();
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
        }
        String username = SecurityUtils.getUsername();
        String batchNo = batch.getBatchNo();
        // 1. 按凭证种类+分行汇总生成订单（仅汇总机构状态为"总行复核员审核中"(22)的分行）
        List<VmsOrder> orderSummaryList = this.vmsBatchDetailService.selectOrderSummaryForApprove(batchNo);
        if (orderSummaryList == null || orderSummaryList.isEmpty()) {
            return this.error("未找到符合条件的明细数据，无法生成订单");
        }
        for (VmsOrder order : orderSummaryList) {
            order.setBatchNo(batchNo);
            this.vmsOrderService.insertVmsOrder(order);
        }
        // 2. 按厂商汇总生成批次厂家合同（数据落地批次厂家合同表，号段信息从vms_batch_order_segment获取）
        List<VmsBatchReviewVo> reviewSegments = this.vmsBatchOrderSegmentService.selectReviewSegments(batchNo);
        java.util.Map<Long, List<VmsBatchReviewVo>> vendorGroupMap = new java.util.LinkedHashMap<>();
        for (VmsBatchReviewVo seg : reviewSegments) {
            vendorGroupMap.computeIfAbsent(seg.getVendorOid(), k -> new ArrayList<>()).add(seg);
        }
        for (java.util.Map.Entry<Long, List<VmsBatchReviewVo>> entry : vendorGroupMap.entrySet()) {
            VmsBatchVendorOrder vendorOrder = new VmsBatchVendorOrder();
            vendorOrder.setBatchNo(batchNo);
            vendorOrder.setVendorOid(entry.getKey());
            // 汇总印制号段
            StringBuilder printSegs = new StringBuilder();
            for (VmsBatchReviewVo seg : entry.getValue()) {
                if (printSegs.length() > 0) printSegs.append(",");
                printSegs.append(seg.getPrintStartNo()).append("-").append(seg.getPrintEndNo());
            }
            vendorOrder.setOrderFsipUrl(printSegs.toString());
            // TODO: 预留PDF生成、印章系统对接、CMS上传
            this.vmsBatchVendorOrderService.insertVmsBatchVendorOrder(vendorOrder);
        }
        // 3. 批次表状态改为"生成订单成功"(100)
        batch.setStatus("100");
        batch.setStatusRemark(vmsBatch.getStatusRemark());
        this.vmsBatchService.updateVmsBatch(batch);
        // 4. 日志流程表新增一条数据
        VmsBusinessLog log = new VmsBusinessLog();
        log.setBatchNo(batchNo);
        log.setActionType("APPROVE");
        log.setActionDesc("审核通过，生成订单");
        log.setOperatorId(username);
        log.setOperatorName(username);
        log.setOperatorOrgId(batch.getHeadOrgId());
        this.vmsBusinessLogService.insertVmsBusinessLog(log);
        // 5. 批次机构状态表：将总行下分行状态为"总行复核员审核中"(22)的改为"生成订单成功"(100)
        VmsBatchOrgStatus branchQuery = new VmsBatchOrgStatus();
        branchQuery.setBatchNo(batchNo);
        List<VmsBatchOrgStatus> allBranchRecords = this.vmsBatchOrgStatusService.selectVmsBatchOrgStatusList(branchQuery);
        for (VmsBatchOrgStatus branch : allBranchRecords) {
            if ("22".equals(branch.getDetailStatus())) {
                branch.setDetailStatus("100");
                this.vmsBatchOrgStatusService.updateOrgStatusWithVersionCheck(branch);
            }
        }
        return this.success();
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
        }
        String username = SecurityUtils.getUsername();
        String batchNo = batch.getBatchNo();
        // 1. 批次表状态改为"总行复核员退回"(23)
        batch.setStatus("23");
        batch.setStatusRemark(vmsBatch.getStatusRemark());
        this.vmsBatchService.updateVmsBatch(batch);
        // 2. 日志流程表新增一条数据
        VmsBusinessLog log = new VmsBusinessLog();
        log.setBatchNo(batchNo);
        log.setActionType("REJECT");
        log.setActionDesc("审核驳回");
        log.setOperatorId(username);
        log.setOperatorName(username);
        log.setOperatorOrgId(batch.getHeadOrgId());
        this.vmsBusinessLogService.insertVmsBusinessLog(log);
        // 3. 批次机构状态表：将总行下分行状态为"总行复核员审核中"(22)的改为"总行复核员退回"(23)
        VmsBatchOrgStatus branchQuery = new VmsBatchOrgStatus();
        branchQuery.setBatchNo(batchNo);
        List<VmsBatchOrgStatus> allBranchRecords = this.vmsBatchOrgStatusService.selectVmsBatchOrgStatusList(branchQuery);
        for (VmsBatchOrgStatus branch : allBranchRecords) {
            if ("22".equals(branch.getDetailStatus())) {
                branch.setDetailStatus("23");
                this.vmsBatchOrgStatusService.updateOrgStatusWithVersionCheck(branch);
            }
        }
        return this.success();
    }

    /**
     * 分行锁定：将批次机构状态从"待分行管理员汇总"(10)或"分行复核员退回"(13)改为"分行管理员汇总处理中"(11)
     * 使用乐观锁防止分行和支行同时操作同一批次
     */
    @PreAuthorize("@ss.hasPermi('order:batch:lock')")
    @Log(title = "分行批次锁定", businessType = BusinessType.UPDATE)
    @PutMapping({"/branch/lock"})
    public AjaxResult branchLock(@RequestBody VmsBatchOrgStatus param) {
        return doBranchStatusChange(param, new String[]{"10", "13"}, "11", "BRANCH_LOCK", "分行锁定批次");
    }

    /**
     * 分行解锁：将批次机构状态从"分行管理员汇总处理中"(11)改为"待分行管理员汇总"(10)
     */
    @PreAuthorize("@ss.hasPermi('order:batch:unlock')")
    @Log(title = "分行批次解锁", businessType = BusinessType.UPDATE)
    @PutMapping({"/branch/unlock"})
    public AjaxResult branchUnlock(@RequestBody VmsBatchOrgStatus param) {
        return doBranchStatusChange(param, new String[]{"11"}, "10", "BRANCH_UNLOCK", "分行解锁批次");
    }

    /**
     * 分行提交审核：将批次机构状态从"分行管理员汇总处理中"(11)改为"分行复核员审核中"(12)
     * 预留对接流程平台
     */
    @PreAuthorize("@ss.hasPermi('order:batch:submit')")
    @Log(title = "分行批次提交审核", businessType = BusinessType.UPDATE)
    @PutMapping({"/branch/submitReview"})
    public AjaxResult branchSubmitReview(@RequestBody VmsBatchOrgStatus param) {
        return doBranchStatusChange(param, new String[]{"11"}, "12", "BRANCH_SUBMIT_REVIEW", "分行提交审核");
    }

    /**
     * 分行状态变更通用方法：校验权限、校验前置状态、乐观锁更新、记录日志
     *
     * @param param            前端传入 batchNo + version
     * @param allowedStatuses  允许的前置状态数组
     * @param targetStatus     目标状态
     * @param actionType       日志操作类型
     * @param actionDesc       日志操作描述
     */
    private AjaxResult doBranchStatusChange(VmsBatchOrgStatus param, String[] allowedStatuses, String targetStatus, String actionType, String actionDesc) {
        if (StringUtils.isEmpty(param.getBatchNo())) {
            return this.error("批次号不能为空");
        }
        if (param.getVersion() == null) {
            return this.error("版本号不能为空");
        }
        // 获取当前用户分行机构号
        SysDept userDept = null;
        Long deptId = SecurityUtils.getLoginUser().getUser().getDeptId();
        if (deptId != null) {
            userDept = this.sysDeptService.selectDeptById(deptId);
        }
        if (userDept == null || !VmsOrderConstants.DEPT_LEVEL_BRANCH.equals(userDept.getDeptLevel())) {
            return this.error("仅分行管理员可操作");
        }
        String orgId = userDept.getDeptCode();
        if (StringUtils.isEmpty(orgId)) {
            return this.error("当前分行机构号为空");
        }
        // 校验主批次状态：仅"待总行管理员汇总"(20)和"总行复核员退回"(23)时允许分行操作
        VmsBatch batchQuery = new VmsBatch();
        batchQuery.setBatchNo(param.getBatchNo());
        List<VmsBatch> batchList = this.vmsBatchService.selectVmsBatchList(batchQuery);
        if (batchList.isEmpty()) {
            return this.error("批次不存在");
        }
        String batchStatus = batchList.get(0).getStatus();
        if (!"20".equals(batchStatus) && !"23".equals(batchStatus)) {
            return this.error("当前批次状态不允许分行操作");
        }
        // 查询当前机构状态记录
        VmsBatchOrgStatus query = new VmsBatchOrgStatus();
        query.setBatchNo(param.getBatchNo());
        query.setOrgId(orgId);
        List<VmsBatchOrgStatus> orgStatusList = this.vmsBatchOrgStatusService.selectVmsBatchOrgStatusList(query);
        if (orgStatusList.isEmpty()) {
            return this.error("未找到该分行的批次机构状态记录");
        }
        VmsBatchOrgStatus orgStatus = orgStatusList.get(0);
        // 校验前置状态
        boolean statusAllowed = false;
        for (String allowed : allowedStatuses) {
            if (allowed.equals(orgStatus.getDetailStatus())) {
                statusAllowed = true;
                break;
            }
        }
        if (!statusAllowed) {
            return this.error("当前批次机构状态不允许此操作");
        }
        // 乐观锁更新
        orgStatus.setDetailStatus(targetStatus);
        orgStatus.setVersion(param.getVersion());
        int rows = this.vmsBatchOrgStatusService.updateOrgStatusWithVersionCheck(orgStatus);
        if (rows == 0) {
            return this.error("操作失败，数据已被修改，请刷新后重试");
        }
        // 记录日志
        String username = SecurityUtils.getUsername();
        VmsBusinessLog log = new VmsBusinessLog();
        log.setBatchNo(param.getBatchNo());
        log.setActionType(actionType);
        log.setActionDesc(actionDesc);
        log.setOperatorId(username);
        log.setOperatorName(username);
        log.setOperatorOrgId(orgId);
        this.vmsBusinessLogService.insertVmsBusinessLog(log);
        // TODO: 提交审核时对接流程平台，发送安逸通知给分行复核员
        return this.success();
    }

    @PreAuthorize("@ss.hasPermi('order:detail:list')")
    @GetMapping({"/detail/list"})
    public TableDataInfo detailList(VmsBatchDetail vmsBatchDetail) {
        this.startPage();
        List<VmsBatchDetail> list = this.vmsBatchDetailService.selectVmsBatchDetailList(vmsBatchDetail);
        return this.getDataTable(list);
    }

    /**
     * 获取当前用户在指定批次下的机构状态信息（含乐观锁版本号）
     */
    @PreAuthorize("@ss.hasPermi('order:detail:list')")
    @GetMapping({"/detail/orgStatusInfo"})
    public AjaxResult getOrgStatusInfo(@RequestParam String batchNo) {
        Long deptId = SecurityUtils.getLoginUser().getUser().getDeptId();
        SysDept userDept = deptId != null ? this.sysDeptService.selectDeptById(deptId) : null;
        if (userDept == null || StringUtils.isEmpty(userDept.getDeptCode())) {
            return this.error("当前用户机构信息为空");
        }
        VmsBatchOrgStatus query = new VmsBatchOrgStatus();
        query.setBatchNo(batchNo);
        query.setOrgId(userDept.getDeptCode());
        List<VmsBatchOrgStatus> list = this.vmsBatchOrgStatusService.selectVmsBatchOrgStatusList(query);
        if (list.isEmpty()) {
            return this.success();
        }
        VmsBatchOrgStatus orgStatus = list.get(0);
        AjaxResult result = this.success();
        result.put("detailStatus", orgStatus.getDetailStatus());
        result.put("version", orgStatus.getVersion());
        return result;
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
            AjaxResult checkResult = this.checkBatchDetailOperateStatus(vmsBatchDetail.getBatchNo(), vmsBatchDetail.getBranchOrgId(), vmsBatchDetail.getSubbranchOrgId(), vmsBatchDetail.getOrgVersion());
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
        AjaxResult checkResult = this.checkBatchDetailOperateStatus(vmsBatchDetail.getBatchNo(), vmsBatchDetail.getBranchOrgId(), vmsBatchDetail.getSubbranchOrgId(), vmsBatchDetail.getOrgVersion());
        if (checkResult != null) {
            return checkResult;
        }
        // 乐观锁更新明细
        int rows = this.vmsBatchDetailService.updateDetailWithVersionCheck(vmsBatchDetail);
        if (rows == 0) {
            return this.error("操作失败，数据已被修改，请刷新后重试");
        }
        return this.success();
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
        }
        // 校验机构状态版本（分行退回时也需要确认批次未被锁定）
        AjaxResult checkResult = this.checkBatchDetailOperateStatus(detail.getBatchNo(), detail.getBranchOrgId(), detail.getSubbranchOrgId(), vmsBatchDetail.getOrgVersion());
        if (checkResult != null) {
            return checkResult;
        }
        // 乐观锁更新明细状态为退回
        detail.setDetailStatus("01");
        int rows = this.vmsBatchDetailService.updateDetailWithVersionCheck(detail);
        if (rows == 0) {
            return this.error("操作失败，数据已被修改，请刷新后重试");
        }
        return this.success();
    }

    @PreAuthorize("@ss.hasPermi('order:detail:remove')")
    @Log(
            title = "批次明细",
            businessType = BusinessType.DELETE
    )
    @DeleteMapping({"/detail/{oids}"})
    public AjaxResult removeDetail(@PathVariable Long[] oids, @RequestParam(value = "orgVersion", required = false) Integer orgVersion) {
        if (oids != null && oids.length > 0) {
            // 用第一条明细做机构状态校验
            VmsBatchDetail firstDetail = this.vmsBatchDetailService.selectVmsBatchDetailByOid(oids[0]);
            if (firstDetail != null) {
                AjaxResult checkResult = this.checkBatchDetailOperateStatus(firstDetail.getBatchNo(), firstDetail.getBranchOrgId(), firstDetail.getSubbranchOrgId(), orgVersion);
                if (checkResult != null) {
                    return checkResult;
                }
            }
            // 逐条乐观锁删除
            for (Long oid : oids) {
                VmsBatchDetail detail = this.vmsBatchDetailService.selectVmsBatchDetailByOid(oid);
                if (detail == null) {
                    return this.error("明细oid=" + oid + "不存在");
                }
                int rows = this.vmsBatchDetailService.deleteDetailWithVersionCheck(detail);
                if (rows == 0) {
                    return this.error("操作失败，数据已被修改，请刷新后重试");
                }
            }
        }
        return this.success();
    }

    /**
     * 获取审核弹窗号段列表：查询批次订单号段表，关联模版表和厂商表
     */
    @PreAuthorize("@ss.hasPermi('order:batch:approve')")
    @GetMapping({"/review/segments"})
    public AjaxResult reviewSegments(@RequestParam String batchNo) {
        List<VmsBatchReviewVo> list = this.vmsBatchOrderSegmentService.selectReviewSegments(batchNo);
        return this.success(list);
    }

    /**
     * 获取提交审核弹窗的建议开始号段：
     * 1. 当前批次号段表已有该凭证号段数据 → 直接使用当前批次的开始号段
     * 2. 当前批次无号段数据 → 查询上一批次订购成功的号段，结束号段+1作为开始号段
     * 3. 均未查到 → 开始号段为空
     */
    @PreAuthorize("@ss.hasPermi('order:batch:submit')")
    @GetMapping({"/suggestStartNos"})
    public AjaxResult suggestStartNos(@RequestParam String batchNo) {
        java.util.Map<Long, String> resultMap = new java.util.LinkedHashMap<>();
        // 1. 查询当前批次已有的号段数据
        List<VmsBatchOrderSegment> currentSegments = this.vmsBatchOrderSegmentService.selectCurrentBatchSegments(batchNo);
        java.util.Map<Long, VmsBatchOrderSegment> currentMap = new java.util.LinkedHashMap<>();
        for (VmsBatchOrderSegment seg : currentSegments) {
            currentMap.put(seg.getTemplateOid(), seg);
        }
        // 2. 查询上一批次订购成功的每种凭证最大结束号段
        List<VmsBatchOrderSegment> lastEndNos = this.vmsBatchOrderSegmentService.selectLastBatchEndNos(batchNo);
        java.util.Map<Long, VmsBatchOrderSegment> lastMap = new java.util.LinkedHashMap<>();
        for (VmsBatchOrderSegment seg : lastEndNos) {
            lastMap.put(seg.getTemplateOid(), seg);
        }
        // 3. 合并所有涉及的 templateOid
        java.util.Set<Long> allTemplateOids = new java.util.LinkedHashSet<>();
        allTemplateOids.addAll(currentMap.keySet());
        allTemplateOids.addAll(lastMap.keySet());
        // 4. 按优先级组装结果
        for (Long templateOid : allTemplateOids) {
            if (currentMap.containsKey(templateOid)) {
                // 当前批次已有号段，直接使用开始号段
                resultMap.put(templateOid, currentMap.get(templateOid).getPrintStartNo());
            } else if (lastMap.containsKey(templateOid)) {
                // 上一批次有号段，结束号段+1
                String lastEndNo = lastMap.get(templateOid).getPrintEndNo();
                if (lastEndNo != null && !lastEndNo.isEmpty()) {
                    try {
                        long endNo = Long.parseLong(lastEndNo);
                        resultMap.put(templateOid, String.valueOf(endNo + 1));
                    } catch (NumberFormatException e) {
                        // 号段格式错误，不设置
                    }
                }
            }
            // 均未找到则不放入 resultMap，前端对应为空
        }
        return this.success(resultMap);
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

    private AjaxResult checkBatchDetailOperateStatus(String batchNo, String branchOrgId, String subbranchOrgId, Integer orgVersion) {
        VmsBatch batchQuery = new VmsBatch();
        batchQuery.setBatchNo(batchNo);
        List<VmsBatch> batchList = this.vmsBatchService.selectVmsBatchList(batchQuery);
        if (batchList.isEmpty()) {
            return this.error("批次不存在");
        } else {
            VmsBatch batch = (VmsBatch)batchList.get(0);
            if (!"20".equals(batch.getStatus())) {
                return this.error("当前批次状态不允许增删改操作");
            } else {
                VmsBatchOrgStatus orgStatusQuery = new VmsBatchOrgStatus();
                orgStatusQuery.setBatchNo(batchNo);
                orgStatusQuery.setOrgId(branchOrgId);
                List<VmsBatchOrgStatus> orgStatusList = this.vmsBatchOrgStatusService.selectVmsBatchOrgStatusList(orgStatusQuery);
                if (orgStatusList.isEmpty()) {
                    return this.error("未找到机构状态记录");
                } else {
                    VmsBatchOrgStatus orgStatus = (VmsBatchOrgStatus)orgStatusList.get(0);
                    String detailStatus = orgStatus.getDetailStatus();
                    if (!"10".equals(detailStatus) && !"13".equals(detailStatus)) {
                        return this.error("当前机构状态不允许增删改操作");
                    }
                    // 机构状态乐观锁校验：防止支行操作时分行已锁定批次
                    if (orgVersion != null && !orgVersion.equals(orgStatus.getVersion())) {
                        return this.error("操作失败，批次机构状态已被修改，请刷新后重试");
                    }
                    return null;
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
