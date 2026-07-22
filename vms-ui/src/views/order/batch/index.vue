<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="80px">
      <el-form-item label="批次号" prop="batchNo">
        <el-input
          v-model="queryParams.batchNo"
          placeholder="请输入批次号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="批次名称" prop="batchName">
        <el-input
          v-model="queryParams.batchName"
          placeholder="请输入批次名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="批次状态" clearable>
          <el-option
            v-for="dict in statusDictOptions"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['order:batch:add']"
        >新增批次</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="batchList" @row-click="handleRowClick">
      <el-table-column label="批次号" align="center" prop="batchNo" width="160" />
      <el-table-column label="批次名称" align="center" prop="batchName" width="200" />
      <el-table-column label="开始时间" align="center" prop="startTime" width="160" />
      <el-table-column label="结束时间" align="center" prop="endTime" width="160" />
      <el-table-column label="批次说明" align="center" prop="batchDesc" />
      <el-table-column label="状态" align="center" width="160">
        <template slot-scope="scope">
          <dict-tag :options="statusDictOptions" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="380">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-s-order" @click.stop="handleOrderSummary(scope.row)" v-hasPermi="['order:batch:query']" v-if="isBranchOrSubbranch">订购明细</el-button>
          <el-button size="mini" type="text" icon="el-icon-s-data" @click.stop="handleSummary(scope.row)" v-hasPermi="['order:batch:list']" v-if="isHeadOrBranch">凭证类型汇总</el-button>
          <!-- 总行操作按钮 -->
          <template v-if="isHead">
            <el-button size="mini" type="text" icon="el-icon-edit" @click.stop="handleUpdate(scope.row)" v-hasPermi="['order:batch:edit']" v-if="scope.row.status=='20'||scope.row.status=='23'">修改</el-button>
            <el-button size="mini" type="text" icon="el-icon-lock" @click.stop="handleLock(scope.row)" v-hasPermi="['order:batch:lock']" v-if="scope.row.status=='20'||scope.row.status=='23'">锁定</el-button>
            <el-button size="mini" type="text" icon="el-icon-unlock" @click.stop="handleUnlock(scope.row)" v-hasPermi="['order:batch:unlock']" v-if="scope.row.status=='21'">解锁</el-button>
            <el-button size="mini" type="text" icon="el-icon-upload" @click.stop="handleSubmitReview(scope.row)" v-hasPermi="['order:batch:submit']" v-if="scope.row.status=='21'">提交审核</el-button>
            <el-button size="mini" type="text" icon="el-icon-circle-check" @click.stop="handleApprove(scope.row)" v-hasPermi="['order:batch:approve']" v-if="scope.row.status=='22'">审核</el-button>
            <el-button size="mini" type="text" icon="el-icon-document" @click.stop="handleOrderList(scope.row)" v-hasPermi="['order:order:list']" v-if="scope.row.status=='100'">订单明细</el-button>
          </template>
          <!-- 分行操作按钮 -->
          <template v-if="isBranch">
            <el-button size="mini" type="text" icon="el-icon-lock" @click.stop="handleBranchLock(scope.row)" v-hasPermi="['order:batch:lock']" v-if="scope.row.status=='10'||scope.row.status=='13'">锁定</el-button>
            <el-button size="mini" type="text" icon="el-icon-unlock" @click.stop="handleBranchUnlock(scope.row)" v-hasPermi="['order:batch:unlock']" v-if="scope.row.status=='11'">解锁</el-button>
            <el-button size="mini" type="text" icon="el-icon-upload" @click.stop="handleBranchSubmitReview(scope.row)" v-hasPermi="['order:batch:submit']" v-if="scope.row.status=='11'">提交申请</el-button>
          </template>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改批次对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="批次号" prop="batchNo">
              <el-input v-model="form.batchNo" placeholder="请输入批次号" :disabled="form.oid!=null" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="批次名称" prop="batchName">
              <el-input v-model="form.batchName" placeholder="请输入批次名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="开始时间" prop="startTime">
              <el-date-picker v-model="form.startTime" type="datetime" placeholder="选择开始时间" value-format="yyyy-MM-dd HH:mm:ss" style="width:100%" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="结束时间" prop="endTime">
              <el-date-picker v-model="form.endTime" type="datetime" placeholder="选择结束时间" value-format="yyyy-MM-dd HH:mm:ss" style="width:100%" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="批次说明" prop="batchDesc">
              <el-input v-model="form.batchDesc" type="textarea" placeholder="请输入批次说明" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listBatch, getBatch, addBatch, updateBatch, delBatch, lockBatch, unlockBatch, submitReviewBatch, approveBatch, rejectBatch, branchLockBatch, branchUnlockBatch, branchSubmitReviewBatch } from "@/api/order/batch"

export default {
  name: "Batch",
  dicts: ['batch_status', 'batch_branch_status', 'sys_normal_disable', 'sys_dept_level'],
  data() {
    return {
      loading: true,
      showSearch: true,
      total: 0,
      batchList: [],
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        batchNo: null,
        batchName: null,
        status: null
      },
      form: {},
      rules: {
        batchNo: [
          { required: true, message: "批次号不能为空", trigger: "blur" }
        ],
        batchName: [
          { required: true, message: "批次名称不能为空", trigger: "blur" }
        ]
      }
    }
  },
  created() {
    this.getList()
  },
  computed: {
    isHeadOrBranch() {
      return this.$store.state.user.deptLevel === '1' || this.$store.state.user.deptLevel === '2'
    },
    isHead() {
      return this.$store.state.user.deptLevel === '1'
    },
    isBranch() {
      return this.$store.state.user.deptLevel === '2'
    },
    isBranchOrSubbranch() {
      return this.$store.state.user.deptLevel === '2' || this.$store.state.user.deptLevel === '4'
    },
    statusDictOptions() {
      const level = this.$store.state.user.deptLevel
      if (level === '2' || level === '4') {
        return this.dict.type.batch_branch_status || []
      }
      return this.dict.type.batch_status || []
    }
  },
  methods: {
    getList() {
      this.loading = true
      listBatch(this.queryParams).then(response => {
        this.batchList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    cancel() {
      this.open = false
      this.reset()
    },
    reset() {
      this.form = {
        oid: null,
        batchNo: null,
        batchName: null,
        startTime: null,
        endTime: null,
        batchDesc: null,
        status: null
      }
      this.resetForm("form")
    },
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "新增批次"
    },
    handleUpdate(row) {
      this.reset()
      getBatch(row.oid).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改批次"
      })
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.oid != null) {
            updateBatch(this.form).then(() => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addBatch(this.form).then(() => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    handleRowClick(row) {},

    // 锁定
    handleLock(row) {
      this.$modal.confirm('确认锁定批次 "' + row.batchName + '"？').then(() => {
        return lockBatch({ oid: row.oid })
      }).then(() => {
        this.$modal.msgSuccess("锁定成功")
        this.getList()
      }).catch(() => {})
    },
    // 解锁
    handleUnlock(row) {
      this.$modal.confirm('确认解锁批次 "' + row.batchName + '"？').then(() => {
        return unlockBatch({ oid: row.oid })
      }).then(() => {
        this.$modal.msgSuccess("解锁成功")
        this.getList()
      }).catch(() => {})
    },
    // 提交审核
    handleSubmitReview(row) {
      this.$modal.confirm('确认提交审核批次 "' + row.batchName + '"？').then(() => {
        return submitReviewBatch({ oid: row.oid })
      }).then(() => {
        this.$modal.msgSuccess("提交成功")
        this.getList()
      }).catch(() => {})
    },
    // 审核
    handleApprove(row) {
      this.$prompt('请输入审核意见', '审核', { confirmButtonText: '通过', cancelButtonText: '驳回', inputType: 'textarea' }).then(({ value }) => {
        approveBatch({ oid: row.oid, statusRemark: value }).then(() => {
          this.$modal.msgSuccess("审核通过")
          this.getList()
        })
      }).catch(() => {
        // 点击驳回
        this.$prompt('请输入驳回原因', '驳回', { confirmButtonText: '确定', cancelButtonText: '取消', inputType: 'textarea' }).then(({ value }) => {
          rejectBatch({ oid: row.oid, statusRemark: value }).then(() => {
            this.$modal.msgSuccess("已驳回")
            this.getList()
          })
        }).catch(() => {})
      })
    },
    // 订购明细
    handleOrderSummary(row) {
      this.$router.push({ path: '/order/batch/detail/' + row.oid, query: { batchNo: row.batchNo, status: row.status } })
    },
    handleSummary(row) {
      this.$router.push({ path: '/order/batch/summary', query: { batchNo: row.batchNo, status: row.status } })
    },
    // 订单明细
    handleOrderList(row) {
      this.$router.push({ path: '/order/batch/order/' + row.oid, query: { batchNo: row.batchNo } })
    },
    // 分行锁定
    handleBranchLock(row) {
      this.$modal.confirm('确认锁定批次 "' + row.batchName + '"？').then(() => {
        return branchLockBatch({ batchNo: row.batchNo, version: row.version })
      }).then(() => {
        this.$modal.msgSuccess("锁定成功")
        this.getList()
      }).catch(() => {})
    },
    // 分行解锁
    handleBranchUnlock(row) {
      this.$modal.confirm('确认解锁批次 "' + row.batchName + '"？').then(() => {
        return branchUnlockBatch({ batchNo: row.batchNo, version: row.version })
      }).then(() => {
        this.$modal.msgSuccess("解锁成功")
        this.getList()
      }).catch(() => {})
    },
    // 分行提交申请
    handleBranchSubmitReview(row) {
      this.$modal.confirm('确认提交审核批次 "' + row.batchName + '"？').then(() => {
        return branchSubmitReviewBatch({ batchNo: row.batchNo, version: row.version })
      }).then(() => {
        this.$modal.msgSuccess("提交成功")
        this.getList()
      }).catch(() => {})
    }
  }
}
</script>
