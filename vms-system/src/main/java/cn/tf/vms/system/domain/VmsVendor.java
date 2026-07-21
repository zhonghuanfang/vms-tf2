package cn.tf.vms.system.domain;

import cn.tf.vms.common.annotation.Excel;
import cn.tf.vms.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 厂商管理对象 vms_vendor
 *
 * @author zhonghuanfang
 * @date 2026-07-21
 */
public class VmsVendor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long oid;

    /** 厂商ID */
    @Excel(name = "厂商ID")
    private String vendorId;

    /** 厂商名称 */
    @Excel(name = "厂商名称")
    private String vendorName;

    /** 厂商地址 */
    @Excel(name = "厂商地址")
    private String vendorAddress;

    /** 联系人姓名 */
    @Excel(name = "联系人姓名")
    private String contactName;

    /** 联系人电话 */
    @Excel(name = "联系人电话")
    private String contactPhone;

    /** 联系人身份证号 */
    @Excel(name = "联系人身份证号")
    private String contactIdCard;

    /** 收款账号 */
    @Excel(name = "收款账号")
    private String bankAccount;

    /** 开户行 */
    @Excel(name = "开户行")
    private String bankName;

    /** 厂商状态（0正常 1停用） */
    @Excel(name = "厂商状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setOid(Long oid)
    {
        this.oid = oid;
    }

    public Long getOid()
    {
        return oid;
    }

    public void setVendorId(String vendorId)
    {
        this.vendorId = vendorId;
    }

    public String getVendorId()
    {
        return vendorId;
    }

    public void setVendorName(String vendorName)
    {
        this.vendorName = vendorName;
    }

    public String getVendorName()
    {
        return vendorName;
    }

    public void setVendorAddress(String vendorAddress)
    {
        this.vendorAddress = vendorAddress;
    }

    public String getVendorAddress()
    {
        return vendorAddress;
    }

    public void setContactName(String contactName)
    {
        this.contactName = contactName;
    }

    public String getContactName()
    {
        return contactName;
    }

    public void setContactPhone(String contactPhone)
    {
        this.contactPhone = contactPhone;
    }

    public String getContactPhone()
    {
        return contactPhone;
    }

    public void setContactIdCard(String contactIdCard)
    {
        this.contactIdCard = contactIdCard;
    }

    public String getContactIdCard()
    {
        return contactIdCard;
    }

    public void setBankAccount(String bankAccount)
    {
        this.bankAccount = bankAccount;
    }

    public String getBankAccount()
    {
        return bankAccount;
    }

    public void setBankName(String bankName)
    {
        this.bankName = bankName;
    }

    public String getBankName()
    {
        return bankName;
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
                .append("vendorId", getVendorId())
                .append("vendorName", getVendorName())
                .append("vendorAddress", getVendorAddress())
                .append("contactName", getContactName())
                .append("contactPhone", getContactPhone())
                .append("contactIdCard", getContactIdCard())
                .append("bankAccount", getBankAccount())
                .append("bankName", getBankName())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .append("status", getStatus())
                .toString();
    }
}
