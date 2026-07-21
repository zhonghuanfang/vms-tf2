<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" label-width="80px">
      <el-form-item label="批次号">
        <el-input :value="batchNo" disabled style="width:180px" />
      </el-form-item>
      <el-form-item label="凭证类别" prop="category">
        <el-input v-model="queryParams.category" placeholder="请输入凭证类别" clearable />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        <el-button icon="el-icon-back" size="mini" @click="goBack">返回</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="summaryList">
      <el-table-column label="凭证类别" align="center" prop="category" width="100" />
      <el-table-column label="凭证名称" align="center" prop="templateName" width="150" />
      <el-table-column label="凭证代码" align="center" prop="templateCode" width="120" />
      <el-table-column label="印制厂商" align="center" prop="vendorName" width="150" />
      <el-table-column label="规格" align="center" prop="spec" width="100" />
      <el-table-column label="单价" align="center" prop="price" width="100" />
      <el-table-column label="汇总数量" align="center" prop="totalQuantity" width="100" />
      <el-table-column label="总价" align="center" prop="totalAmount" width="120" />
      <el-table-column label="状态" align="center" width="160">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.batch_branch_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="120">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-s-grid" @click="handleBranchDetail(scope.row)">支行明细</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { batchSummary } from "@/api/order/batch"
import { getInfo } from "@/api/login"

export default {
  name: "BatchSummary",
  dicts: ['batch_branch_status'],
  data() {
    return {
      loading: true,
      summaryList: [],
      queryParams: {
        batchNo: this.$route.query.batchNo,
        branchOrgId: this.$route.query.branchOrgId || undefined,
        status: this.$route.query.status || undefined,
        category: null
      }
    }
  },
  computed: {
    batchNo() {
      return this.$route.query.batchNo || ''
    }
  },
  created() {
    // 如未传入branchOrgId，根据当前用户机构等级自动填充
    if (!this.queryParams.branchOrgId) {
      getInfo().then(res => {
        const dept = res.user.dept
        if (dept && dept.deptLevel === '2') {
          this.queryParams.branchOrgId = dept.deptCode
        }
        console.log(this.queryParams.branchOrgId);
        
        this.getList()
      })
    } else {
      this.getList()
    }
  },
  methods: {
    getList() {
      this.loading = true
      batchSummary(this.queryParams).then(response => {
        // 前端过滤凭证类别
        let list = response.data || []
        if (this.queryParams.category) {
          list = list.filter(item => item.category && item.category.includes(this.queryParams.category))
        }
        this.summaryList = list
        this.loading = false
      })
    },
    handleQuery() {
      this.getList()
    },
    resetQuery() {
      this.queryParams.category = null
      this.getList()
    },
    handleBranchDetail(row) {
      this.$router.push({
        path: '/order/batch/detail/' + row.oid,
        query: { batchNo: this.batchNo, category: row.category, branchOrgId: row.branchOrgId }
      })
    },
    goBack() {
      this.$router.push('/order/batch')
    }
  }
}
</script>
