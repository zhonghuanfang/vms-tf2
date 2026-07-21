package cn.tf.vms.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import cn.tf.vms.common.annotation.Excel;
import cn.tf.vms.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

public class VmsBatch extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long oid;

    @Excel(name = "批次号")
    private String batchNo;

    @Excel(name = "批次名称")
    private String batchName;

    @Excel(name = "开始时间")
    private Date startTime;

    @Excel(name = "结束时间")
    private Date endTime;

    @Excel(name = "批次说明")
    private String batchDesc;

    @Excel(name = "批次状态")
    private String status;

    @Excel(name = "状态备注")
    private String statusRemark;

    @Excel(name = "创建人ID")
    private String createdBy;

    @Excel(name = "乐观锁版本号")
    private Integer version;

    @Excel(name = "创建总行机构号")
    private String headOrgId;


    public void setOid(Long oid) { this.oid = oid; }
    public Long getOid() { return oid; }

    public void setBatchNo(String batchNo) { this.batchNo = batchNo; }
    public String getBatchNo() { return batchNo; }

    public void setBatchName(String batchName) { this.batchName = batchName; }
    public String getBatchName() { return batchName; }

    public void setStartTime(Date startTime) { this.startTime = startTime; }
    public Date getStartTime() { return startTime; }

    public void setEndTime(Date endTime) { this.endTime = endTime; }
    public Date getEndTime() { return endTime; }

    public void setBatchDesc(String batchDesc) { this.batchDesc = batchDesc; }
    public String getBatchDesc() { return batchDesc; }

    public void setStatus(String status) { this.status = status; }
    public String getStatus() { return status; }

    public void setStatusRemark(String statusRemark) { this.statusRemark = statusRemark; }
    public String getStatusRemark() { return statusRemark; }

    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }
    public String getCreatedBy() { return createdBy; }

    public void setVersion(Integer version) { this.version = version; }
    public Integer getVersion() { return version; }

    public void setHeadOrgId(String headOrgId) { this.headOrgId = headOrgId; }
    public String getHeadOrgId() { return headOrgId; }

    @Override
    public String toString() {
        return new org.apache.commons.lang3.builder.ToStringBuilder(this,org.apache.commons.lang3.builder.ToStringStyle.MULTI_LINE_STYLE)
                .append("oid", getOid())
                .append("batchNo", getBatchNo())
                .append("batchName", getBatchName())
                .append("startTime", getStartTime())
                .append("endTime", getEndTime())
                .append("batchDesc", getBatchDesc())
                .append("status", getStatus())
                .append("statusRemark", getStatusRemark())
                .append("createdBy", getCreatedBy())
                .append("version", getVersion())
                .append("headOrgId", getHeadOrgId())
                .toString();
    }
}
