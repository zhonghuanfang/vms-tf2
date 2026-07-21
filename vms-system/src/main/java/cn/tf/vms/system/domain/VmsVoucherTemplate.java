package cn.tf.vms.system.domain;

import java.math.BigDecimal;
import cn.tf.vms.common.annotation.Excel;
import cn.tf.vms.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 凭证模版对象 vms_voucher_template
 *
 * @author zhonghuanfang
 * @date 2026-07-21
 */
public class VmsVoucherTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** oid */
    private Long oid;

    /** 模版ID */
    @Excel(name = "模版ID")
    private String templateId;

    /** 模版名称 */
    @Excel(name = "模版名称")
    private String templateName;

    /** 模版编号 */
    @Excel(name = "模版编号")
    private String templateCode;

    /** 模版类型 */
    @Excel(name = "模版类型")
    private String templateType;

    /** 凭证类别: 一般/重空 */
    @Excel(name = "凭证类别: 一般/重空")
    private String category;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal price;

    /** 规格 */
    @Excel(name = "规格")
    private String spec;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    /** 税率% */
    @Excel(name = "税率%")
    private BigDecimal taxRate;

    /** 厂商ID */
    @Excel(name = "厂商ID")
    private String vendorId;

    /** 管理机构 */
    @Excel(name = "管理机构")
    private String manageOrg;

    /** 管理人 */
    @Excel(name = "管理人")
    private String managePerson;

    /** 管理人联系方式 */
    @Excel(name = "管理人联系方式")
    private String managePhone;

    /** 版本 */
    @Excel(name = "版本")
    private String version;

    /** 模版fsip地址 */
    @Excel(name = "模版fsip地址")
    private String fsipUrl;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setOid(Long oid)
    {
        this.oid = oid;
    }

    public Long getOid()
    {
        return oid;
    }

    public void setTemplateId(String templateId)
    {
        this.templateId = templateId;
    }

    public String getTemplateId()
    {
        return templateId;
    }

    public void setTemplateName(String templateName)
    {
        this.templateName = templateName;
    }

    public String getTemplateName()
    {
        return templateName;
    }

    public void setTemplateCode(String templateCode)
    {
        this.templateCode = templateCode;
    }

    public String getTemplateCode()
    {
        return templateCode;
    }

    public void setTemplateType(String templateType)
    {
        this.templateType = templateType;
    }

    public String getTemplateType()
    {
        return templateType;
    }

    public void setCategory(String category)
    {
        this.category = category;
    }

    public String getCategory()
    {
        return category;
    }

    public void setPrice(BigDecimal price)
    {
        this.price = price;
    }

    public BigDecimal getPrice()
    {
        return price;
    }

    public void setSpec(String spec)
    {
        this.spec = spec;
    }

    public String getSpec()
    {
        return spec;
    }

    public void setUnit(String unit)
    {
        this.unit = unit;
    }

    public String getUnit()
    {
        return unit;
    }

    public void setTaxRate(BigDecimal taxRate)
    {
        this.taxRate = taxRate;
    }

    public BigDecimal getTaxRate()
    {
        return taxRate;
    }

    public void setVendorId(String vendorId)
    {
        this.vendorId = vendorId;
    }

    public String getVendorId()
    {
        return vendorId;
    }

    public void setManageOrg(String manageOrg)
    {
        this.manageOrg = manageOrg;
    }

    public String getManageOrg()
    {
        return manageOrg;
    }

    public void setManagePerson(String managePerson)
    {
        this.managePerson = managePerson;
    }

    public String getManagePerson()
    {
        return managePerson;
    }

    public void setManagePhone(String managePhone)
    {
        this.managePhone = managePhone;
    }

    public String getManagePhone()
    {
        return managePhone;
    }

    public void setVersion(String version)
    {
        this.version = version;
    }

    public String getVersion()
    {
        return version;
    }

    public void setFsipUrl(String fsipUrl)
    {
        this.fsipUrl = fsipUrl;
    }

    public String getFsipUrl()
    {
        return fsipUrl;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("oid", getOid())
                .append("templateId", getTemplateId())
                .append("templateName", getTemplateName())
                .append("templateCode", getTemplateCode())
                .append("templateType", getTemplateType())
                .append("category", getCategory())
                .append("price", getPrice())
                .append("spec", getSpec())
                .append("unit", getUnit())
                .append("taxRate", getTaxRate())
                .append("vendorId", getVendorId())
                .append("manageOrg", getManageOrg())
                .append("managePerson", getManagePerson())
                .append("managePhone", getManagePhone())
                .append("version", getVersion())
                .append("fsipUrl", getFsipUrl())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .append("status", getStatus())
                .toString();
    }
}
