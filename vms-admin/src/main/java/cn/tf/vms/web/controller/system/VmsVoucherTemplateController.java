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
import cn.tf.vms.system.domain.VmsVoucherTemplate;
import cn.tf.vms.system.service.IVmsVoucherTemplateService;
import cn.tf.vms.common.utils.poi.ExcelUtil;
import cn.tf.vms.common.core.page.TableDataInfo;

/**
 * 凭证模版Controller
 *
 * @author zhonghuanfang
 * @date 2026-07-21
 */
@RestController
@RequestMapping("/system/template")
public class VmsVoucherTemplateController extends BaseController
{
    @Autowired
    private IVmsVoucherTemplateService vmsVoucherTemplateService;

    /**
     * 查询凭证模版列表
     */
    @PreAuthorize("@ss.hasPermi('system:template:list')")
    @GetMapping("/list")
    public TableDataInfo list(VmsVoucherTemplate vmsVoucherTemplate)
    {
        startPage();
        List<VmsVoucherTemplate> list = vmsVoucherTemplateService.selectVmsVoucherTemplateList(vmsVoucherTemplate);
        return getDataTable(list);
    }

    /**
     * 导出凭证模版列表
     */
    @PreAuthorize("@ss.hasPermi('system:template:export')")
    @Log(title = "凭证模版", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, VmsVoucherTemplate vmsVoucherTemplate)
    {
        List<VmsVoucherTemplate> list = vmsVoucherTemplateService.selectVmsVoucherTemplateList(vmsVoucherTemplate);
        ExcelUtil<VmsVoucherTemplate> util = new ExcelUtil<VmsVoucherTemplate>(VmsVoucherTemplate.class);
        util.exportExcel(response, list, "凭证模版数据");
    }

    /**
     * 获取凭证模版详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:template:query')")
    @GetMapping(value = "/{oid}")
    public AjaxResult getInfo(@PathVariable("oid") Long oid)
    {
        return success(vmsVoucherTemplateService.selectVmsVoucherTemplateByOid(oid));
    }

    /**
     * 新增凭证模版
     */
    @PreAuthorize("@ss.hasPermi('system:template:add')")
    @Log(title = "凭证模版", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody VmsVoucherTemplate vmsVoucherTemplate)
    {
        return toAjax(vmsVoucherTemplateService.insertVmsVoucherTemplate(vmsVoucherTemplate));
    }

    /**
     * 修改凭证模版
     */
    @PreAuthorize("@ss.hasPermi('system:template:edit')")
    @Log(title = "凭证模版", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody VmsVoucherTemplate vmsVoucherTemplate)
    {
        return toAjax(vmsVoucherTemplateService.updateVmsVoucherTemplate(vmsVoucherTemplate));
    }

    /**
     * 删除凭证模版
     */
    @PreAuthorize("@ss.hasPermi('system:template:remove')")
    @Log(title = "凭证模版", businessType = BusinessType.DELETE)
    @DeleteMapping("/{oids}")
    public AjaxResult remove(@PathVariable Long[] oids)
    {
        return toAjax(vmsVoucherTemplateService.deleteVmsVoucherTemplateByOids(oids));
    }
}
