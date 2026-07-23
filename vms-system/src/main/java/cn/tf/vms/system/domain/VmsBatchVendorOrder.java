package cn.tf.vms.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import cn.tf.vms.common.annotation.Excel;
import cn.tf.vms.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

public class VmsBatchVendorOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long oid;

    @Excel(name = "批次号")
    private String batchNo;

    @Excel(name = "厂商oid")
    private Long vendorOid;

    @Excel(name = "订单模版fsip地址")
    private String orderFsipUrl;

    @Excel(name = "批次状态")
    private String batchStatus;


    public void setOid(Long oid) { this.oid = oid; }
    public Long getOid() { return oid; }

    public void setBatchNo(String batchNo) { this.batchNo = batchNo; }
    public String getBatchNo() { return batchNo; }

    public void setVendorOid(Long vendorOid) { this.vendorOid = vendorOid; }
    public Long getVendorOid() { return vendorOid; }

    public void setOrderFsipUrl(String orderFsipUrl) { this.orderFsipUrl = orderFsipUrl; }
    public String getOrderFsipUrl() { return orderFsipUrl; }

    public void setBatchStatus(String batchStatus) { this.batchStatus = batchStatus; }
    public String getBatchStatus() { return batchStatus; }

    @Override
    public String toString() {
        return new org.apache.commons.lang3.builder.ToStringBuilder(this,org.apache.commons.lang3.builder.ToStringStyle.MULTI_LINE_STYLE)
                .append("oid", getOid())
                .append("batchNo", getBatchNo())
                .append("vendorOid", getVendorOid())
                .append("orderFsipUrl", getOrderFsipUrl())
                .append("batchStatus", getBatchStatus())
                .toString();
    }
}
