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

    @Excel(name = "厂商oid")
    private Long vendorOid;

    @Excel(name = "印制开始号段")
    private String printStartNo;

    @Excel(name = "印制结束号段")
    private String printEndNo;

    @Excel(name = "数量")
    private Integer quantity;

    @Excel(name = "规格")
    private String spec;

    @Excel(name = "单价")
    private BigDecimal price;

    @Excel(name = "总价")
    private BigDecimal totalAmount;

    @Excel(name = "创建人ID")
    private String createBy;

    @Excel(name = "更新人ID")
    private String updateBy;

    @Excel(name = "更新时间")
    private Date updateTime;


    public void setOid(Long oid) { this.oid = oid; }
    public Long getOid() { return oid; }

    public void setBatchNo(String batchNo) { this.batchNo = batchNo; }
    public String getBatchNo() { return batchNo; }

    public void setTemplateOid(Long templateOid) { this.templateOid = templateOid; }
    public Long getTemplateOid() { return templateOid; }

    public void setVendorOid(Long vendorOid) { this.vendorOid = vendorOid; }
    public Long getVendorOid() { return vendorOid; }

    public void setPrintStartNo(String printStartNo) { this.printStartNo = printStartNo; }
    public String getPrintStartNo() { return printStartNo; }

    public void setPrintEndNo(String printEndNo) { this.printEndNo = printEndNo; }
    public String getPrintEndNo() { return printEndNo; }

    public void setQuantity(Integer quantity) { this.quantity = quantity; }
    public Integer getQuantity() { return quantity; }

    public void setSpec(String spec) { this.spec = spec; }
    public String getSpec() { return spec; }

    public void setPrice(BigDecimal price) { this.price = price; }
    public BigDecimal getPrice() { return price; }

    public void setTotalAmount(BigDecimal totalAmount) { this.totalAmount = totalAmount; }
    public BigDecimal getTotalAmount() { return totalAmount; }

    public void setCreateBy(String createBy) { this.createBy = createBy; }
    public String getCreateBy() { return createBy; }

    public void setUpdateBy(String updateBy) { this.updateBy = updateBy; }
    public String getUpdateBy() { return updateBy; }

    public void setUpdateTime(Date updateTime) { this.updateTime = updateTime; }
    public Date getUpdateTime() { return updateTime; }

    @Override
    public String toString() {
        return new org.apache.commons.lang3.builder.ToStringBuilder(this,org.apache.commons.lang3.builder.ToStringStyle.MULTI_LINE_STYLE)
                .append("oid", getOid())
                .append("batchNo", getBatchNo())
                .append("templateOid", getTemplateOid())
                .append("vendorOid", getVendorOid())
                .append("printStartNo", getPrintStartNo())
                .append("printEndNo", getPrintEndNo())
                .append("quantity", getQuantity())
                .append("spec", getSpec())
                .append("price", getPrice())
                .append("totalAmount", getTotalAmount())
                .append("createBy", getCreateBy())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
