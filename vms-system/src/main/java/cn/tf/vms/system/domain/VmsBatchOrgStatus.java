package cn.tf.vms.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import cn.tf.vms.common.annotation.Excel;
import cn.tf.vms.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

public class VmsBatchOrgStatus extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long oid;

    @Excel(name = "批次号")
    private String batchNo;

    @Excel(name = "机构号")
    private String orgId;

    @Excel(name = "明细状态")
    private String detailStatus;

    @Excel(name = "状态备注")
    private String statusRemark;

    @Excel(name = "创建人ID")
    private String createdBy;

    @Excel(name = "乐观锁版本号")
    private Integer version;


    public void setOid(Long oid) { this.oid = oid; }
    public Long getOid() { return oid; }

    public void setBatchNo(String batchNo) { this.batchNo = batchNo; }
    public String getBatchNo() { return batchNo; }

    public void setOrgId(String orgId) { this.orgId = orgId; }
    public String getOrgId() { return orgId; }

    public void setDetailStatus(String detailStatus) { this.detailStatus = detailStatus; }
    public String getDetailStatus() { return detailStatus; }

    public void setStatusRemark(String statusRemark) { this.statusRemark = statusRemark; }
    public String getStatusRemark() { return statusRemark; }

    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }
    public String getCreatedBy() { return createdBy; }

    public void setVersion(Integer version) { this.version = version; }
    public Integer getVersion() { return version; }

    @Override
    public String toString() {
        return new org.apache.commons.lang3.builder.ToStringBuilder(this,org.apache.commons.lang3.builder.ToStringStyle.MULTI_LINE_STYLE)
                .append("oid", getOid())
                .append("batchNo", getBatchNo())
                .append("orgId", getOrgId())
                .append("detailStatus", getDetailStatus())
                .append("statusRemark", getStatusRemark())
                .append("createdBy", getCreatedBy())
                .append("version", getVersion())
                .toString();
    }
}
