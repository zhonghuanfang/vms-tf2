package cn.tf.vms.system.domain;

import java.math.BigDecimal;

/**
 * 审核号段展示VO：关联批次订单号段表、模版表、厂商表
 */
public class VmsBatchReviewVo
{
    private Long templateOid;
    private String category;
    private String templateName;
    private String templateCode;
    private Long vendorOid;
    private String vendorName;
    private String spec;
    private BigDecimal price;
    private Integer quantity;
    private BigDecimal totalAmount;
    private String printStartNo;
    private String printEndNo;

    public Long getTemplateOid() { return templateOid; }
    public void setTemplateOid(Long templateOid) { this.templateOid = templateOid; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getTemplateName() { return templateName; }
    public void setTemplateName(String templateName) { this.templateName = templateName; }
    public String getTemplateCode() { return templateCode; }
    public void setTemplateCode(String templateCode) { this.templateCode = templateCode; }
    public Long getVendorOid() { return vendorOid; }
    public void setVendorOid(Long vendorOid) { this.vendorOid = vendorOid; }
    public String getVendorName() { return vendorName; }
    public void setVendorName(String vendorName) { this.vendorName = vendorName; }
    public String getSpec() { return spec; }
    public void setSpec(String spec) { this.spec = spec; }
    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }
    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }
    public BigDecimal getTotalAmount() { return totalAmount; }
    public void setTotalAmount(BigDecimal totalAmount) { this.totalAmount = totalAmount; }
    public String getPrintStartNo() { return printStartNo; }
    public void setPrintStartNo(String printStartNo) { this.printStartNo = printStartNo; }
    public String getPrintEndNo() { return printEndNo; }
    public void setPrintEndNo(String printEndNo) { this.printEndNo = printEndNo; }
}
