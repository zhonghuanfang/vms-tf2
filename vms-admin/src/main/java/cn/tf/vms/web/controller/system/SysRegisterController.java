package cn.tf.vms.web.controller.system;

import cn.tf.vms.framework.web.service.SysRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import cn.tf.vms.common.core.controller.BaseController;
import cn.tf.vms.common.core.domain.AjaxResult;
import cn.tf.vms.common.core.domain.model.RegisterBody;
import cn.tf.vms.common.utils.StringUtils;
import cn.tf.vms.system.service.ISysConfigService;

/**
 * 注册验证
 * 
 * @author vms
 */
@RestController
public class SysRegisterController extends BaseController
{
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @PostMapping("/register")
    public AjaxResult register(@RequestBody RegisterBody user)
    {
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser"))))
        {
            return error("当前系统没有开启注册功能！");
        }
        String msg = registerService.register(user);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
