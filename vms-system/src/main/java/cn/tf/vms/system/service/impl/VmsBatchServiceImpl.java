package cn.tf.vms.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.tf.vms.common.constant.VmsOrderConstants;
import cn.tf.vms.common.core.domain.entity.SysDept;
import cn.tf.vms.common.utils.DateUtils;
import cn.tf.vms.common.utils.SecurityUtils;
import cn.tf.vms.common.utils.StringUtils;
import cn.tf.vms.system.service.ISysDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tf.vms.system.mapper.VmsBatchMapper;
import cn.tf.vms.system.domain.VmsBatch;
import cn.tf.vms.system.service.IVmsBatchService;

@Service
public class VmsBatchServiceImpl implements IVmsBatchService
{
    @Autowired
    private VmsBatchMapper vmsBatchMapper;
    @Autowired
    private ISysDeptService sysDeptService;

    @Override public VmsBatch selectVmsBatchByOid(Long oid) { return vmsBatchMapper.selectVmsBatchByOid(oid); }
    @Override
    public List<VmsBatch> selectVmsBatchList(VmsBatch vmsBatch)
    {
        SysDept userDept = null;
        Long deptId = SecurityUtils.getLoginUser().getUser().getDeptId();
        if (deptId != null)
        {
            userDept = sysDeptService.selectDeptById(deptId);
        }
        if (userDept == null || StringUtils.isEmpty(userDept.getDeptLevel()))
        {
            return new ArrayList<>();
        }
        if (VmsOrderConstants.DEPT_LEVEL_HEAD.equals(userDept.getDeptLevel())) {
            //总行
            return vmsBatchMapper.selectVmsBatchList(vmsBatch);
        } else if (VmsOrderConstants.DEPT_LEVEL_BRANCH.equals(userDept.getDeptLevel())) {
            //分行 通过批次关联vms_batch_org_status，查询当前分行的批次状态为列表中批次状态
            String orgId = userDept.getDeptCode();
            if (StringUtils.isEmpty(orgId))
            {
                return new ArrayList<>();
            }
            return vmsBatchMapper.selectVmsBatchListByOrgId(orgId, vmsBatch);
        } else if (VmsOrderConstants.DEPT_LEVEL_SUBBRANCH.equals(userDept.getDeptLevel())) {
            //支行 查询当前支行所在分行，通过批次关联vms_batch_org_status，查询当前分行的批次状态为列表中批次状态
            String branchOrgId = findParentBranchOrgId(userDept);
            if (StringUtils.isEmpty(branchOrgId))
            {
                return new ArrayList<>();
            }
            return vmsBatchMapper.selectVmsBatchListByOrgId(branchOrgId, vmsBatch);
        } else {
            return new ArrayList<>();
        }
    }

    /**
     * 从支行部门向上遍历祖先链，找到所属分行（deptLevel="2"）的机构号
     */
    private String findParentBranchOrgId(SysDept subbranchDept)
    {
        if (StringUtils.isEmpty(subbranchDept.getAncestors()))
        {
            return null;
        }
        String[] ancestorIds = subbranchDept.getAncestors().split(",");
        for (int i = ancestorIds.length - 1; i >= 0; i--)
        {
            String ancestorId = ancestorIds[i].trim();
            if (!ancestorId.equals("0"))
            {
                try
                {
                    SysDept parent = sysDeptService.selectDeptById(Long.parseLong(ancestorId));
                    if (parent != null && VmsOrderConstants.DEPT_LEVEL_BRANCH.equals(parent.getDeptLevel()))
                    {
                        return parent.getDeptCode();
                    }
                }
                catch (NumberFormatException e)
                {
                    // 忽略无效的祖先ID
                }
            }
        }
        return null;
    }

    @Override public int insertVmsBatch(VmsBatch vmsBatch) { vmsBatch.setCreateTime(DateUtils.getNowDate()); return vmsBatchMapper.insertVmsBatch(vmsBatch); }
    @Override public int updateVmsBatch(VmsBatch vmsBatch) { vmsBatch.setUpdateTime(DateUtils.getNowDate()); return vmsBatchMapper.updateVmsBatch(vmsBatch); }
    @Override public int deleteVmsBatchByOids(Long[] oids) { return vmsBatchMapper.deleteVmsBatchByOids(oids); }
    @Override public int deleteVmsBatchByOid(Long oid) { return vmsBatchMapper.deleteVmsBatchByOid(oid); }
}
