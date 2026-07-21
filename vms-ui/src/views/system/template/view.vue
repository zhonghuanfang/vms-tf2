<template>
  <el-drawer title="凭证模版详情" :visible.sync="visible" direction="rtl" size="60%" append-to-body :before-close="handleClose" custom-class="detail-drawer">
    <div v-loading="loading" class="drawer-content">
      <h4 class="section-header">基本信息</h4>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">模版ID：</label>
            <span class="info-value plaintext">
              {{ info.templateId }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">模版名称：</label>
            <span class="info-value plaintext">
              {{ info.templateName }}
            </span>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">模版编号：</label>
            <span class="info-value plaintext">
              {{ info.templateCode }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">模版类型：</label>
            <span class="info-value plaintext">
              {{ info.templateType }}
            </span>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">凭证类别: 一般/重空：</label>
            <span class="info-value plaintext">
              {{ info.category }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">单价：</label>
            <span class="info-value plaintext">
              {{ info.price }}
            </span>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">规格：</label>
            <span class="info-value plaintext">
              {{ info.spec }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">单位：</label>
            <span class="info-value plaintext">
              {{ info.unit }}
            </span>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">税率%：</label>
            <span class="info-value plaintext">
              {{ info.taxRate }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">厂商ID：</label>
            <span class="info-value plaintext">
              {{ info.vendorId }}
            </span>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">管理机构：</label>
            <span class="info-value plaintext">
              {{ info.manageOrg }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">管理人：</label>
            <span class="info-value plaintext">
              {{ info.managePerson }}
            </span>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">管理人联系方式：</label>
            <span class="info-value plaintext">
              {{ info.managePhone }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">版本：</label>
            <span class="info-value plaintext">
              {{ info.version }}
            </span>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">模版fsip地址：</label>
            <span class="info-value plaintext">
              {{ info.fsipUrl }}
            </span>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">备注：</label>
            <span class="info-value plaintext">
              {{ info.remark }}
            </span>
          </div>
        </el-col>
      </el-row>
      <el-row :gutter="20" class="mb8">
        <el-col :span="12">
          <div class="info-item">
            <label class="info-label">状态：</label>
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
import { getTemplate } from '@/api/system/template'

export default {
  name: 'TemplateViewDrawer',
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
      getTemplate(oid).then(res => {
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
