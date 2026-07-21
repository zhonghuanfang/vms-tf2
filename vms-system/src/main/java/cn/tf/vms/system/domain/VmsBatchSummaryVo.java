package cn.tf.vms.system.domain;

import java.math.BigDecimal;

public class VmsBatchSummaryVo
{
    private Long templateOid; private String category; private String templateName;
    private String templateCode; private String vendorName; private String spec;
    private BigDecimal price; private Integer totalQuantity; private BigDecimal totalAmount;
    private String branchOrgId; private String status;

    public Long getTemplateOid() { return templateOid; }
    public void setTemplateOid(Long templateOid) { this.templateOid = templateOid; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getTemplateName() { return templateName; }
    public void setTemplateName(String templateName) { this.templateName = templateName; }
    public String getTemplateCode() { return templateCode; }
    public void setTemplateCode(String templateCode) { this.templateCode = templateCode; }
    public String getVendorName() { return vendorName; }
    public void setVendorName(String vendorName) { this.vendorName = vendorName; }
    public String getSpec() { return spec; }
    public void setSpec(String spec) { this.spec = spec; }
    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }
    public Integer getTotalQuantity() { return totalQuantity; }
    public void setTotalQuantity(Integer totalQuantity) { this.totalQuantity = totalQuantity; }
    public BigDecimal getTotalAmount() { return totalAmount; }
    public void setTotalAmount(BigDecimal totalAmount) { this.totalAmount = totalAmount; }
    public String getBranchOrgId() { return branchOrgId; }
    public void setBranchOrgId(String branchOrgId) { this.branchOrgId = branchOrgId; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
