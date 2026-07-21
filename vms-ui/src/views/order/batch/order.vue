<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" label-width="80px">
      <el-form-item label="批次号">
        <el-input :value="batchNo" disabled style="width:180px" />
      </el-form-item>
      <el-form-item label="凭证名称" prop="voucherName">
        <el-input v-model="queryParams.voucherName" placeholder="请输入凭证名称" clearable />
      </el-form-item>
      <el-form-item label="订单状态" prop="orderStatus">
        <el-select v-model="queryParams.orderStatus" placeholder="订单状态" clearable>
          <el-option label="待发货" value="待发货" />
          <el-option label="已完成" value="已完成" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        <el-button icon="el-icon-back" size="mini" @click="goBack">返回</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="orderList">
      <el-table-column label="凭证名称" align="center" prop="voucherName" width="150" />
      <el-table-column label="厂商名称" align="center" prop="vendorName" width="150" />
      <el-table-column label="规格" align="center" prop="spec" width="100" />
      <el-table-column label="单价" align="center" prop="price" width="100" />
      <el-table-column label="数量" align="center" prop="quantity" width="80" />
      <el-table-column label="金额" align="center" prop="amount" width="120" />
      <el-table-column label="申领状态" align="center" prop="claimStatus" width="100" />
      <el-table-column label="快递单号" align="center" prop="expressNo" width="150" />
      <el-table-column label="订单状态" align="center" prop="orderStatus" width="100">
        <template slot-scope="scope">
          <el-tag :type="scope.row.orderStatus=='已完成'?'success':'warning'">{{ scope.row.orderStatus || '待发货' }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="160" />
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />
  </div>
</template>

<script>
import { listOrder } from "@/api/order/batch"

export default {
  name: "BatchOrder",
  data() {
    return {
      loading: true,
      total: 0,
      orderList: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        batchNo: this.$route.query.batchNo,
        voucherName: null,
        orderStatus: null
      }
    }
  },
  computed: {
    batchNo() {
      return this.$route.query.batchNo || ''
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.loading = true
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    goBack() {
      this.$router.push('/order/batch')
    }
  }
}
</script>
