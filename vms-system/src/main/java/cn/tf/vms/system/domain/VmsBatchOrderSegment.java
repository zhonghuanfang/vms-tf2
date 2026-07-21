package cn.tf.vms.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import cn.tf.vms.common.annotation.Excel;
import cn.tf.vms.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

public class VmsBatchOrderSegment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long oid;

    @Excel(name = "批次号")
    private String batchNo;

    @Excel(name = "模版oid")
    private Long templateOid;

    @Excel(name = "厂商ID")
    private String vendorId;

    @Excel(name = "印制开始号段")
    private String printStartNo;

    @Excel(name = "印制结束号段")
    private String printEndNo;


    public void setOid(Long oid) { this.oid = oid; }
    public Long getOid() { return oid; }

    public void setBatchNo(String batchNo) { this.batchNo = batchNo; }
    public String getBatchNo() { return batchNo; }

    public void setTemplateOid(Long templateOid) { this.templateOid = templateOid; }
    public Long getTemplateOid() { return templateOid; }

    public void setVendorId(String vendorId) { this.vendorId = vendorId; }
    public String getVendorId() { return vendorId; }

    public void setPrintStartNo(String printStartNo) { this.printStartNo = printStartNo; }
    public String getPrintStartNo() { return printStartNo; }

    public void setPrintEndNo(String printEndNo) { this.printEndNo = printEndNo; }
    public String getPrintEndNo() { return printEndNo; }

    @Override
    public String toString() {
        return new org.apache.commons.lang3.builder.ToStringBuilder(this,org.apache.commons.lang3.builder.ToStringStyle.MULTI_LINE_STYLE)
                .append("oid", getOid())
                .append("batchNo", getBatchNo())
                .append("templateOid", getTemplateOid())
                .append("vendorId", getVendorId())
                .append("printStartNo", getPrintStartNo())
                .append("printEndNo", getPrintEndNo())
                .toString();
    }
}
