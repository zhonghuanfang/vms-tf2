<template>
  <el-drawer title="厂商管理详情" :visible.sync="visible" direction="rtl" size="60%" append-to-body :before-close="handleClose" custom-class="detail-drawer">
    <div v-loading="loading" class="drawer-content">
      <h4 class="section-header">基本信息</h4>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">厂商ID：</label>
            <span class="info-value plaintext">
              {{ info.vendorId }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">厂商名称：</label>
            <span class="info-value plaintext">
              {{ info.vendorName }}
            </span>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">厂商地址：</label>
            <span class="info-value plaintext">
              {{ info.vendorAddress }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">联系人姓名：</label>
            <span class="info-value plaintext">
              {{ info.contactName }}
            </span>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">联系人电话：</label>
            <span class="info-value plaintext">
              {{ info.contactPhone }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">联系人身份证号：</label>
            <span class="info-value plaintext">
              {{ info.contactIdCard }}
            </span>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">收款账号：</label>
            <span class="info-value plaintext">
              {{ info.bankAccount }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">开户行：</label>
            <span class="info-value plaintext">
              {{ info.bankName }}
            </span>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">备注：</label>
            <span class="info-value plaintext">
              {{ info.remark }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">厂商状态：</label>
            <span class="info-value plaintext">
              {{ info.status }}
            </span>
          </div>
        </el-col>
      </el-row>
    </div>
  </el-drawer>
</template>

<script>
import { getVendor } from '@/api/system/vendor'

export default {
  name: 'VendorViewDrawer',
  data() {
    return {
      visible: false,
      loading: false,
      info: {}
    }
  },
  methods: {
    open(oid) {
      this.visible = true
      this.loading = true
      getVendor(oid).then(res => {
        this.info = res.data || {}
      }).finally(() => {
        this.loading = false
      })
    },
    handleClose() {
      this.visible = false
    }
  }
}
</script>
