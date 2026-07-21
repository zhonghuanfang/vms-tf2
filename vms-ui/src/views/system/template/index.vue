<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="模版ID" prop="templateId">
        <el-input
          v-model="queryParams.templateId"
          placeholder="请输入模版ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模版名称" prop="templateName">
        <el-input
          v-model="queryParams.templateName"
          placeholder="请输入模版名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="模版编号" prop="templateCode">
        <el-input
          v-model="queryParams.templateCode"
          placeholder="请输入模版编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="凭证类别: 一般/重空" prop="category">
        <el-input
          v-model="queryParams.category"
          placeholder="请输入凭证类别: 一般/重空"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单价" prop="price">
        <el-input
          v-model="queryParams.price"
          placeholder="请输入单价"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="规格" prop="spec">
        <el-input
          v-model="queryParams.spec"
          placeholder="请输入规格"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单位" prop="unit">
        <el-input
          v-model="queryParams.unit"
          placeholder="请输入单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="税率%" prop="taxRate">
        <el-input
          v-model="queryParams.taxRate"
          placeholder="请输入税率%"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="厂商ID" prop="vendorId">
        <el-input
          v-model="queryParams.vendorId"
          placeholder="请输入厂商ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="管理机构" prop="manageOrg">
        <el-input
          v-model="queryParams.manageOrg"
          placeholder="请输入管理机构"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="管理人" prop="managePerson">
        <el-input
          v-model="queryParams.managePerson"
          placeholder="请输入管理人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="管理人联系方式" prop="managePhone">
        <el-input
          v-model="queryParams.managePhone"
          placeholder="请输入管理人联系方式"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="版本" prop="version">
        <el-input
          v-model="queryParams.version"
          placeholder="请输入版本"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['system:template:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:template:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:template:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:template:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="templateList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="oid" align="center" prop="oid" />
      <el-table-column label="模版ID" align="center" prop="templateId" />
      <el-table-column label="模版名称" align="center" prop="templateName" />
      <el-table-column label="模版编号" align="center" prop="templateCode" />
      <el-table-column label="模版类型" align="center" prop="templateType" />
      <el-table-column label="凭证类别: 一般/重空" align="center" prop="category" />
      <el-table-column label="单价" align="center" prop="price" />
      <el-table-column label="规格" align="center" prop="spec" />
      <el-table-column label="单位" align="center" prop="unit" />
      <el-table-column label="税率%" align="center" prop="taxRate" />
      <el-table-column label="厂商ID" align="center" prop="vendorId" />
      <el-table-column label="管理机构" align="center" prop="manageOrg" />
      <el-table-column label="管理人" align="center" prop="managePerson" />
      <el-table-column label="管理人联系方式" align="center" prop="managePhone" />
      <el-table-column label="版本" align="center" prop="version" />
      <el-table-column label="模版fsip地址" align="center" prop="fsipUrl" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleViewData(scope.row)"
            v-hasPermi="['system:template:query']"
          >详情</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:template:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:template:remove']"
          >删除</el-button>
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

    <!-- 凭证模版详情抽屉 -->
    <template-view-drawer ref="templateViewRef" />
    <!-- 添加或修改凭证模版对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="模版ID" prop="templateId">
              <el-input v-model="form.templateId" placeholder="请输入模版ID" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="模版名称" prop="templateName">
              <el-input v-model="form.templateName" placeholder="请输入模版名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="模版编号" prop="templateCode">
              <el-input v-model="form.templateCode" placeholder="请输入模版编号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="凭证类别: 一般/重空" prop="category">
              <el-input v-model="form.category" placeholder="请输入凭证类别: 一般/重空" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="单价" prop="price">
              <el-input v-model="form.price" placeholder="请输入单价" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="规格" prop="spec">
              <el-input v-model="form.spec" placeholder="请输入规格" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="单位" prop="unit">
              <el-input v-model="form.unit" placeholder="请输入单位" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="税率%" prop="taxRate">
              <el-input v-model="form.taxRate" placeholder="请输入税率%" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="厂商ID" prop="vendorId">
              <el-input v-model="form.vendorId" placeholder="请输入厂商ID" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="管理机构" prop="manageOrg">
              <el-input v-model="form.manageOrg" placeholder="请输入管理机构" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="管理人" prop="managePerson">
              <el-input v-model="form.managePerson" placeholder="请输入管理人" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="管理人联系方式" prop="managePhone">
              <el-input v-model="form.managePhone" placeholder="请输入管理人联系方式" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="版本" prop="version">
              <el-input v-model="form.version" placeholder="请输入版本" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="模版fsip地址" prop="fsipUrl">
              <el-input v-model="form.fsipUrl" type="textarea" placeholder="请输入内容" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
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
import { listTemplate, getTemplate, delTemplate, addTemplate, updateTemplate } from "@/api/system/template"
import TemplateViewDrawer from "./view"

export default {
  name: "Template",
  components: { TemplateViewDrawer },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 凭证模版表格数据
      templateList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        templateId: null,
        templateName: null,
        templateCode: null,
        templateType: null,
        category: null,
        price: null,
        spec: null,
        unit: null,
        taxRate: null,
        vendorId: null,
        manageOrg: null,
        managePerson: null,
        managePhone: null,
        version: null,
        fsipUrl: null,
        status: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        templateId: [
          { required: true, message: "模版ID不能为空", trigger: "blur" }
        ],
        templateName: [
          { required: true, message: "模版名称不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询凭证模版列表 */
    getList() {
      this.loading = true
      listTemplate(this.queryParams).then(response => {
        this.templateList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        oid: null,
        templateId: null,
        templateName: null,
        templateCode: null,
        templateType: null,
        category: null,
        price: null,
        spec: null,
        unit: null,
        taxRate: null,
        vendorId: null,
        manageOrg: null,
        managePerson: null,
        managePhone: null,
        version: null,
        fsipUrl: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        status: null
      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.oid)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加凭证模版"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const oid = row.oid || this.ids
      getTemplate(oid).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改凭证模版"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.oid != null) {
            updateTemplate(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addTemplate(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const oids = row.oid || this.ids
      this.$modal.confirm('是否确认删除凭证模版编号为"' + oids + '"的数据项？').then(function() {
        return delTemplate(oids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 详情按钮操作 */
    handleViewData(row) {
      this.$refs["templateViewRef"].open(row.oid)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/template/export', {
        ...this.queryParams
      }, `template_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
