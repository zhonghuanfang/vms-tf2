<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" label-width="80px">
      <el-form-item label="批次号">
        <el-input :value="batchNo" disabled style="width:180px" />
      </el-form-item>
      <el-form-item label="凭证类别" prop="category">
        <el-input v-model="queryParams.category" placeholder="请输入凭证类别" clearable />
      </el-form-item>
      <el-form-item label="状态" prop="detailStatus">
        <el-select v-model="queryParams.detailStatus" placeholder="明细状态" clearable>
          <el-option
            v-for="dict in dict.type.batch_detail_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        <el-button icon="el-icon-back" size="mini" @click="goBack">返回</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['order:detail:add']" v-if="showOperateBtn()">新增明细</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['order:detail:remove']">删除</el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="detailList" @selection-change="handleSelectionChange">
     <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="凭证模版" align="center" width="150">
        <template slot-scope="scope">
          {{ getTemplateName(scope.row.templateOid) }}
        </template>
      </el-table-column>
     <el-table-column label="规格" align="center" prop="spec" width="100" />
      <el-table-column label="单价" align="center" prop="price" width="100" />
      <el-table-column label="订购数量" align="center" prop="quantity" width="100" />
      <el-table-column label="总价" align="center" prop="totalAmount" width="120" />
      <el-table-column label="明细状态" align="center" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.batch_detail_status" :value="scope.row.detailStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">
        <template slot-scope="scope">
         <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['order:detail:edit']" v-if="showOperateBtn()">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-close" @click="handleReject(scope.row)" v-hasPermi="['order:detail:reject']" v-if="showOperateBtn()">退回</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['order:detail:remove']" v-if="showOperateBtn()">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />

    <!-- 新增/修改明细对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="凭证模版" prop="templateOid">
              <el-select v-model="form.templateOid" placeholder="请选择凭证模版" filterable @change="onTemplateChange">
                <el-option v-for="item in templateList" :key="item.oid" :label="item.templateName" :value="item.oid" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="订购数量" prop="quantity">
              <el-input-number v-model="form.quantity" :min="1" style="width:100%" @change="calcTotal" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="规格">
              <el-input v-model="form.spec" disabled />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="单价">
              <el-input v-model="form.price" disabled />
            </el-form-item>
          </el-col>
          <el-col :span="12">
           <el-form-item label="总价">
             <el-input v-model="form.totalAmount" disabled />
           </el-form-item>
         </el-col>
         <el-col :span="12">
           <el-form-item label="支行号" prop="subbranchOrgId">
             <el-input v-model="form.subbranchOrgId" placeholder="请输入支行号" />
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
import { listDetail, getDetail, addDetail, updateDetail, delDetail, rejectDetail, getOrgStatusInfo } from "@/api/order/batch"
import { getInfo } from "@/api/login"
import { listTemplate } from "@/api/system/template"

export default {
  name: "BatchDetail",
  dicts: ['batch_detail_status'],
  data() {
    return {
      loading: true,
      total: 0,
      detailList: [],
      templateList: [],
      ids: [],
      single: true,
      multiple: true,
      title: "",
      open: false,
      orgVersion: null,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        batchNo: this.$route.query.batchNo,
        branchOrgId: this.$route.query.branchOrgId || undefined,
        category: null,
        detailStatus: null
      },
      form: {},
      rules: {
        templateOid: [
          { required: true, message: "请选择凭证模版", trigger: "change" }
        ],
       quantity: [
         { required: true, message: "订购数量不能为空", trigger: "blur" }
        ],
        subbranchOrgId: [
          { required: true, message: "支行号不能为空", trigger: "blur" }
       ]
     }
    }
  },
  computed: {
    batchNo() {
      return this.$route.query.batchNo || ''
    },
    batchStatus() {
      return this.$route.query.status || ''
    }
  },
  created() {
    this.getList()
    this.loadTemplates()
    this.loadOrgStatusInfo()
  },
  methods: {
    getList() {
      this.loading = true
      listDetail(this.queryParams).then(response => {
        this.detailList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    loadOrgStatusInfo() {
      getOrgStatusInfo(this.batchNo).then(response => {
        if (response.data) {
          this.orgVersion = response.data.version
        }
      })
    },
    loadTemplates() {
      listTemplate({ pageSize: 999 }).then(response => {
        this.templateList = response.rows || []
      })
    },
    onTemplateChange(oid) {
      const tpl = this.templateList.find(t => t.oid === oid)
      if (tpl) {
        this.form.spec = tpl.spec
        this.form.price = tpl.price
        this.calcTotal()
      }
    },
    calcTotal() {
      if (this.form.price && this.form.quantity) {
        this.form.totalAmount = (parseFloat(this.form.price) * parseInt(this.form.quantity)).toFixed(2)
      }
    },
    cancel() {
      this.open = false
      this.reset()
    },
    reset() {
      this.form = {
        oid: null,
        batchNo: this.batchNo,
        templateOid: null,
        quantity: null,
        spec: null,
        price: null,
        totalAmount: null,
        subbranchOrgId: null,
        detailStatus: '00'
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
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.oid)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    handleAdd() {
      debugger
      // 自动填充当前登录人机构代码
      getInfo().then(res => {
        const dept = res.user.dept
        if (dept && dept.deptCode) {
          this.form.subbranchOrgId = dept.deptCode
        }
      })
      this.reset()
      this.open = true
      this.title = "新增明细"
    },
    handleUpdate(row) {
      this.reset()
      getDetail(row.oid).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改明细"
      })
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 携带机构状态版本号
          const data = { ...this.form, orgVersion: this.orgVersion }
          if (this.form.oid != null) {
            updateDetail(data).then(() => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
              this.loadOrgStatusInfo()
            })
          } else {
            addDetail(data).then(() => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
              this.loadOrgStatusInfo()
            })
          }
        }
      })
    },
    handleDelete(row) {
      const oids = row.oid || this.ids
      this.$modal.confirm('确认删除所选明细？').then(() => delDetail(oids, this.orgVersion))
        .then(() => { this.getList(); this.loadOrgStatusInfo(); this.$modal.msgSuccess("删除成功") })
        .catch(() => {})
    },
   showOperateBtn() {
      const bs = this.batchStatus
      // return (bs === '10' || bs === '13') && row.detailStatus === '00'
      return bs === '10' || bs === '13'
    },
    handleReject(row) {
      this.$modal.confirm('确认退回该明细？').then(() => {
        return rejectDetail({ oid: row.oid, orgVersion: this.orgVersion })
      }).then(() => {
        this.$modal.msgSuccess("退回成功")
        this.getList()
        this.loadOrgStatusInfo()
      }).catch(() => {})
    },
   goBack() {
     this.$router.push('/order/batch')
    },
    getTemplateName(templateOid) {
      if (!templateOid) return ''
      const tpl = this.templateList.find(t => t.oid === templateOid)
      return tpl ? tpl.templateName : templateOid
    }
  }
}
</script>
