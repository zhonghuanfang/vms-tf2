package cn.tf.vms.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import cn.tf.vms.common.annotation.Excel;
import cn.tf.vms.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

public class VmsBatchDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long oid;

    @Excel(name = "批次号")
    private String batchNo;

    @Excel(name = "凭证模版oid")
    private Long templateOid;

    @Excel(name = "数量")
    private Integer quantity;

    @Excel(name = "规格")
    private String spec;

    @Excel(name = "单价")
    private BigDecimal price;

    @Excel(name = "总价")
    private BigDecimal totalAmount;

    @Excel(name = "支行号")
    private String subbranchOrgId;

    @Excel(name = "分行号")
    private String branchOrgId;

    @Excel(name = "总行号")
    private String headOrgId;

    @Excel(name = "创建人ID")
    private String createdBy;

    @Excel(name = "明细视角")
    private String detailView;

    @Excel(name = "明细状态")
    private String detailStatus;

    @Excel(name = "状态备注")
    private String statusRemark;

    @Excel(name = "删除标志")
    private String delFlag;

    @Excel(name = "乐观锁版本号")
    private Integer version;

    /** 非持久化字段：前端传入的批次机构状态版本号，用于乐观锁校验 */
    private Integer orgVersion;


    public void setOid(Long oid) { this.oid = oid; }
    public Long getOid() { return oid; }

    public void setBatchNo(String batchNo) { this.batchNo = batchNo; }
    public String getBatchNo() { return batchNo; }

    public void setTemplateOid(Long templateOid) { this.templateOid = templateOid; }
    public Long getTemplateOid() { return templateOid; }

    public void setQuantity(Integer quantity) { this.quantity = quantity; }
    public Integer getQuantity() { return quantity; }

    public void setSpec(String spec) { this.spec = spec; }
    public String getSpec() { return spec; }

    public void setPrice(BigDecimal price) { this.price = price; }
    public BigDecimal getPrice() { return price; }

    public void setTotalAmount(BigDecimal totalAmount) { this.totalAmount = totalAmount; }
    public BigDecimal getTotalAmount() { return totalAmount; }

    public void setSubbranchOrgId(String subbranchOrgId) { this.subbranchOrgId = subbranchOrgId; }
    public String getSubbranchOrgId() { return subbranchOrgId; }

    public void setBranchOrgId(String branchOrgId) { this.branchOrgId = branchOrgId; }
    public String getBranchOrgId() { return branchOrgId; }

    public void setHeadOrgId(String headOrgId) { this.headOrgId = headOrgId; }
    public String getHeadOrgId() { return headOrgId; }

    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }
    public String getCreatedBy() { return createdBy; }

    public void setDetailView(String detailView) { this.detailView = detailView; }
    public String getDetailView() { return detailView; }

    public void setDetailStatus(String detailStatus) { this.detailStatus = detailStatus; }
    public String getDetailStatus() { return detailStatus; }

    public void setStatusRemark(String statusRemark) { this.statusRemark = statusRemark; }
    public String getStatusRemark() { return statusRemark; }

    public void setDelFlag(String delFlag) { this.delFlag = delFlag; }
    public String getDelFlag() { return delFlag; }

    public void setVersion(Integer version) { this.version = version; }
    public Integer getVersion() { return version; }

    public void setOrgVersion(Integer orgVersion) { this.orgVersion = orgVersion; }
    public Integer getOrgVersion() { return orgVersion; }

    @Override
    public String toString() {
        return new org.apache.commons.lang3.builder.ToStringBuilder(this,org.apache.commons.lang3.builder.ToStringStyle.MULTI_LINE_STYLE)
                .append("oid", getOid())
                .append("batchNo", getBatchNo())
                .append("templateOid", getTemplateOid())
                .append("quantity", getQuantity())
                .append("spec", getSpec())
                .append("price", getPrice())
                .append("totalAmount", getTotalAmount())
                .append("subbranchOrgId", getSubbranchOrgId())
                .append("branchOrgId", getBranchOrgId())
                .append("headOrgId", getHeadOrgId())
                .append("createdBy", getCreatedBy())
                .append("detailView", getDetailView())
                .append("detailStatus", getDetailStatus())
                .append("statusRemark", getStatusRemark())
                .append("delFlag", getDelFlag())
                .append("version", getVersion())
                .toString();
    }
}
