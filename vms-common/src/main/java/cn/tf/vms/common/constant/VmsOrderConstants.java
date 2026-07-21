package cn.tf.vms.common.constant;

public class VmsOrderConstants
{
    public static final String BATCH_STATUS_PENDING_HEAD = "待总行管理员汇总";
    public static final String BATCH_STATUS_HEAD_PROCESSING = "总行管理员汇总中";
    public static final String BATCH_STATUS_HEAD_REVIEWING = "总行复核员审核中";
    public static final String BATCH_STATUS_HEAD_REJECTED = "总行复核员退回";
    public static final String BATCH_STATUS_ORDER_SUCCESS = "生成订单成功";

    public static final String DETAIL_STATUS_NORMAL = "00";
    public static final String DETAIL_STATUS_REJECTED = "01";

    public static final String BRANCH_STATUS_PENDING_BRANCH = "待分行管理员汇总";
    public static final String BRANCH_STATUS_BRANCH_PROCESSING = "分行管理员汇总处理中";
    public static final String BRANCH_STATUS_BRANCH_REVIEWING = "分行复核员审核中";
    public static final String BRANCH_STATUS_BRANCH_REJECTED = "分行复核员退回";

    public static final String DEPT_LEVEL_HEAD = "1";
    public static final String DEPT_LEVEL_BRANCH = "2";
    public static final String DEPT_LEVEL_SUBBRANCH = "4";

    public static final String ACTION_LOCK = "LOCK";
    public static final String ACTION_UNLOCK = "UNLOCK";
    public static final String ACTION_SUBMIT_REVIEW = "SUBMIT_REVIEW";
    public static final String ACTION_APPROVE = "APPROVE";
    public static final String ACTION_REJECT = "REJECT";
    public static final String ACTION_CREATE_BATCH = "CREATE_BATCH";
    public static final String ACTION_CLAIM = "CLAIM";
}
