package cn.tf.vms.web.controller.system;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import cn.tf.vms.common.annotation.Log;
import cn.tf.vms.common.core.controller.BaseController;
import cn.tf.vms.common.core.domain.AjaxResult;
import cn.tf.vms.common.enums.BusinessType;
import cn.tf.vms.system.domain.VmsVendor;
import cn.tf.vms.system.service.IVmsVendorService;
import cn.tf.vms.common.utils.poi.ExcelUtil;
import cn.tf.vms.common.core.page.TableDataInfo;

/**
 * 厂商管理Controller
 *
 * @author zhonghuanfang
 * @date 2026-07-21
 */
@RestController
@RequestMapping("/system/vendor")
public class VmsVendorController extends BaseController
{
    @Autowired
    private IVmsVendorService vmsVendorService;

    /**
     * 查询厂商管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:vendor:list')")
    @GetMapping("/list")
    public TableDataInfo list(VmsVendor vmsVendor)
    {
        startPage();
        List<VmsVendor> list = vmsVendorService.selectVmsVendorList(vmsVendor);
        return getDataTable(list);
    }

    /**
     * 导出厂商管理列表
     */
    @PreAuthorize("@ss.hasPermi('system:vendor:export')")
    @Log(title = "厂商管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VmsVendor vmsVendor)
    {
        List<VmsVendor> list = vmsVendorService.selectVmsVendorList(vmsVendor);
        ExcelUtil<VmsVendor> util = new ExcelUtil<VmsVendor>(VmsVendor.class);
        util.exportExcel(response, list, "厂商管理数据");
    }

    /**
     * 获取厂商管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:vendor:query')")
    @GetMapping(value = "/{oid}")
    public AjaxResult getInfo(@PathVariable("oid") Long oid)
    {
        return success(vmsVendorService.selectVmsVendorByOid(oid));
    }

    /**
     * 新增厂商管理
     */
    @PreAuthorize("@ss.hasPermi('system:vendor:add')")
    @Log(title = "厂商管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VmsVendor vmsVendor)
    {
        return toAjax(vmsVendorService.insertVmsVendor(vmsVendor));
    }

    /**
     * 修改厂商管理
     */
    @PreAuthorize("@ss.hasPermi('system:vendor:edit')")
    @Log(title = "厂商管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VmsVendor vmsVendor)
    {
        return toAjax(vmsVendorService.updateVmsVendor(vmsVendor));
    }

    /**
     * 删除厂商管理
     */
    @PreAuthorize("@ss.hasPermi('system:vendor:remove')")
    @Log(title = "厂商管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{oids}")
    public AjaxResult remove(@PathVariable Long[] oids)
    {
        return toAjax(vmsVendorService.deleteVmsVendorByOids(oids));
    }
}
