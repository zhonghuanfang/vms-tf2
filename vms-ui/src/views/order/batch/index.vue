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

    <el-table v-loading="loading" :data="batchList" :key="tableKey" @row-click="handleRowClick">
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
          <template v-if="isHeadManager">
            <el-button size="mini" type="text" icon="el-icon-edit" @click.stop="handleUpdate(scope.row)" v-hasPermi="['order:batch:edit']" v-if="scope.row.status=='20'||scope.row.status=='23'">修改</el-button>
            <el-button size="mini" type="text" icon="el-icon-lock" @click.stop="handleLock(scope.row)" v-hasPermi="['order:batch:lock']" v-if="scope.row.status=='20'||scope.row.status=='23'">锁定</el-button>
            <el-button size="mini" type="text" icon="el-icon-unlock" @click.stop="handleUnlock(scope.row)" v-hasPermi="['order:batch:unlock']" v-if="scope.row.status=='21'">解锁</el-button>
            <el-button size="mini" type="text" icon="el-icon-upload" @click.stop="handleSubmitReview(scope.row)" v-hasPermi="['order:batch:submit']" v-if="scope.row.status=='21'">提交审核</el-button>
          </template>
          <template v-if="isHeadReviewer">
            <el-button size="mini" type="text" icon="el-icon-circle-check" @click.stop="handleApprove(scope.row)" v-hasPermi="['order:batch:approve']" v-if="scope.row.status=='22'">审核</el-button>
          </template>
          <!-- 总行管理员和复核员共用按钮 -->
          <template v-if="isHead">
            <el-button size="mini" type="text" icon="el-icon-document" @click.stop="handleOrderList(scope.row)" v-if="scope.row.status=='100'">订单明细</el-button>
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

    <!-- 提交审核弹窗 -->
    <el-dialog title="填写号段并提交审核" :visible.sync="submitReviewOpen" width="1100px" append-to-body>
      <el-table v-loading="submitReviewLoading" :data="submitReviewList" border>
        <el-table-column label="凭证类别" align="center" prop="category" width="100" />
        <el-table-column label="凭证名称" align="center" prop="templateName" width="150" />
        <el-table-column label="凭证代码" align="center" prop="templateCode" width="120" />
        <el-table-column label="印制厂商" align="center" prop="vendorName" width="150" />
        <el-table-column label="规格" align="center" prop="spec" width="80" />
        <el-table-column label="单价" align="center" prop="price" width="80" />
        <el-table-column label="汇总数量" align="center" prop="totalQuantity" width="100" />
        <el-table-column label="总价" align="center" prop="totalAmount" width="100" />
        <el-table-column label="开始号段" align="center" width="160">
          <template slot-scope="scope">
            <el-input v-model="scope.row.printStartNo" size="small" placeholder="请输入开始号段" />
          </template>
        </el-table-column>
        <el-table-column label="结束号段" align="center" width="160">
          <template slot-scope="scope">
            <el-input v-model="scope.row.printEndNo" size="small" placeholder="请输入结束号段" />
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="confirmSubmitReview">确 认</el-button>
        <el-button @click="submitReviewOpen = false">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 审核弹窗 -->
    <el-dialog title="批次审核" :visible.sync="reviewOpen" width="1100px" append-to-body>
      <el-table v-loading="reviewLoading" :data="reviewList" border>
        <el-table-column label="凭证类别" align="center" prop="category" width="100" />
        <el-table-column label="凭证名称" align="center" prop="templateName" width="150" />
        <el-table-column label="凭证代码" align="center" prop="templateCode" width="120" />
        <el-table-column label="印制厂商" align="center" prop="vendorName" width="150" />
        <el-table-column label="规格" align="center" prop="spec" width="80" />
        <el-table-column label="单价" align="center" prop="price" width="80" />
        <el-table-column label="数量" align="center" prop="quantity" width="100" />
        <el-table-column label="总价" align="center" prop="totalAmount" width="100" />
        <el-table-column label="印制号段" align="center">
          <template slot-scope="scope">
            {{ scope.row.printStartNo }} - {{ scope.row.printEndNo }}
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button type="success" @click="handleApproveConfirm">通过</el-button>
        <el-button type="danger" @click="handleRejectConfirm">驳回</el-button>
        <el-button @click="reviewOpen = false">取消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listBatch, getBatch, addBatch, updateBatch, delBatch, lockBatch, unlockBatch, submitReviewWithSegments, approveBatch, rejectBatch, getReviewSegments, branchLockBatch, branchUnlockBatch, branchSubmitReviewBatch, batchSummary, suggestStartNos } from "@/api/order/batch"

export default {
  name: "Batch",
  dicts: ['batch_status', 'batch_branch_status', 'sys_normal_disable', 'sys_dept_level'],
  data() {
    return {
      loading: true,
      showSearch: true,
      total: 0,
      tableKey: 0,
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
      },
      submitReviewOpen: false,
      submitReviewLoading: false,
      submitReviewBatch: null,
      submitReviewList: [],
      reviewOpen: false,
      reviewLoading: false,
      reviewBatch: null,
      reviewList: []
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
    isHeadManager() {
      return this.$store.state.user.roles.includes('head_manager')
    },
    isHeadReviewer() {
      return this.$store.state.user.roles.includes('head_reviewer')
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
      this.tableKey++
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
    // 提交审核 - 打开弹窗加载汇总列表
    handleSubmitReview(row) {
      this.submitReviewBatch = row
      this.submitReviewLoading = true
      this.submitReviewOpen = true
      this.submitReviewList = []
      // 并行加载汇总数据和号段建议
      Promise.all([
        batchSummary({ batchNo: row.batchNo, status: row.status }),
        suggestStartNos(row.batchNo)
      ]).then(([summaryRes, suggestRes]) => {
        const list = summaryRes.data || []
        const suggestMap = suggestRes.data || {}
        this.submitReviewList = list.map(item => {
          // 根据 templateOid 获取建议开始号段
          const suggestedStart = suggestMap[String(item.templateOid)] || ''
          return {
            ...item,
            printStartNo: suggestedStart,
            printEndNo: ''
          }
        })
        this.submitReviewLoading = false
      }).catch(() => {
        this.submitReviewLoading = false
      })
    },
    // 确认提交审核
    confirmSubmitReview() {
      // 前端校验：所有号段都填写完毕
      for (let i = 0; i < this.submitReviewList.length; i++) {
        const row = this.submitReviewList[i]
        if (!row.printStartNo || !row.printEndNo) {
          this.$modal.msgError('第' + (i + 1) + '行号段未填写完毕')
          return
        }
        const startNo = Number(row.printStartNo)
        const endNo = Number(row.printEndNo)
        if (isNaN(startNo) || isNaN(endNo)) {
          this.$modal.msgError('第' + (i + 1) + '行号段必须为数字')
          return
        }
        // 号段相减加1等于订购数量
        if (endNo - startNo + 1 !== row.totalQuantity) {
          this.$modal.msgError('第' + (i + 1) + '行号段数量（' + (endNo - startNo + 1) + '）不等于订购数量（' + row.totalQuantity + '）')
          return
        }
      }
      const data = {
        oid: this.submitReviewBatch.oid,
        segments: this.submitReviewList.map(item => ({
          templateOid: item.templateOid,
          vendorOid: item.vendorOid,
          printStartNo: item.printStartNo,
          printEndNo: item.printEndNo,
          totalQuantity: item.totalQuantity,
          spec: item.spec,
          price: item.price,
          totalAmount: item.totalAmount
        }))
      }
      submitReviewWithSegments(data).then(() => {
        this.$modal.msgSuccess('提交成功')
        this.submitReviewOpen = false
        this.getList()
      })
    },
    // 审核 - 打开弹窗加载号段列表
    handleApprove(row) {
      this.reviewBatch = row
      this.reviewLoading = true
      this.reviewOpen = true
      this.reviewList = []
      getReviewSegments(row.batchNo).then(response => {
        this.reviewList = response.data || []
        this.reviewLoading = false
      }).catch(() => {
        this.reviewLoading = false
      })
    },
    // 审核通过
    handleApproveConfirm() {
      this.$prompt('请输入审核意见', '审核通过', { confirmButtonText: '确定', cancelButtonText: '取消', inputType: 'textarea' }).then(({ value }) => {
        approveBatch({ oid: this.reviewBatch.oid, statusRemark: value }).then(() => {
          this.$modal.msgSuccess('审核通过')
          this.reviewOpen = false
          this.getList()
        })
      }).catch(() => {})
    },
    // 审核驳回
    handleRejectConfirm() {
      this.$prompt('请输入驳回原因', '审核驳回', { confirmButtonText: '确定', cancelButtonText: '取消', inputType: 'textarea' }).then(({ value }) => {
        rejectBatch({ oid: this.reviewBatch.oid, statusRemark: value }).then(() => {
          this.$modal.msgSuccess('已驳回')
          this.reviewOpen = false
          this.getList()
        })
      }).catch(() => {})
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
