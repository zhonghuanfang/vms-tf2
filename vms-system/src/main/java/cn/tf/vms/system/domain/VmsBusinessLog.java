package cn.tf.vms.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import cn.tf.vms.common.annotation.Excel;
import cn.tf.vms.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

public class VmsBusinessLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long oid;

    @Excel(name = "关联批次号")
    private String batchNo;

    @Excel(name = "关联订单oid")
    private Long orderOid;

    @Excel(name = "操作类型")
    private String actionType;

    @Excel(name = "操作描述")
    private String actionDesc;

    @Excel(name = "操作人ID")
    private String operatorId;

    @Excel(name = "操作人姓名")
    private String operatorName;

    @Excel(name = "操作机构")
    private String operatorOrgId;

    @Excel(name = "操作前数据")
    private String detailBefore;

    @Excel(name = "操作后数据")
    private String detailAfter;

    @Excel(name = "乐观锁版本号")
    private Integer version;


    public void setOid(Long oid) { this.oid = oid; }
    public Long getOid() { return oid; }

    public void setBatchNo(String batchNo) { this.batchNo = batchNo; }
    public String getBatchNo() { return batchNo; }

    public void setOrderOid(Long orderOid) { this.orderOid = orderOid; }
    public Long getOrderOid() { return orderOid; }

    public void setActionType(String actionType) { this.actionType = actionType; }
    public String getActionType() { return actionType; }

    public void setActionDesc(String actionDesc) { this.actionDesc = actionDesc; }
    public String getActionDesc() { return actionDesc; }

    public void setOperatorId(String operatorId) { this.operatorId = operatorId; }
    public String getOperatorId() { return operatorId; }

    public void setOperatorName(String operatorName) { this.operatorName = operatorName; }
    public String getOperatorName() { return operatorName; }

    public void setOperatorOrgId(String operatorOrgId) { this.operatorOrgId = operatorOrgId; }
    public String getOperatorOrgId() { return operatorOrgId; }

    public void setDetailBefore(String detailBefore) { this.detailBefore = detailBefore; }
    public String getDetailBefore() { return detailBefore; }

    public void setDetailAfter(String detailAfter) { this.detailAfter = detailAfter; }
    public String getDetailAfter() { return detailAfter; }

    public void setVersion(Integer version) { this.version = version; }
    public Integer getVersion() { return version; }

    @Override
    public String toString() {
        return new org.apache.commons.lang3.builder.ToStringBuilder(this,org.apache.commons.lang3.builder.ToStringStyle.MULTI_LINE_STYLE)
                .append("oid", getOid())
                .append("batchNo", getBatchNo())
                .append("orderOid", getOrderOid())
                .append("actionType", getActionType())
                .append("actionDesc", getActionDesc())
                .append("operatorId", getOperatorId())
                .append("operatorName", getOperatorName())
                .append("operatorOrgId", getOperatorOrgId())
                .append("detailBefore", getDetailBefore())
                .append("detailAfter", getDetailAfter())
                .append("version", getVersion())
                .toString();
    }
}
