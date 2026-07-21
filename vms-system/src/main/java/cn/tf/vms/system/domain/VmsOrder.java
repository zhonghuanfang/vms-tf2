package cn.tf.vms.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import cn.tf.vms.common.annotation.Excel;
import cn.tf.vms.common.core.domain.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

public class VmsOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long oid;

    @Excel(name = "批次号")
    private String batchNo;

    @Excel(name = "凭证模版oid")
    private Long templateOid;

    @Excel(name = "凭证名称")
    private String voucherName;

    @Excel(name = "厂商oid")
    private Long vendorOid;

    @Excel(name = "厂商名称")
    private String vendorName;

    @Excel(name = "数量")
    private Integer quantity;

    @Excel(name = "单价")
    private BigDecimal price;

    @Excel(name = "规格")
    private String spec;

    @Excel(name = "金额")
    private BigDecimal amount;

    @Excel(name = "快递单号")
    private String expressNo;

    @Excel(name = "快递时间")
    private Date expressTime;

    @Excel(name = "实际申领数量")
    private Integer actualClaimQty;

    @Excel(name = "领用开始号段")
    private String claimStartNo;

    @Excel(name = "领用结束号段")
    private String claimEndNo;

    @Excel(name = "申领状态")
    private String claimStatus;

    @Excel(name = "申领备注")
    private String claimRemark;

    @Excel(name = "上传附件地址")
    private String attachUrl;

    @Excel(name = "订单状态")
    private String orderStatus;


    public void setOid(Long oid) { this.oid = oid; }
    public Long getOid() { return oid; }

    public void setBatchNo(String batchNo) { this.batchNo = batchNo; }
    public String getBatchNo() { return batchNo; }

    public void setTemplateOid(Long templateOid) { this.templateOid = templateOid; }
    public Long getTemplateOid() { return templateOid; }

    public void setVoucherName(String voucherName) { this.voucherName = voucherName; }
    public String getVoucherName() { return voucherName; }

    public void setVendorOid(Long vendorOid) { this.vendorOid = vendorOid; }
    public Long getVendorOid() { return vendorOid; }

    public void setVendorName(String vendorName) { this.vendorName = vendorName; }
    public String getVendorName() { return vendorName; }

    public void setQuantity(Integer quantity) { this.quantity = quantity; }
    public Integer getQuantity() { return quantity; }

    public void setPrice(BigDecimal price) { this.price = price; }
    public BigDecimal getPrice() { return price; }

    public void setSpec(String spec) { this.spec = spec; }
    public String getSpec() { return spec; }

    public void setAmount(BigDecimal amount) { this.amount = amount; }
    public BigDecimal getAmount() { return amount; }

    public void setExpressNo(String expressNo) { this.expressNo = expressNo; }
    public String getExpressNo() { return expressNo; }

    public void setExpressTime(Date expressTime) { this.expressTime = expressTime; }
    public Date getExpressTime() { return expressTime; }

    public void setActualClaimQty(Integer actualClaimQty) { this.actualClaimQty = actualClaimQty; }
    public Integer getActualClaimQty() { return actualClaimQty; }

    public void setClaimStartNo(String claimStartNo) { this.claimStartNo = claimStartNo; }
    public String getClaimStartNo() { return claimStartNo; }

    public void setClaimEndNo(String claimEndNo) { this.claimEndNo = claimEndNo; }
    public String getClaimEndNo() { return claimEndNo; }

    public void setClaimStatus(String claimStatus) { this.claimStatus = claimStatus; }
    public String getClaimStatus() { return claimStatus; }

    public void setClaimRemark(String claimRemark) { this.claimRemark = claimRemark; }
    public String getClaimRemark() { return claimRemark; }

    public void setAttachUrl(String attachUrl) { this.attachUrl = attachUrl; }
    public String getAttachUrl() { return attachUrl; }

    public void setOrderStatus(String orderStatus) { this.orderStatus = orderStatus; }
    public String getOrderStatus() { return orderStatus; }

    @Override
    public String toString() {
        return new org.apache.commons.lang3.builder.ToStringBuilder(this,org.apache.commons.lang3.builder.ToStringStyle.MULTI_LINE_STYLE)
                .append("oid", getOid())
                .append("batchNo", getBatchNo())
                .append("templateOid", getTemplateOid())
                .append("voucherName", getVoucherName())
                .append("vendorOid", getVendorOid())
                .append("vendorName", getVendorName())
                .append("quantity", getQuantity())
                .append("price", getPrice())
                .append("spec", getSpec())
                .append("amount", getAmount())
                .append("expressNo", getExpressNo())
                .append("expressTime", getExpressTime())
                .append("actualClaimQty", getActualClaimQty())
                .append("claimStartNo", getClaimStartNo())
                .append("claimEndNo", getClaimEndNo())
                .append("claimStatus", getClaimStatus())
                .append("claimRemark", getClaimRemark())
                .append("attachUrl", getAttachUrl())
                .append("orderStatus", getOrderStatus())
                .toString();
    }
}
