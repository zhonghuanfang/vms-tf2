-- MySQL dump 10.13  Distrib 9.7.1, for macos15 (x86_64)
--
-- Host:     Database: vms-tf
-- ------------------------------------------------------
-- Server version	9.7.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '5c457a28-78e1-11f1-b234-3c44a365132c:1-1859';

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `form_col_num` int DEFAULT '1' COMMENT '表单布局（单列 双列 三列）',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (4,'vms_vendor','厂商管理表',NULL,NULL,'VmsVendor','crud','element-ui','cn.tf.vms.system','system','vendor','厂商管理','zhonghuanfang',2,'0','/','{\"genView\":\"1\",\"parentMenuId\":1}','admin','2026-07-13 00:29:52','','2026-07-13 00:35:45',NULL),(5,'vms_voucher_template','凭证模版表',NULL,NULL,'VmsVoucherTemplate','crud','element-ui','cn.tf.vms.system','system','template','凭证模版','zhonghuanfang',2,'0','/','{\"genView\":\"1\",\"parentMenuId\":1}','admin','2026-07-13 17:27:10','','2026-07-13 17:53:17',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (34,4,'oid',NULL,'bigint','Long','oid','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(35,4,'vendor_id','厂商ID','varchar(32)','String','vendorId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(36,4,'vendor_name','厂商名称','varchar(200)','String','vendorName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(37,4,'vendor_address','厂商地址','varchar(500)','String','vendorAddress','0','0','0','1','1','1','1','EQ','textarea','',4,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(38,4,'contact_name','联系人姓名','varchar(100)','String','contactName','0','0','0','1','1','1','1','LIKE','input','',5,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(39,4,'contact_phone','联系人电话','varchar(20)','String','contactPhone','0','0','0','1','1','1','1','EQ','input','',6,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(40,4,'contact_id_card','联系人身份证号','varchar(20)','String','contactIdCard','0','0','0','1','1','1','1','EQ','input','',7,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(41,4,'bank_account','收款账号','varchar(50)','String','bankAccount','0','0','0','1','1','1','1','EQ','input','',8,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(42,4,'bank_name','开户行','varchar(200)','String','bankName','0','0','0','1','1','1','1','LIKE','input','',9,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(43,4,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',10,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(44,4,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',11,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(45,4,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',12,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(46,4,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',13,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(47,4,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',14,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(48,4,'status','厂商状态（0正常 1停用）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',15,'admin','2026-07-13 00:29:52','','2026-07-13 00:35:45'),(49,5,'oid','oid','bigint','Long','oid','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(50,5,'template_id','模版ID','varchar(32)','String','templateId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(51,5,'template_name','模版名称','varchar(200)','String','templateName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(52,5,'template_code','模版编号','varchar(100)','String','templateCode','0','0','0','1','1','1','1','EQ','input','',4,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(53,5,'template_type','模版类型','varchar(50)','String','templateType','0','0','0','1','1','1','1','EQ','select','',5,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(54,5,'category','凭证类别: 一般/重空','varchar(50)','String','category','0','0','0','1','1','1','1','EQ','input','',6,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(55,5,'price','单价','decimal(12,2)','BigDecimal','price','0','0','0','1','1','1','1','EQ','input','',7,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(56,5,'spec','规格','varchar(100)','String','spec','0','0','0','1','1','1','1','EQ','input','',8,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(57,5,'unit','单位','varchar(20)','String','unit','0','0','0','1','1','1','1','EQ','input','',9,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(58,5,'tax_rate','税率%','decimal(5,2)','BigDecimal','taxRate','0','0','0','1','1','1','1','EQ','input','',10,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(59,5,'vendor_id','厂商ID','varchar(32)','String','vendorId','0','0','0','1','1','1','1','EQ','input','',11,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(60,5,'manage_org','管理机构','varchar(200)','String','manageOrg','0','0','0','1','1','1','1','EQ','input','',12,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(61,5,'manage_person','管理人','varchar(100)','String','managePerson','0','0','0','1','1','1','1','EQ','input','',13,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(62,5,'manage_phone','管理人联系方式','varchar(20)','String','managePhone','0','0','0','1','1','1','1','EQ','input','',14,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(63,5,'version','版本','varchar(20)','String','version','0','0','0','1','1','1','1','EQ','input','',15,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(64,5,'fsip_url','模版fsip地址','varchar(500)','String','fsipUrl','0','0','0','1','1','1','1','EQ','textarea','',16,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(65,5,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',17,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(66,5,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',18,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(67,5,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',19,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(68,5,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',20,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(69,5,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',21,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17'),(70,5,'status','状态（0正常 1停用）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',22,'admin','2026-07-13 17:27:10','','2026-07-13 17:53:17');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2026-07-10 17:19:30','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2026-07-10 17:19:30','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2026-07-10 17:19:30','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2026-07-10 17:19:30','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2026-07-10 17:19:30','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2026-07-10 17:19:30','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）'),(7,'用户管理-初始密码修改策略','sys.account.initPasswordModify','1','Y','admin','2026-07-10 17:19:30','',NULL,'0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框'),(8,'用户管理-账号密码更新周期','sys.account.passwordValidateDays','0','Y','admin','2026-07-10 17:19:30','',NULL,'密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框'),(9,'用户管理-密码字符范围','sys.account.chrtype','0','Y','admin','2026-07-10 17:19:30','',NULL,'默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `dept_code` varchar(64) DEFAULT '' COMMENT '部门代码',
  `dept_level` char(1) DEFAULT '0' COMMENT '部门等级（0集团 1公司 2部门 3小组）',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2026-07-10 17:46:35','',NULL,'','0'),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2026-07-10 17:46:35','',NULL,'','1'),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2026-07-10 17:46:35','',NULL,'','1'),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2026-07-10 17:46:35','',NULL,'','2'),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2026-07-10 17:46:35','',NULL,'','2'),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2026-07-10 17:46:35','',NULL,'','2'),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2026-07-10 17:46:35','',NULL,'','2'),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2026-07-10 17:46:35','',NULL,'','2'),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2026-07-10 17:46:35','',NULL,'','2'),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2026-07-10 17:46:35','',NULL,'','2'),(200,0,'0','四川天府银行全行',0,NULL,'15888888888',NULL,'0','0','admin',NULL,'admin','2026-07-12 01:17:58','0000000','0'),(201,200,'0,200','四川天府银行',1,NULL,NULL,NULL,'0','0','admin','2026-07-12 00:52:27','',NULL,'0500000','1'),(202,201,'0,200,201','总行营业部',1,NULL,NULL,NULL,'0','0','admin','2026-07-12 00:53:14','',NULL,'0511000','2'),(203,202,'0,200,201,202','营业部',1,NULL,NULL,NULL,'0','0','admin','2026-07-12 00:53:47','',NULL,'1870001','3'),(204,203,'0,200,201,202,203','营业部',1,NULL,NULL,NULL,'0','0','admin','2026-07-12 01:05:40','',NULL,'0511001','4');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2026-07-10 17:19:30','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2026-07-10 17:19:30','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2026-07-10 17:19:30','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2026-07-10 17:19:30','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2026-07-10 17:19:30','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2026-07-10 17:19:30','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2026-07-10 17:19:30','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2026-07-10 17:19:30','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2026-07-10 17:19:30','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2026-07-10 17:19:30','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2026-07-10 17:19:30','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2026-07-10 17:19:30','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2026-07-10 17:19:30','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2026-07-10 17:19:30','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2026-07-10 17:19:30','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2026-07-10 17:19:30','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2026-07-10 17:19:30','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2026-07-10 17:19:30','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2026-07-10 17:19:30','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2026-07-10 17:19:30','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2026-07-10 17:19:30','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2026-07-10 17:19:30','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2026-07-10 17:19:30','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2026-07-10 17:19:30','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2026-07-10 17:19:30','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2026-07-10 17:19:30','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2026-07-10 17:19:30','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2026-07-10 17:19:30','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2026-07-10 17:19:30','',NULL,'停用状态'),(100,1,'正常','00','batch_detail_status',NULL,'success','N','0','admin','2026-07-15 16:17:40','admin','2026-07-17 11:47:50',NULL),(101,2,'退回','01','batch_detail_status',NULL,'warning','N','0','admin','2026-07-15 16:18:06','admin','2026-07-17 11:47:58',NULL),(102,0,'待分行管理员汇总','10','batch_branch_status',NULL,'info','N','0','admin','2026-07-15 16:20:13','admin','2026-07-15 16:23:50',NULL),(103,1,'分行管理员汇总处理中','11','batch_branch_status',NULL,'warning','N','0','admin','2026-07-15 16:20:42','admin','2026-07-15 16:23:59',NULL),(104,2,'分行复核员审核中','12','batch_branch_status',NULL,'info','N','0','admin','2026-07-15 16:21:18','admin','2026-07-15 16:24:07',NULL),(105,3,'分行复核员退回','13','batch_branch_status',NULL,'danger','N','0','admin','2026-07-15 16:21:56','admin','2026-07-15 16:24:15',NULL),(106,10,'待总行管理员汇总','20','batch_branch_status',NULL,'info','N','0','admin','2026-07-15 16:22:46','admin','2026-07-15 16:23:32',NULL),(107,11,'总行管理员汇总处理中','21','batch_branch_status',NULL,'warning','N','0','admin','2026-07-15 16:24:33','',NULL,NULL),(108,4,'总行管理员退回','14','batch_branch_status',NULL,'danger','N','0','admin','2026-07-15 16:25:16','',NULL,NULL),(109,12,'总行复核员审核中','22','batch_branch_status',NULL,'info','N','0','admin','2026-07-15 16:25:49','',NULL,NULL),(110,13,'总行复核员退回','23','batch_branch_status',NULL,'danger','N','0','admin','2026-07-15 16:26:09','',NULL,NULL),(111,100,'生成订单成功','100','batch_branch_status',NULL,'success','N','0','admin','2026-07-15 16:26:46','admin','2026-07-15 16:26:54',NULL),(112,1,'总行','1','dept_level',NULL,'default','N','0','admin','2026-07-15 16:35:23','',NULL,NULL),(113,2,'分行','2','dept_level',NULL,'default','N','0','admin','2026-07-15 16:35:34','',NULL,NULL),(114,4,'支行','4','dept_level',NULL,'default','N','0','admin','2026-07-15 16:35:43','',NULL,NULL),(115,10,'待总行管理员汇总','20','batch_status',NULL,'info','N','0','admin','2026-07-15 16:22:46','admin','2026-07-17 11:48:35',NULL),(116,11,'总行管理员汇总处理中','21','batch_status',NULL,'warning','N','0','admin','2026-07-15 16:24:33','admin','2026-07-17 11:48:42',NULL),(118,13,'总行复核员审核中','22','batch_status',NULL,'info','N','0','admin','2026-07-15 16:25:49','admin','2026-07-17 11:48:53',NULL),(119,14,'总行复核员退回','23','batch_status',NULL,'danger','N','0','admin','2026-07-15 16:26:09','admin','2026-07-17 11:49:02',NULL),(120,100,'生成订单成功','100','batch_status',NULL,'success','N','0','admin','2026-07-15 16:26:46','admin','2026-07-15 16:26:54',NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2026-07-10 17:19:30','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2026-07-10 17:19:30','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2026-07-10 17:19:30','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2026-07-10 17:19:30','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2026-07-10 17:19:30','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2026-07-10 17:19:30','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2026-07-10 17:19:30','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2026-07-10 17:19:30','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2026-07-10 17:19:30','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2026-07-10 17:19:30','',NULL,'登录状态列表'),(100,'批次明细状态','batch_detail_status','0','admin','2026-07-15 16:14:23','',NULL,'批次明细表状态\n'),(101,'批次状态','batch_status','0','admin','2026-07-15 16:18:44','admin','2026-07-15 16:19:18','批次状态'),(102,'机构等级','dept_level','0','admin','2026-07-15 16:34:52','',NULL,NULL),(103,'批次机构状态','batch_branch_status','0','admin','2026-07-15 16:46:32','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2026-07-10 17:19:30','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2026-07-10 17:19:30','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2026-07-10 17:19:30','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `start_time` datetime DEFAULT NULL COMMENT '执行开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '执行结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-10 17:22:11'),(101,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-10 18:00:12'),(102,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-12 00:50:24'),(103,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-13 00:18:28'),(104,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-13 11:16:18'),(105,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-13 14:17:17'),(106,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-13 17:03:36'),(107,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-14 09:57:20'),(108,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-14 11:51:14'),(109,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','验证码错误','2026-07-14 17:12:29'),(110,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-14 17:12:32'),(111,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-14 17:25:57'),(112,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','验证码错误','2026-07-14 17:26:05'),(113,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','验证码错误','2026-07-14 17:26:06'),(114,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','验证码错误','2026-07-14 17:26:09'),(115,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','验证码错误','2026-07-14 17:26:20'),(116,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-14 17:26:30'),(117,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 09:34:07'),(118,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 10:46:39'),(119,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-15 10:46:51'),(120,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','用户不存在/密码错误','2026-07-15 10:47:08'),(121,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','验证码错误','2026-07-15 10:48:20'),(122,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 10:48:24'),(123,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-15 11:45:19'),(124,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','验证码错误','2026-07-15 11:45:32'),(125,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','用户不存在/密码错误','2026-07-15 11:45:35'),(126,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','验证码错误','2026-07-15 11:45:47'),(127,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 11:45:53'),(128,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 14:24:18'),(129,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-15 14:36:28'),(130,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 14:36:52'),(131,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-15 14:36:57'),(132,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 14:37:11'),(133,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-15 15:26:58'),(134,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 15:27:12'),(135,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 16:13:00'),(136,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 16:39:04'),(137,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 16:57:15'),(138,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-15 17:11:08'),(139,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 17:11:26'),(140,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 17:11:36'),(141,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-15 17:39:10'),(142,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 17:39:45'),(143,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 17:40:22'),(144,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-15 17:43:29'),(145,'000002','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','验证码错误','2026-07-15 17:43:42'),(146,'000002','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 17:43:45'),(147,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-15 17:46:46'),(148,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-15 17:46:54'),(149,'000002','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 10:06:39'),(150,'000002','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 11:23:10'),(151,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 11:39:03'),(152,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-16 11:40:52'),(153,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 11:40:57'),(154,'admin','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-16 11:44:31'),(155,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 11:44:46'),(156,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-16 11:45:55'),(157,'000002','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-16 11:46:25'),(158,'admin','127.0.0.1','内网IP','Safari 16.4','Mac OS >=10.15.7','0','登录成功','2026-07-16 11:46:45'),(159,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 11:47:36'),(160,'admin','127.0.0.1','内网IP','Safari 16.4','Mac OS >=10.15.7','1','验证码错误','2026-07-16 14:32:02'),(161,'admin','127.0.0.1','内网IP','Safari 16.4','Mac OS >=10.15.7','0','登录成功','2026-07-16 14:32:06'),(162,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 15:26:28'),(163,'admin','127.0.0.1','内网IP','Safari 16.4','Mac OS >=10.15.7','1','验证码错误','2026-07-16 15:28:29'),(164,'admin','127.0.0.1','内网IP','Safari 16.4','Mac OS >=10.15.7','1','验证码错误','2026-07-16 15:28:32'),(165,'admin','127.0.0.1','内网IP','Safari 16.4','Mac OS >=10.15.7','1','验证码错误','2026-07-16 15:28:36'),(166,'admin','127.0.0.1','内网IP','Safari 16.4','Mac OS >=10.15.7','0','登录成功','2026-07-16 15:28:41'),(167,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-16 15:29:14'),(168,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 15:29:31'),(169,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-16 15:34:12'),(170,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 15:34:21'),(171,'admin','127.0.0.1','内网IP','Safari 16.4','Mac OS >=10.15.7','0','登录成功','2026-07-16 21:47:54'),(172,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','验证码已失效','2026-07-16 21:51:50'),(173,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 21:51:55'),(174,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-16 22:12:14'),(175,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 22:12:24'),(176,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-16 22:12:32'),(177,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 22:12:37'),(178,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-16 22:12:42'),(179,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 22:12:50'),(180,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','退出成功','2026-07-16 22:42:10'),(181,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','验证码错误','2026-07-16 22:42:37'),(182,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','1','验证码错误','2026-07-16 22:42:41'),(183,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-16 22:42:44'),(184,'admin','127.0.0.1','内网IP','Safari 16.4','Mac OS >=10.15.7','0','登录成功','2026-07-17 11:34:35'),(185,'admin','127.0.0.1','内网IP','Safari 16.4','Mac OS >=10.15.7','0','登录成功','2026-07-17 14:43:40'),(186,'000286','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-17 15:22:00'),(187,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-17 17:00:29'),(188,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-17 17:57:41'),(189,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-19 20:52:19'),(190,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-19 23:30:20'),(191,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-20 00:44:12'),(192,'admin','127.0.0.1','内网IP','Safari 16.4','Mac OS >=10.15.7','0','登录成功','2026-07-20 09:37:51'),(193,'001107','127.0.0.1','内网IP','Chrome 149','Mac OS >=10.15.7','0','登录成功','2026-07-20 09:42:23');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3027 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2026-07-10 17:19:30','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','1','0','','monitor','admin','2026-07-10 17:19:30','admin','2026-07-15 09:52:11','系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2026-07-10 17:19:30','admin','2026-07-15 09:52:06','系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','1','1','','guide','admin','2026-07-10 17:19:30','admin','2026-07-15 09:51:04','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2026-07-10 17:19:30','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2026-07-10 17:19:30','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2026-07-10 17:19:30','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2026-07-10 17:19:30','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2026-07-10 17:19:30','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2026-07-10 17:19:30','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2026-07-10 17:19:30','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2026-07-10 17:19:30','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2026-07-10 17:19:30','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2026-07-10 17:19:30','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2026-07-10 17:19:30','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2026-07-10 17:19:30','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2026-07-10 17:19:30','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2026-07-10 17:19:30','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2026-07-10 17:19:30','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2026-07-10 17:19:30','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2026-07-10 17:19:30','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2026-07-10 17:19:30','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2026-07-10 17:19:30','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2026-07-10 17:19:30','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2026-07-10 17:19:30','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2026-07-10 17:19:30','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2026-07-10 17:19:30','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2026-07-10 17:19:30','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2026-07-10 17:19:30','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2026-07-10 17:19:30','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2026-07-10 17:19:30','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2026-07-10 17:19:30','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2026-07-10 17:19:30','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2026-07-10 17:19:30','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2026-07-10 17:19:30','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2026-07-10 17:19:30','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2026-07-10 17:19:30','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2026-07-10 17:19:30','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2026-07-10 17:19:30','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2026-07-10 17:19:30','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2026-07-10 17:19:30','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2026-07-10 17:19:30','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2026-07-10 17:19:30','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2026-07-10 17:19:30','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2026-07-10 17:19:30','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2026-07-10 17:19:30','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2026-07-10 17:19:30','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2026-07-10 17:19:30','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2026-07-10 17:19:30','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2026-07-10 17:19:30','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2026-07-10 17:19:30','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2026-07-10 17:19:30','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2026-07-10 17:19:30','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2026-07-10 17:19:30','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2026-07-10 17:19:30','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2026-07-10 17:19:30','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2026-07-10 17:19:30','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2026-07-10 17:19:30','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2026-07-10 17:19:30','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2026-07-10 17:19:30','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2026-07-10 17:19:30','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2026-07-10 17:19:30','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2026-07-10 17:19:30','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2026-07-10 17:19:30','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2026-07-10 17:19:30','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2026-07-10 17:19:30','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2026-07-10 17:19:30','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2026-07-10 17:19:30','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2026-07-10 17:19:30','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2026-07-10 17:19:30','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2026-07-10 17:19:30','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2026-07-10 17:19:30','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2026-07-10 17:19:30','',NULL,''),(2000,'厂商管理',1,10,'vendor','system/vendor/index',NULL,'',1,0,'C','0','0','system:vendor:list','peoples','admin','2026-07-13 00:56:06','',NULL,''),(2002,'厂商查询',2000,1,'',NULL,NULL,'',1,0,'F','0','0','system:vendor:query','#','admin','2026-07-13 00:59:19','',NULL,''),(2004,'厂商新增',2000,2,'',NULL,NULL,'',1,0,'F','0','0','system:vendor:add','#','admin','2026-07-13 01:01:46','',NULL,''),(2005,'厂商修改',2000,3,'',NULL,NULL,'',1,0,'F','0','0','system:vendor:edit','#','admin','2026-07-13 11:17:51','',NULL,''),(2006,'厂商导出',2000,4,'',NULL,NULL,'',1,0,'F','0','0','system:vendor:export','#','admin','2026-07-13 11:18:50','',NULL,''),(2007,'凭证订购',0,5,'voucher',NULL,NULL,'',1,0,'M','1','0','','excel','admin','2026-07-13 14:26:29','admin','2026-07-15 09:52:27',''),(2008,'凭证模版管理',1,11,'template','system/template/index',NULL,'',1,0,'C','0','0','system:template:list','documentation','admin','2026-07-13 18:03:00','',NULL,''),(2009,'查询',2008,1,'',NULL,NULL,'',1,0,'F','0','0','system:template:query','#','admin','2026-07-14 10:21:08','',NULL,''),(2010,'新增',2008,2,'',NULL,NULL,'',1,0,'F','0','0','system:template:add','#','admin','2026-07-14 10:22:01','',NULL,''),(2011,'修改',2008,2,'',NULL,NULL,'',1,0,'F','0','0','system:template:edit','#','admin','2026-07-14 10:22:58','',NULL,''),(2012,'导出',2008,3,'',NULL,NULL,'',1,0,'F','0','0','system:template:export','#','admin','2026-07-14 10:23:35','',NULL,''),(3000,'凭证订购管理',0,10,'order',NULL,'','',1,0,'M','0','0','order:batch:list','shopping','admin','2026-07-14 17:17:28','admin','2026-07-14 17:31:55','凭证订购管理菜单'),(3001,'订购批次',3000,1,'batch','order/batch/index','','',1,0,'C','0','0','order:batch:list','#','admin','2026-07-14 17:17:28','admin','2026-07-14 17:34:41','订购批次菜单'),(3002,'批次查询',3001,1,'',NULL,'','',1,0,'F','0','0','order:batch:query','#','admin','2026-07-14 17:17:28','',NULL,''),(3003,'批次新增',3001,2,'',NULL,'','',1,0,'F','0','0','order:batch:add','#','admin','2026-07-14 17:17:28','',NULL,''),(3004,'批次修改',3001,3,'',NULL,'','',1,0,'F','0','0','order:batch:edit','#','admin','2026-07-14 17:17:28','',NULL,''),(3005,'批次删除',3001,4,'',NULL,'','',1,0,'F','0','0','order:batch:remove','#','admin','2026-07-14 17:17:28','',NULL,''),(3006,'批次锁定',3001,5,'',NULL,'','',1,0,'F','0','0','order:batch:lock','#','admin','2026-07-14 17:17:28','',NULL,''),(3007,'批次解锁',3001,6,'',NULL,'','',1,0,'F','0','0','order:batch:unlock','#','admin','2026-07-14 17:17:28','',NULL,''),(3008,'提交审核',3001,7,'',NULL,'','',1,0,'F','0','0','order:batch:submit','#','admin','2026-07-14 17:17:28','',NULL,''),(3009,'审核',3001,8,'',NULL,'','',1,0,'F','0','0','order:batch:approve','#','admin','2026-07-14 17:17:28','',NULL,''),(3010,'审核驳回',3001,9,'',NULL,'','',1,0,'F','0','0','order:batch:reject','#','admin','2026-07-14 17:17:28','',NULL,''),(3011,'明细查询',3001,10,'',NULL,'','',1,0,'F','0','0','order:detail:list','#','admin','2026-07-14 17:17:28','',NULL,''),(3012,'明细新增',3001,11,'',NULL,'','',1,0,'F','0','0','order:detail:add','#','admin','2026-07-14 17:17:28','',NULL,''),(3013,'明细修改',3001,12,'',NULL,'','',1,0,'F','0','0','order:detail:edit','#','admin','2026-07-14 17:17:28','',NULL,''),(3014,'明细删除',3001,13,'',NULL,'','',1,0,'F','0','0','order:detail:remove','#','admin','2026-07-14 17:17:28','',NULL,''),(3015,'号段查询',3001,14,'',NULL,'','',1,0,'F','0','0','order:segment:list','#','admin','2026-07-14 17:17:28','',NULL,''),(3016,'号段编辑',3001,15,'',NULL,'','',1,0,'F','0','0','order:segment:edit','#','admin','2026-07-14 17:17:28','',NULL,''),(3017,'订单查询',3001,16,'',NULL,'','',1,0,'F','0','0','order:order:list','#','admin','2026-07-14 17:17:28','',NULL,''),(3018,'日志查询',3001,17,'',NULL,'','',1,0,'F','0','0','order:log:list','#','admin','2026-07-14 17:17:28','',NULL,''),(3019,'订购明细',3000,2,'batch_detail','/order/batch/detail',NULL,'',1,0,'C','1','0','order:detail:list','dict','admin','2026-07-15 10:35:18','admin','2026-07-15 10:39:20',''),(3020,'查询',3019,1,'',NULL,NULL,'',1,0,'F','0','0','order:detail:query','#','admin','2026-07-15 10:41:35','',NULL,''),(3021,'新增',3019,2,'',NULL,NULL,'',1,0,'F','0','0','order:detail:add','#','admin','2026-07-15 10:42:24','',NULL,''),(3022,'修改',3019,3,'',NULL,NULL,'',1,0,'F','0','0','order:detail:edit','#','admin','2026-07-15 10:43:17','',NULL,''),(3023,'删除',3019,4,'',NULL,NULL,'',1,0,'F','0','0','order:detail:remove','#','admin','2026-07-15 10:44:00','',NULL,''),(3024,'明细详情查询',3001,18,'',NULL,NULL,'',1,0,'F','0','0','order:detail:query','#','admin','2026-07-16 15:31:45','',NULL,''),(3025,'凭证类型汇总',3001,18,'',NULL,'','',1,0,'F','0','0','order:batch:summary','#','admin','2026-07-16 21:47:34','',NULL,''),(3026,'明细退回',3001,19,'',NULL,'','',1,0,'F','0','0','order:detail:reject','#','admin','2026-07-17 16:47:09','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2026-07-10 17:19:30','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2026-07-10 17:19:30','',NULL,'管理员'),(3,'若依开源框架介绍','1',_binary '<p><span style=\"color: rgb(230, 0, 0);\">项目介绍</span></p><p><font color=\"#333333\">RuoYi开源项目是为企业用户定制的后台脚手架框架，为企业打造的一站式解决方案，降低企业开发成本，提升开发效率。主要包括用户管理、角色管理、部门管理、菜单管理、参数管理、字典管理、</font><span style=\"color: rgb(51, 51, 51);\">岗位管理</span><span style=\"color: rgb(51, 51, 51);\">、定时任务</span><span style=\"color: rgb(51, 51, 51);\">、</span><span style=\"color: rgb(51, 51, 51);\">服务监控、登录日志、操作日志、代码生成等功能。其中，还支持多数据源、数据权限、国际化、Redis缓存、Docker部署、滑动验证码、第三方认证登录、分布式事务、</span><font color=\"#333333\">分布式文件存储</font><span style=\"color: rgb(51, 51, 51);\">、分库分表处理等技术特点。</span></p><p><img src=\"https://foruda.gitee.com/images/1773931848342439032/a4d22313_1815095.png\" style=\"width: 64px;\"><br></p><p><span style=\"color: rgb(230, 0, 0);\">官网及演示</span></p><p><span style=\"color: rgb(51, 51, 51);\">若依官网地址：&nbsp;</span><a href=\"http://ruoyi.vip\" target=\"_blank\">http://ruoyi.vip</a><a href=\"http://ruoyi.vip\" target=\"_blank\"></a></p><p><span style=\"color: rgb(51, 51, 51);\">若依文档地址：&nbsp;</span><a href=\"http://doc.ruoyi.vip\" target=\"_blank\">http://doc.ruoyi.vip</a><br></p><p><span style=\"color: rgb(51, 51, 51);\">演示地址【不分离版】：&nbsp;</span><a href=\"http://demo.ruoyi.vip\" target=\"_blank\">http://demo.ruoyi.vip</a></p><p><span style=\"color: rgb(51, 51, 51);\">演示地址【分离版本】：&nbsp;</span><a href=\"http://vue.ruoyi.vip\" target=\"_blank\">http://vue.ruoyi.vip</a></p><p><span style=\"color: rgb(51, 51, 51);\">演示地址【微服务版】：&nbsp;</span><a href=\"http://cloud.ruoyi.vip\" target=\"_blank\">http://cloud.ruoyi.vip</a></p><p><span style=\"color: rgb(51, 51, 51);\">演示地址【移动端版】：&nbsp;</span><a href=\"http://h5.ruoyi.vip\" target=\"_blank\">http://h5.ruoyi.vip</a></p><p><br style=\"color: rgb(48, 49, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 12px;\"></p>','0','admin','2026-07-10 17:19:30','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_read`
--

DROP TABLE IF EXISTS `sys_notice_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice_read` (
  `read_id` bigint NOT NULL AUTO_INCREMENT COMMENT '已读主键',
  `notice_id` int NOT NULL COMMENT '公告id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `read_time` datetime NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`read_id`),
  UNIQUE KEY `uk_user_notice` (`user_id`,`notice_id`) COMMENT '同一用户同一公告只记录一次'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='公告已读记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_read`
--

LOCK TABLES `sys_notice_read` WRITE;
/*!40000 ALTER TABLE `sys_notice_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'部门管理',1,'cn.tf.vms.web.controller.system.SysDeptController.add()','POST',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,200\",\"children\":[],\"createBy\":\"admin\",\"deptCode\":\"0500000\",\"deptName\":\"四川天府银行\",\"orderNum\":1,\"params\":{},\"parentId\":200,\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 00:52:27',48),(101,'部门管理',1,'cn.tf.vms.web.controller.system.SysDeptController.add()','POST',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,200,201\",\"children\":[],\"createBy\":\"admin\",\"deptCode\":\"1870001\",\"deptName\":\"总行营业部\",\"orderNum\":1,\"params\":{},\"parentId\":201,\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 00:53:14',13),(102,'部门管理',1,'cn.tf.vms.web.controller.system.SysDeptController.add()','POST',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,200,201,202\",\"children\":[],\"createBy\":\"admin\",\"deptCode\":\"0511001\",\"deptName\":\"营业部\",\"orderNum\":1,\"params\":{},\"parentId\":202,\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 00:53:47',10),(103,'用户管理',2,'cn.tf.vms.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-07-10 17:19:30\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"ry@163.com\",\"loginDate\":\"2026-07-12 00:50:24\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[1],\"pwdUpdateDate\":\"2026-07-10 17:19:30\",\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"\",\"userId\":1,\"userName\":\"admin\"} ',NULL,1,'不允许操作超级管理员用户','2026-07-12 00:57:16',5),(104,'用户管理',1,'cn.tf.vms.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":203,\"nickName\":\"支行管理员\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":100,\"userName\":\"支行管理员\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 00:58:12',121),(105,'角色管理',1,'cn.tf.vms.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"subbranch_manager\",\"roleName\":\"支行管理员\",\"roleSort\":0,\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 01:01:51',27),(106,'角色管理',1,'cn.tf.vms.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":101,\"roleKey\":\"branch_manager\",\"roleName\":\"分行管理员\",\"roleSort\":0,\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 01:02:27',10),(107,'角色管理',1,'cn.tf.vms.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":102,\"roleKey\":\"head_manager\",\"roleName\":\"总行管理员\",\"roleSort\":0,\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 01:03:02',11),(108,'角色管理',1,'cn.tf.vms.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":103,\"roleKey\":\"head_reviewer\",\"roleName\":\"总行复核员\",\"roleSort\":0,\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 01:03:39',10),(109,'部门管理',1,'cn.tf.vms.web.controller.system.SysDeptController.add()','POST',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,200,201,202,203\",\"children\":[],\"createBy\":\"admin\",\"deptCode\":\"0511001\",\"deptName\":\"营业部\",\"orderNum\":1,\"params\":{},\"parentId\":203,\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 01:05:40',8),(110,'部门管理',2,'cn.tf.vms.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0\",\"children\":[],\"deptId\":200,\"deptLevel\":\"0\",\"deptName\":\"四川天府银行全行\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 01:17:58',14),(111,'用户管理',2,'cn.tf.vms.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-07-12 00:58:12\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,200,201,202\",\"children\":[],\"deptId\":203,\"deptName\":\"营业部\",\"orderNum\":1,\"params\":{},\"parentId\":202,\"status\":\"0\"},\"deptId\":204,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"支行管理员\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"支行管理员\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 01:20:02',16),(112,'用户管理',1,'cn.tf.vms.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":202,\"nickName\":\"分行管理员\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":101,\"userName\":\"分行管理员\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 01:21:02',95),(113,'用户管理',1,'cn.tf.vms.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"总行管理员\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":102,\"userName\":\"总行管理员\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 01:21:26',94),(114,'用户管理',1,'cn.tf.vms.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":201,\"nickName\":\"总行复核员\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":103,\"userName\":\"zhfh\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-12 01:24:40',105),(115,'创建表',0,'cn.tf.vms.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"tplWebType\":\"element-ui\",\"sql\":\"CREATE TABLE IF NOT EXISTS vms_vendor (\\n    oid BIGINT AUTO_INCREMENT PRIMARY KEY,\\n    vendor_id VARCHAR(32) NOT NULL COMMENT \'厂商ID\',\\n    vendor_name VARCHAR(200) NOT NULL COMMENT \'厂商名称\',\\n    vendor_address VARCHAR(500) COMMENT \'厂商地址\',\\n    contact_name VARCHAR(100) COMMENT \'联系人姓名\',\\n    contact_phone VARCHAR(20) COMMENT \'联系人电话\',\\n    contact_id_card VARCHAR(20) COMMENT \'联系人身份证号\',\\n    bank_account VARCHAR(50) COMMENT \'收款账号\',\\n    bank_name VARCHAR(200) COMMENT \'开户行\',\\n    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,\\n    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,\\n    UNIQUE KEY uk_vendor_id (vendor_id)\\n) COMMENT=\'厂商管理表\';\\n\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:18:37',299),(116,'代码生成',3,'cn.tf.vms.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/1','127.0.0.1','内网IP','[1] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:23:45',11),(117,'创建表',0,'cn.tf.vms.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"tplWebType\":\"element-ui\",\"sql\":\"-- 8. 厂商表\\nCREATE TABLE IF NOT EXISTS vms_vendor (\\n    oid BIGINT AUTO_INCREMENT PRIMARY KEY,\\n    vendor_id VARCHAR(32) NOT NULL COMMENT \'厂商ID\',\\n    vendor_name VARCHAR(200) NOT NULL COMMENT \'厂商名称\',\\n    vendor_address VARCHAR(500) COMMENT \'厂商地址\',\\n    contact_name VARCHAR(100) COMMENT \'联系人姓名\',\\n    contact_phone VARCHAR(20) COMMENT \'联系人电话\',\\n    contact_id_card VARCHAR(20) COMMENT \'联系人身份证号\',\\n    bank_account VARCHAR(50) COMMENT \'收款账号\',\\n    bank_name VARCHAR(200) COMMENT \'开户行\',\\n    create_by varchar(64) DEFAULT \'\' COMMENT \'创建者\',\\n  create_time datetime DEFAULT NULL COMMENT \'创建时间\',\\n  update_by varchar(64) DEFAULT \'\' COMMENT \'更新者\',\\n  update_time datetime DEFAULT NULL COMMENT \'更新时间\',\\n  remark varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  status char(1) DEFAULT \'0\' COMMENT \'厂商状态（0正常 1停用）\'\\n    UNIQUE KEY uk_vendor_id (vendor_id)\\n) COMMENT=\'厂商管理表\';\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2026-07-13 00:23:57',7),(118,'创建表',0,'cn.tf.vms.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"tplWebType\":\"element-ui\",\"sql\":\"CREATE TABLE IF NOT EXISTS vms_vendor (\\n    oid BIGINT AUTO_INCREMENT PRIMARY KEY,\\n    vendor_id VARCHAR(32) NOT NULL COMMENT \'厂商ID\',\\n    vendor_name VARCHAR(200) NOT NULL COMMENT \'厂商名称\',\\n    vendor_address VARCHAR(500) COMMENT \'厂商地址\',\\n    contact_name VARCHAR(100) COMMENT \'联系人姓名\',\\n    contact_phone VARCHAR(20) COMMENT \'联系人电话\',\\n    contact_id_card VARCHAR(20) COMMENT \'联系人身份证号\',\\n    bank_account VARCHAR(50) COMMENT \'收款账号\',\\n    bank_name VARCHAR(200) COMMENT \'开户行\',\\n    create_by varchar(64) DEFAULT \'\' COMMENT \'创建者\',\\n  create_time datetime DEFAULT NULL COMMENT \'创建时间\',\\n  update_by varchar(64) DEFAULT \'\' COMMENT \'更新者\',\\n  update_time datetime DEFAULT NULL COMMENT \'更新时间\',\\n  remark varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  status char(1) DEFAULT \'0\' COMMENT \'厂商状态（0正常 1停用）\',\\n    UNIQUE KEY uk_vendor_id (vendor_id)\\n) COMMENT=\'厂商管理表\';\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:24:44',93),(119,'代码生成',3,'cn.tf.vms.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/2','127.0.0.1','内网IP','[2] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:25:31',8),(120,'创建表',0,'cn.tf.vms.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"tplWebType\":\"element-ui\",\"sql\":\"CREATE TABLE IF NOT EXISTS vms_vendor (\\n    oid BIGINT AUTO_INCREMENT PRIMARY KEY,\\n    vendor_id VARCHAR(32) NOT NULL COMMENT \'厂商ID\',\\n    vendor_name VARCHAR(200) NOT NULL COMMENT \'厂商名称\',\\n    vendor_address VARCHAR(500) COMMENT \'厂商地址\',\\n    contact_name VARCHAR(100) COMMENT \'联系人姓名\',\\n    contact_phone VARCHAR(20) COMMENT \'联系人电话\',\\n    contact_id_card VARCHAR(20) COMMENT \'联系人身份证号\',\\n    bank_account VARCHAR(50) COMMENT \'收款账号\',\\n    bank_name VARCHAR(200) COMMENT \'开户行\',\\n    create_by varchar(64) DEFAULT \'\' COMMENT \'创建者\',\\n  create_time datetime DEFAULT NULL COMMENT \'创建时间\',\\n  update_by varchar(64) DEFAULT \'\' COMMENT \'更新者\',\\n  update_time datetime DEFAULT NULL COMMENT \'更新时间\',\\n  remark varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  status char(1) DEFAULT \'0\' COMMENT \'厂商状态（0正常 1停用）\',\\n    UNIQUE KEY uk_vendor_id (vendor_id)\\n) COMMENT=\'厂商管理表\';\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:25:40',64),(121,'代码生成',2,'cn.tf.vms.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"vendor\",\"className\":\"VmsVendor\",\"columns\":[{\"capJavaField\":\"Oid\",\"columnId\":23,\"columnName\":\"oid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:25:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"oid\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VendorId\",\"columnComment\":\"厂商ID\",\"columnId\":24,\"columnName\":\"vendor_id\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vendorId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VendorName\",\"columnComment\":\"厂商名称\",\"columnId\":25,\"columnName\":\"vendor_name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vendorName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VendorAddress\",\"columnComment\":\"厂商地址\",\"columnId\":26,\"columnName\":\"vendor_address\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaF','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:26:59',76),(122,'代码生成',2,'cn.tf.vms.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"vendor\",\"className\":\"VmsVendor\",\"columns\":[{\"capJavaField\":\"Oid\",\"columnId\":23,\"columnName\":\"oid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:25:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"oid\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2026-07-13 00:26:59\",\"usableColumn\":false},{\"capJavaField\":\"VendorId\",\"columnComment\":\"厂商ID\",\"columnId\":24,\"columnName\":\"vendor_id\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vendorId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2026-07-13 00:26:59\",\"usableColumn\":false},{\"capJavaField\":\"VendorName\",\"columnComment\":\"厂商名称\",\"columnId\":25,\"columnName\":\"vendor_name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vendorName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2026-07-13 00:26:59\",\"usableColumn\":false},{\"capJavaField\":\"VendorAddress\",\"columnComment\":\"厂商地址\",\"columnId\":26,\"columnName\":\"vendor_address\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:25:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:27:38',34),(123,'代码生成',2,'cn.tf.vms.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/vms_vendor','127.0.0.1','内网IP','{}',NULL,1,'同步数据失败，原表结构不存在','2026-07-13 00:28:32',12),(124,'代码生成',3,'cn.tf.vms.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/3','127.0.0.1','内网IP','[3] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:29:43',9),(125,'创建表',0,'cn.tf.vms.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"tplWebType\":\"element-ui\",\"sql\":\"CREATE TABLE IF NOT EXISTS vms_vendor (\\n    oid BIGINT AUTO_INCREMENT PRIMARY KEY,\\n    vendor_id VARCHAR(32) NOT NULL COMMENT \'厂商ID\',\\n    vendor_name VARCHAR(200) NOT NULL COMMENT \'厂商名称\',\\n    vendor_address VARCHAR(500) COMMENT \'厂商地址\',\\n    contact_name VARCHAR(100) COMMENT \'联系人姓名\',\\n    contact_phone VARCHAR(20) COMMENT \'联系人电话\',\\n    contact_id_card VARCHAR(20) COMMENT \'联系人身份证号\',\\n    bank_account VARCHAR(50) COMMENT \'收款账号\',\\n    bank_name VARCHAR(200) COMMENT \'开户行\',\\n    create_by varchar(64) DEFAULT \'\' COMMENT \'创建者\',\\n  create_time datetime DEFAULT NULL COMMENT \'创建时间\',\\n  update_by varchar(64) DEFAULT \'\' COMMENT \'更新者\',\\n  update_time datetime DEFAULT NULL COMMENT \'更新时间\',\\n  remark varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  status char(1) DEFAULT \'0\' COMMENT \'厂商状态（0正常 1停用）\',\\n    UNIQUE KEY uk_vendor_id (vendor_id)\\n) COMMENT=\'厂商管理表\';\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:29:52',59),(126,'代码生成',2,'cn.tf.vms.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"vendor\",\"className\":\"VmsVendor\",\"columns\":[{\"capJavaField\":\"Oid\",\"columnId\":34,\"columnName\":\"oid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:29:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"oid\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VendorId\",\"columnComment\":\"厂商ID\",\"columnId\":35,\"columnName\":\"vendor_id\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:29:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vendorId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VendorName\",\"columnComment\":\"厂商名称\",\"columnId\":36,\"columnName\":\"vendor_name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:29:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vendorName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VendorAddress\",\"columnComment\":\"厂商地址\",\"columnId\":37,\"columnName\":\"vendor_address\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:29:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaF','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:35:20',31),(127,'代码生成',2,'cn.tf.vms.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"vendor\",\"className\":\"VmsVendor\",\"columns\":[{\"capJavaField\":\"Oid\",\"columnId\":34,\"columnName\":\"oid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:29:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"oid\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-07-13 00:35:20\",\"usableColumn\":false},{\"capJavaField\":\"VendorId\",\"columnComment\":\"厂商ID\",\"columnId\":35,\"columnName\":\"vendor_id\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:29:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vendorId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-07-13 00:35:20\",\"usableColumn\":false},{\"capJavaField\":\"VendorName\",\"columnComment\":\"厂商名称\",\"columnId\":36,\"columnName\":\"vendor_name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:29:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"vendorName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-07-13 00:35:20\",\"usableColumn\":false},{\"capJavaField\":\"VendorAddress\",\"columnComment\":\"厂商地址\",\"columnId\":37,\"columnName\":\"vendor_address\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 00:29:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:35:45',105),(128,'代码生成',8,'cn.tf.vms.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"vms_vendor\"}',NULL,0,NULL,'2026-07-13 00:35:48',136),(129,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/vendor/index\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"厂商管理\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"user\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"新增菜单\'厂商管理\'失败，路由名称或地址已存在\",\"code\":500}',0,NULL,'2026-07-13 00:54:29',17),(130,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/vendor/index\",\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"厂商管理\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"vendor\",\"perms\":\"system:vendor:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:56:06',12),(131,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"厂商查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":108,\"perms\":\"system:vendor:query\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:57:54',9),(132,'菜单管理',3,'cn.tf.vms.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2001','127.0.0.1','内网IP','2001 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:58:53',11),(133,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"厂商查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"perms\":\"system:vendor:query\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 00:59:19',7),(134,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"厂商新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"perms\":\"system:vendor:add\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 01:00:03',8),(135,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"厂商新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"perms\":\"system:vendor:add\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 01:01:46',8),(136,'菜单管理',3,'cn.tf.vms.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2003','127.0.0.1','内网IP','2003 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 01:01:53',5),(137,'厂商管理',1,'cn.tf.vms.web.controller.vendor.VmsVendorController.add()','POST',1,'admin','研发部门','/system/vendor','127.0.0.1','内网IP','{\"contactIdCard\":\"511523199207260632\",\"contactName\":\"联系人1\",\"contactPhone\":\"1388888888\",\"createTime\":\"2026-07-13 01:05:30\",\"oid\":1,\"params\":{},\"vendorAddress\":\"成都市锦江区东大街下东大街258号\",\"vendorId\":\"1\",\"vendorName\":\"厂商1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 01:05:30',17),(138,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"厂商修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"perms\":\"system:vendor:edit\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 11:17:51',25),(139,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"厂商导出\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"perms\":\"system:vendor:export\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 11:18:50',9),(140,'创建表',0,'cn.tf.vms.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"tplWebType\":\"element-ui\",\"sql\":\"REATE TABLE IF NOT EXISTS vms_voucher_template (\\n    oid BIGINT AUTO_INCREMENT PRIMARY KEY,\\n    template_id VARCHAR(32) NOT NULL COMMENT \'模版ID\',\\n    template_name VARCHAR(200) NOT NULL COMMENT \'模版名称\',\\n    template_code VARCHAR(100) COMMENT \'模版编号\',\\n    template_type VARCHAR(50) COMMENT \'模版类型\',\\n    category VARCHAR(50) COMMENT \'凭证类别: 一般/重空\',\\n    price DECIMAL(12,2) COMMENT \'单价\',\\n    spec VARCHAR(100) COMMENT \'规格\',\\n    unit VARCHAR(20) COMMENT \'单位\',\\n    tax_rate DECIMAL(5,2) COMMENT \'税率%\',\\n    vendor_id VARCHAR(32) COMMENT \'厂商ID\',\\n    manage_org VARCHAR(200) COMMENT \'管理机构\',\\n    manage_person VARCHAR(100) COMMENT \'管理人\',\\n    manage_phone VARCHAR(20) COMMENT \'管理人联系方式\',\\n    version VARCHAR(20) COMMENT \'版本\',\\n    fsip_url VARCHAR(500) COMMENT \'模版fsip地址\',\\n    create_by varchar(64) DEFAULT \'\' COMMENT \'创建者\',\\n  create_time datetime DEFAULT NULL COMMENT \'创建时间\',\\n  update_by varchar(64) DEFAULT \'\' COMMENT \'更新者\',\\n  update_time datetime DEFAULT NULL COMMENT \'更新时间\',\\n  remark varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  status char(1) DEFAULT \'0\' COMMENT \'凭证模版状态（0正常 1停用）\',\\n    UNIQUE KEY uk_template_id (template_id)\\n) COMMENT=\'凭证模版表\';\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2026-07-13 11:45:39',17),(141,'创建表',0,'cn.tf.vms.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"tplWebType\":\"element-ui\",\"sql\":\"REATE TABLE IF NOT EXISTS vms_voucher_template (\\n    oid BIGINT AUTO_INCREMENT PRIMARY KEY,\\n    template_id VARCHAR(32) NOT NULL COMMENT \'模版ID\',\\n    template_name VARCHAR(200) NOT NULL COMMENT \'模版名称\',\\n    template_code VARCHAR(100) COMMENT \'模版编号\',\\n    template_type VARCHAR(50) COMMENT \'模版类型\',\\n    category VARCHAR(50) COMMENT \'凭证类别: 一般/重空\',\\n    price DECIMAL(12,2) COMMENT \'单价\',\\n    spec VARCHAR(100) COMMENT \'规格\',\\n    unit VARCHAR(20) COMMENT \'单位\',\\n    tax_rate DECIMAL(5,2) COMMENT \'税率%\',\\n    vendor_id VARCHAR(32) COMMENT \'厂商ID\',\\n    manage_org VARCHAR(200) COMMENT \'管理机构\',\\n    manage_person VARCHAR(100) COMMENT \'管理人\',\\n    manage_phone VARCHAR(20) COMMENT \'管理人联系方式\',\\n    version VARCHAR(20) COMMENT \'版本\',\\n    fsip_url VARCHAR(500) COMMENT \'模版fsip地址\',\\n    create_by varchar(64) DEFAULT \'\' COMMENT \'创建者\',\\n  create_time datetime DEFAULT NULL COMMENT \'创建时间\',\\n  update_by varchar(64) DEFAULT \'\' COMMENT \'更新者\',\\n  update_time datetime DEFAULT NULL COMMENT \'更新时间\',\\n  remark varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  status char(1) DEFAULT \'0\' COMMENT \'凭证模版状态（0正常 1停用）\',\\n    UNIQUE KEY uk_template_id (template_id)\\n) COMMENT=\'凭证模版表\';\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2026-07-13 11:47:36',3),(142,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"凭证订购\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"voucher\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 14:26:29',18),(143,'创建表',0,'cn.tf.vms.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"tplWebType\":\"element-ui\",\"sql\":\"REATE TABLE IF NOT EXISTS vms_voucher_template (\\n    oid BIGINT AUTO_INCREMENT PRIMARY KEY,\\n    template_id VARCHAR(32) NOT NULL COMMENT \'模版ID\',\\n    template_name VARCHAR(200) NOT NULL COMMENT \'模版名称\',\\n    template_code VARCHAR(100) COMMENT \'模版编号\',\\n    template_type VARCHAR(50) COMMENT \'模版类型\',\\n    category VARCHAR(50) COMMENT \'凭证类别: 一般/重空\',\\n    price DECIMAL(12,2) COMMENT \'单价\',\\n    spec VARCHAR(100) COMMENT \'规格\',\\n    unit VARCHAR(20) COMMENT \'单位\',\\n    tax_rate DECIMAL(5,2) COMMENT \'税率%\',\\n    vendor_id VARCHAR(32) COMMENT \'厂商ID\',\\n    manage_org VARCHAR(200) COMMENT \'管理机构\',\\n    manage_person VARCHAR(100) COMMENT \'管理人\',\\n    manage_phone VARCHAR(20) COMMENT \'管理人联系方式\',\\n    version VARCHAR(20) COMMENT \'版本\',\\n    fsip_url VARCHAR(500) COMMENT \'模版fsip地址\',\\n    create_by varchar(64) DEFAULT \'\' COMMENT \'创建者\',\\n  create_time datetime DEFAULT NULL COMMENT \'创建时间\',\\n  update_by varchar(64) DEFAULT \'\' COMMENT \'更新者\',\\n  update_time datetime DEFAULT NULL COMMENT \'更新时间\',\\n  remark varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  status char(1) DEFAULT \'0\' COMMENT \'凭证模版状态（0正常 1停用）\',\\n    UNIQUE KEY uk_template_id (template_id)\\n) COMMENT=\'凭证模版表\';\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2026-07-13 17:04:00',34),(144,'创建表',0,'cn.tf.vms.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"tplWebType\":\"element-ui\",\"sql\":\"CREATE TABLE IF NOT EXISTS vms_voucher_template (\\n    oid BIGINT AUTO_INCREMENT PRIMARY KEY,\\n    template_id VARCHAR(32) NOT NULL COMMENT \'模版ID\',\\n    template_name VARCHAR(200) NOT NULL COMMENT \'模版名称\',\\n    template_code VARCHAR(100) COMMENT \'模版编号\',\\n    template_type VARCHAR(50) COMMENT \'模版类型\',\\n    category VARCHAR(50) COMMENT \'凭证类别: 一般/重空\',\\n    price DECIMAL(12,2) DEFAULT 0.00 COMMENT \'单价\',\\n    spec VARCHAR(100) COMMENT \'规格\',\\n    unit VARCHAR(20) COMMENT \'单位\',\\n    tax_rate DECIMAL(5,2) DEFAULT 0.00 COMMENT \'税率%\',\\n    vendor_id VARCHAR(32) COMMENT \'厂商ID\',\\n    manage_org VARCHAR(200) COMMENT \'管理机构\',\\n    manage_person VARCHAR(100) COMMENT \'管理人\',\\n    manage_phone VARCHAR(20) COMMENT \'管理人联系方式\',\\n    version VARCHAR(20) COMMENT \'版本\',\\n    fsip_url VARCHAR(500) COMMENT \'模版fsip地址\',\\n    create_by varchar(64) DEFAULT \'\' COMMENT \'创建者\',\\n  create_time datetime DEFAULT NULL COMMENT \'创建时间\',\\n  update_by varchar(64) DEFAULT \'\' COMMENT \'更新者\',\\n  update_time datetime DEFAULT NULL COMMENT \'更新时间\',\\n  remark varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  status char(1) DEFAULT \'0\' COMMENT \'状态（0正常 1停用）\'\\n    UNIQUE KEY uk_template_id (template_id)\\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=\'凭证模版表\';\"}','{\"msg\":\"创建表结构异常\",\"code\":500}',0,NULL,'2026-07-13 17:16:37',13),(145,'创建表',0,'cn.tf.vms.generator.controller.GenController.createTableSave()','POST',1,'admin','研发部门','/tool/gen/createTable','127.0.0.1','内网IP','{\"tplWebType\":\"element-ui\",\"sql\":\"CREATE TABLE IF NOT EXISTS vms_voucher_template (\\n    oid BIGINT AUTO_INCREMENT PRIMARY KEY,\\n    template_id VARCHAR(32) NOT NULL COMMENT \'模版ID\',\\n    template_name VARCHAR(200) NOT NULL COMMENT \'模版名称\',\\n    template_code VARCHAR(100) COMMENT \'模版编号\',\\n    template_type VARCHAR(50) COMMENT \'模版类型\',\\n    category VARCHAR(50) COMMENT \'凭证类别: 一般/重空\',\\n    price DECIMAL(12,2) DEFAULT 0.00 COMMENT \'单价\',\\n    spec VARCHAR(100) COMMENT \'规格\',\\n    unit VARCHAR(20) COMMENT \'单位\',\\n    tax_rate DECIMAL(5,2) DEFAULT 0.00 COMMENT \'税率%\',\\n    vendor_id VARCHAR(32) COMMENT \'厂商ID\',\\n    manage_org VARCHAR(200) COMMENT \'管理机构\',\\n    manage_person VARCHAR(100) COMMENT \'管理人\',\\n    manage_phone VARCHAR(20) COMMENT \'管理人联系方式\',\\n    version VARCHAR(20) COMMENT \'版本\',\\n    fsip_url VARCHAR(500) COMMENT \'模版fsip地址\',\\n    create_by varchar(64) DEFAULT \'\' COMMENT \'创建者\',\\n  create_time datetime DEFAULT NULL COMMENT \'创建时间\',\\n  update_by varchar(64) DEFAULT \'\' COMMENT \'更新者\',\\n  update_time datetime DEFAULT NULL COMMENT \'更新时间\',\\n  remark varchar(500) DEFAULT NULL COMMENT \'备注\',\\n  status char(1) DEFAULT \'0\' COMMENT \'状态（0正常 1停用）\',\\n    UNIQUE KEY uk_template_id (template_id)\\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=\'凭证模版表\';\\n\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 17:27:10',278),(146,'代码生成',2,'cn.tf.vms.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"template\",\"className\":\"VmsVoucherTemplate\",\"columns\":[{\"capJavaField\":\"Oid\",\"columnComment\":\"oid\",\"columnId\":49,\"columnName\":\"oid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 17:27:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"oid\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TemplateId\",\"columnComment\":\"模版ID\",\"columnId\":50,\"columnName\":\"template_id\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 17:27:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"templateId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TemplateName\",\"columnComment\":\"模版名称\",\"columnId\":51,\"columnName\":\"template_name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 17:27:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"templateName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TemplateCode\",\"columnComment\":\"模版编号\",\"columnId\":52,\"columnName\":\"template_code\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 17:27:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 17:35:29',97),(147,'代码生成',8,'cn.tf.vms.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"vms_vendor\"}',NULL,0,NULL,'2026-07-13 17:35:39',203),(148,'代码生成',8,'cn.tf.vms.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"vms_voucher_template\"}',NULL,0,NULL,'2026-07-13 17:36:19',180),(149,'代码生成',2,'cn.tf.vms.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"template\",\"className\":\"VmsVoucherTemplate\",\"columns\":[{\"capJavaField\":\"Oid\",\"columnComment\":\"oid\",\"columnId\":49,\"columnName\":\"oid\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 17:27:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"oid\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-07-13 17:35:29\",\"usableColumn\":false},{\"capJavaField\":\"TemplateId\",\"columnComment\":\"模版ID\",\"columnId\":50,\"columnName\":\"template_id\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 17:27:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"templateId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-07-13 17:35:29\",\"usableColumn\":false},{\"capJavaField\":\"TemplateName\",\"columnComment\":\"模版名称\",\"columnId\":51,\"columnName\":\"template_name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 17:27:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"templateName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2026-07-13 17:35:29\",\"usableColumn\":false},{\"capJavaField\":\"TemplateCode\",\"columnComment\":\"模版编号\",\"columnId\":52,\"columnName\":\"template_code\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-13 17:27:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 17:53:17',40),(150,'代码生成',8,'cn.tf.vms.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"vms_voucher_template\"}',NULL,0,NULL,'2026-07-13 17:53:20',194),(151,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/template/index\",\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"凭证模版管理\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":1,\"path\":\"template\",\"perms\":\"system:template:list\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-13 18:03:00',229),(152,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"perms\":\"system:template:query\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 10:21:08',16),(153,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"perms\":\"system:template:add\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 10:22:01',14),(154,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"perms\":\"system:template:edit\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 10:22:58',14),(155,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2008,\"perms\":\"system:template:export\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 10:23:35',12),(156,'凭证模版',1,'cn.tf.vms.web.controller.template.VmsVoucherTemplateController.add()','POST',1,'admin','研发部门','/system/template','127.0.0.1','内网IP','{\"category\":\"重空\",\"createTime\":\"2026-07-14 10:28:03\",\"fsipUrl\":\"/cms\",\"manageOrg\":\"0500000\",\"managePerson\":\"模版管理员\",\"managePhone\":\"13999999999\",\"oid\":1,\"params\":{},\"price\":10,\"spec\":\"张\",\"taxRate\":0,\"templateCode\":\"1\",\"templateId\":\"1\",\"templateName\":\"重空1\",\"unit\":\"A5\",\"vendorId\":\"1\",\"version\":\"1.0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 10:28:04',32),(157,'凭证模版',2,'cn.tf.vms.web.controller.template.VmsVoucherTemplateController.edit()','PUT',1,'admin','研发部门','/system/template','127.0.0.1','内网IP','{\"category\":\"重空\",\"createBy\":\"\",\"createTime\":\"2026-07-14 10:28:04\",\"fsipUrl\":\"/cms\",\"manageOrg\":\"0500000\",\"managePerson\":\"模版管理员\",\"managePhone\":\"13999999999\",\"oid\":1,\"params\":{},\"price\":10,\"spec\":\"A5\",\"status\":\"0\",\"taxRate\":0,\"templateCode\":\"1\",\"templateId\":\"1\",\"templateName\":\"重空1\",\"unit\":\"张\",\"updateBy\":\"\",\"updateTime\":\"2026-07-14 11:20:18\",\"vendorId\":\"1\",\"version\":\"1.0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 11:20:18',10),(158,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/order/batch/index\",\"createTime\":\"2026-07-14 17:17:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3001,\"menuName\":\"订购批次\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3000,\"path\":\"order\",\"perms\":\"order:batch:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 17:24:10',36),(159,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-07-14 17:17:28\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3000,\"menuName\":\"凭证订购管理\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"order\",\"perms\":\"order:batch:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"修改菜单\'凭证订购管理\'失败，路由名称或地址已存在\",\"code\":500}',0,NULL,'2026-07-14 17:29:06',8),(160,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-07-14 17:17:28\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3000,\"menuName\":\"凭证订购管理\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"order\",\"perms\":\"order:batch:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"修改菜单\'凭证订购管理\'失败，路由名称或地址已存在\",\"code\":500}',0,NULL,'2026-07-14 17:29:09',9),(161,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/order/batch/index\",\"createTime\":\"2026-07-14 17:17:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3001,\"menuName\":\"订购批次\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3000,\"path\":\"batch\",\"perms\":\"order:batch:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 17:29:47',14),(162,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-07-14 17:17:28\",\"icon\":\"order\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3000,\"menuName\":\"凭证订购管理\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"order\",\"perms\":\"order:batch:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 17:30:22',13),(163,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-07-14 17:17:28\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3000,\"menuName\":\"凭证订购管理\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"order\",\"perms\":\"order:batch:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 17:31:55',12),(164,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/order/batch/index\",\"createTime\":\"2026-07-14 17:17:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3001,\"menuName\":\"订购批次\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3000,\"path\":\"batch\",\"perms\":\"order:batch:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 17:32:53',11),(165,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"order/batch/index\",\"createTime\":\"2026-07-14 17:17:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3001,\"menuName\":\"订购批次\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3000,\"path\":\"batch\",\"perms\":\"order:batch:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 17:34:41',13),(166,'订购批次',1,'cn.tf.vms.web.controller.order.VmsBatchController.add()','POST',1,'admin','研发部门','/order/batch','127.0.0.1','内网IP','{\"batchName\":\"2026第三季度\",\"batchNo\":\"202603\",\"createTime\":\"2026-07-14 17:46:34\",\"createdBy\":\"admin\",\"endTime\":\"2026-07-30 00:00:00\",\"oid\":100,\"params\":{},\"startTime\":\"2026-07-14 17:36:11\",\"status\":\"采集中\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 17:46:34',245),(167,'批次锁定',2,'cn.tf.vms.web.controller.order.VmsBatchController.lock()','PUT',1,'admin','研发部门','/order/batch/lock','127.0.0.1','内网IP','{\"oid\":100,\"params\":{}} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 17:47:02',40),(168,'批次解锁',2,'cn.tf.vms.web.controller.order.VmsBatchController.unlock()','PUT',1,'admin','研发部门','/order/batch/unlock','127.0.0.1','内网IP','{\"oid\":100,\"params\":{}} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-14 17:47:09',15),(169,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-07-10 17:19:30\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 09:51:04',40),(170,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-07-10 17:19:30\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 09:51:44',15),(171,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-07-10 17:19:30\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 09:52:06',13),(172,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-07-10 17:19:30\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 09:52:11',10),(173,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2026-07-13 14:26:29\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"凭证订购\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"voucher\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 09:52:27',11),(174,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订购明细\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":3000,\"path\":\"batch_detail\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 10:35:18',30),(175,'菜单管理',2,'cn.tf.vms.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/order/batch/detail\",\"createTime\":\"2026-07-15 10:35:18\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3019,\"menuName\":\"订购明细\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":3000,\"path\":\"batch_detail\",\"perms\":\"order:detail:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 10:39:20',19),(176,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":3019,\"perms\":\"order:detail:query\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 10:41:35',14),(177,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":3019,\"perms\":\"order:detail:add\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 10:42:24',8),(178,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":3019,\"perms\":\"order:detail:edit\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 10:43:17',10),(179,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":3019,\"perms\":\"order:detail:remove\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 10:44:00',8),(180,'用户管理',4,'cn.tf.vms.web.controller.system.SysUserController.insertAuthRole()','PUT',1,'admin','研发部门','/system/user/authRole','127.0.0.1','内网IP','{\"roleIds\":\"100\",\"userId\":\"101\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 10:44:42',68),(181,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:01:51\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[3000,3001,3002,3011,3012,3013],\"params\":{},\"roleId\":100,\"roleKey\":\"subbranch_manager\",\"roleName\":\"支行管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 10:45:27',32),(182,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:01:51\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[3000,3001,3002,3011,3012,3013],\"params\":{},\"roleId\":100,\"roleKey\":\"subbranch_manager\",\"roleName\":\"支行管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 10:50:07',46),(183,'个人信息',2,'cn.tf.vms.web.controller.system.SysProfileController.updatePwd()','PUT',1,'001107','营业部','/system/user/profile/updatePwd','127.0.0.1','内网IP','{} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 10:50:51',265),(184,'用户管理',4,'cn.tf.vms.web.controller.system.SysUserController.insertAuthRole()','PUT',1,'admin','研发部门','/system/user/authRole','127.0.0.1','内网IP','{\"roleIds\":\"100\",\"userId\":\"100\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 11:10:32',12),(185,'角色管理',4,'cn.tf.vms.web.controller.system.SysRoleController.cancelAuthUser()','PUT',1,'admin','研发部门','/system/role/authUser/cancel','127.0.0.1','内网IP','{\"roleId\":100,\"userId\":101} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 11:11:07',23),(186,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin','研发部门','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:01:51\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"subbranch_manager\",\"roleName\":\"支行管理员\",\"roleSort\":0,\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 11:15:37',8),(187,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:01:51\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2008,3000,3001,2009,3002,3011,3012,3013],\"params\":{},\"roleId\":100,\"roleKey\":\"subbranch_manager\",\"roleName\":\"支行管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 11:20:56',20),(188,'批次明细',1,'cn.tf.vms.web.controller.order.VmsBatchController.addDetail()','POST',1,'001107','营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"202603\",\"createTime\":\"2026-07-15 11:46:28\",\"createdBy\":\"001107\",\"detailStatus\":\"正常\",\"oid\":100,\"params\":{},\"price\":10,\"quantity\":10,\"spec\":\"A5\",\"templateOid\":1,\"totalAmount\":100.00} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 11:46:28',31),(189,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:01:51\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2008,3000,3001,2009,3002,3011,3012,3013,3014],\"params\":{},\"roleId\":100,\"roleKey\":\"subbranch_manager\",\"roleName\":\"支行管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 11:47:30',18),(190,'批次明细',2,'cn.tf.vms.web.controller.order.VmsBatchController.editDetail()','PUT',1,'admin','研发部门','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"202603\",\"branchOrgId\":\"\",\"createTime\":\"2026-07-15 11:46:29\",\"createdBy\":\"001107\",\"detailStatus\":\"正常\",\"detailView\":\"\",\"headOrgId\":\"\",\"oid\":100,\"params\":{},\"price\":10,\"quantity\":10,\"spec\":\"A5\",\"subbranchOrgId\":\"\",\"templateOid\":1,\"totalAmount\":100,\"updateTime\":\"2026-07-15 14:32:01\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 14:32:01',10),(191,'批次明细',1,'cn.tf.vms.web.controller.order.VmsBatchController.addDetail()','POST',1,'admin','研发部门','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"202603\",\"createTime\":\"2026-07-15 14:35:48\",\"createdBy\":\"admin\",\"detailStatus\":\"正常\",\"oid\":101,\"params\":{},\"price\":10,\"quantity\":1,\"spec\":\"A5\",\"templateOid\":1,\"totalAmount\":10.00} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 14:35:48',9),(192,'批次明细',1,'cn.tf.vms.web.controller.order.VmsBatchController.addDetail()','POST',1,'001107','营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"202603\",\"createTime\":\"2026-07-15 14:37:36\",\"createdBy\":\"001107\",\"detailStatus\":\"正常\",\"oid\":102,\"params\":{},\"price\":10,\"quantity\":1,\"spec\":\"A5\",\"templateOid\":1,\"totalAmount\":10.00} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 14:37:36',8),(193,'批次明细',1,'cn.tf.vms.web.controller.order.VmsBatchController.addDetail()','POST',1,'001107','营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"202603\",\"createTime\":\"2026-07-15 14:50:34\",\"createdBy\":\"001107\",\"detailStatus\":\"正常\",\"oid\":103,\"params\":{},\"price\":10,\"quantity\":1,\"spec\":\"A5\",\"templateOid\":1,\"totalAmount\":10.00} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 14:50:34',9),(194,'批次明细',1,'cn.tf.vms.web.controller.order.VmsBatchController.addDetail()','POST',1,'001107','营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"202603\",\"createTime\":\"2026-07-15 14:51:15\",\"createdBy\":\"001107\",\"detailStatus\":\"正常\",\"oid\":104,\"params\":{},\"price\":10,\"quantity\":1,\"spec\":\"A5\",\"templateOid\":1,\"totalAmount\":10.00} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 14:51:15',5),(195,'字典类型',1,'cn.tf.vms.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"批次明细状态\",\"dictType\":\"batch_detail_status\",\"params\":{},\"remark\":\"批次明细表状态\\n\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:14:23',68),(196,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":1,\"dictType\":\"batch_detail_status\",\"dictValue\":\"normal\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:17:40',15),(197,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"退回\",\"dictSort\":2,\"dictType\":\"batch_detail_status\",\"dictValue\":\"reject\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:18:06',9),(198,'字典类型',1,'cn.tf.vms.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"批次状态\",\"dictType\":\"batch_status\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:18:44',10),(199,'字典类型',2,'cn.tf.vms.web.controller.system.SysDictTypeController.edit()','PUT',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:18:44\",\"dictId\":101,\"dictName\":\"批次状态\",\"dictType\":\"batch_status\",\"params\":{},\"remark\":\"批次状态\",\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:19:18',38),(200,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待分行管理员汇总\",\"dictSort\":1,\"dictType\":\"batch_status\",\"dictValue\":\"01\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:20:13',8),(201,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"分行管理员汇总处理中\",\"dictSort\":2,\"dictType\":\"batch_status\",\"dictValue\":\"02\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:20:42',10),(202,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:20:42\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"分行管理员汇总处理中\",\"dictSort\":2,\"dictType\":\"batch_status\",\"dictValue\":\"02\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:20:55',11),(203,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"分行复核员审核中\",\"dictSort\":3,\"dictType\":\"batch_status\",\"dictValue\":\"03\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:21:18',8),(204,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:21:18\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"分行复核员审核中\",\"dictSort\":3,\"dictType\":\"batch_status\",\"dictValue\":\"03\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:21:29',12),(205,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"分行复核员退回\",\"dictSort\":4,\"dictType\":\"batch_status\",\"dictValue\":\"04\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:21:56',12),(206,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待总行管理员汇总\",\"dictSort\":11,\"dictType\":\"batch_status\",\"dictValue\":\"11\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:22:46',12),(207,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:22:46\",\"default\":false,\"dictCode\":106,\"dictLabel\":\"待总行管理员汇总\",\"dictSort\":10,\"dictType\":\"batch_status\",\"dictValue\":\"10\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:23:32',10),(208,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:20:13\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"待分行管理员汇总\",\"dictSort\":0,\"dictType\":\"batch_status\",\"dictValue\":\"00\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:23:50',10),(209,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:20:42\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"分行管理员汇总处理中\",\"dictSort\":1,\"dictType\":\"batch_status\",\"dictValue\":\"01\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:23:59',9),(210,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:21:18\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"分行复核员审核中\",\"dictSort\":2,\"dictType\":\"batch_status\",\"dictValue\":\"02\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:24:07',8),(211,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:21:56\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"分行复核员退回\",\"dictSort\":3,\"dictType\":\"batch_status\",\"dictValue\":\"03\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:24:15',8),(212,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"总行管理员汇总处理中\",\"dictSort\":11,\"dictType\":\"batch_status\",\"dictValue\":\"11\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:24:33',10),(213,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"总行管理员退回\",\"dictSort\":12,\"dictType\":\"batch_status\",\"dictValue\":\"12\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:25:16',9),(214,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"总行复核员审核中\",\"dictSort\":13,\"dictType\":\"batch_status\",\"dictValue\":\"13\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:25:49',9),(215,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"总行复核员退回\",\"dictSort\":14,\"dictType\":\"batch_status\",\"dictValue\":\"14\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:26:09',9),(216,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"生成订单成功\",\"dictSort\":100,\"dictType\":\"batch_status\",\"dictValue\":\"100\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:26:46',9),(217,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:26:46\",\"default\":false,\"dictCode\":111,\"dictLabel\":\"生成订单成功\",\"dictSort\":100,\"dictType\":\"batch_status\",\"dictValue\":\"100\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:26:54',8),(218,'字典类型',1,'cn.tf.vms.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"机构等级\",\"dictType\":\"dept_level\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:34:52',24),(219,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"总行\",\"dictSort\":1,\"dictType\":\"dept_level\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:35:23',7),(220,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"分行\",\"dictSort\":2,\"dictType\":\"dept_level\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:35:34',9),(221,'字典数据',1,'cn.tf.vms.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"支行\",\"dictSort\":4,\"dictType\":\"dept_level\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:35:43',7),(222,'订购批次',1,'cn.tf.vms.web.controller.order.VmsBatchController.add()','POST',1,'admin','研发部门','/order/batch','127.0.0.1','内网IP','{\"batchName\":\"三批次01\",\"batchNo\":\"20260301\",\"createTime\":\"2026-07-15 16:40:52\",\"createdBy\":\"admin\",\"endTime\":\"2026-07-30 00:00:00\",\"oid\":101,\"params\":{},\"startTime\":\"2026-07-15 00:00:00\",\"status\":\"采集中\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:40:52',41),(223,'字典类型',1,'cn.tf.vms.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"批次机构状态\",\"dictType\":\"batch_branch_status\",\"params\":{},\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 16:46:32',12),(224,'订购批次',1,'cn.tf.vms.web.controller.order.VmsBatchController.add()','POST',1,'admin','研发部门','/order/batch','127.0.0.1','内网IP','{\"batchName\":\"3\",\"batchNo\":\"202603\",\"endTime\":\"2026-07-15 17:40:50\",\"params\":{},\"startTime\":\"2026-07-15 17:40:42\"} ','{\"msg\":\"仅总行管理员可新增批次\",\"code\":500}',0,NULL,'2026-07-15 17:40:54',24),(225,'订购批次',1,'cn.tf.vms.web.controller.order.VmsBatchController.add()','POST',1,'admin','研发部门','/order/batch','127.0.0.1','内网IP','{\"batchName\":\"3\",\"batchNo\":\"202603\",\"endTime\":\"2026-07-15 17:40:50\",\"params\":{},\"startTime\":\"2026-07-15 17:40:42\"} ','{\"msg\":\"仅总行管理员可新增批次\",\"code\":500}',0,NULL,'2026-07-15 17:40:59',3),(226,'订购批次',1,'cn.tf.vms.web.controller.order.VmsBatchController.add()','POST',1,'admin','研发部门','/order/batch','127.0.0.1','内网IP','{\"batchName\":\"3\",\"batchNo\":\"202603\",\"endTime\":\"2026-07-15 17:40:50\",\"params\":{},\"startTime\":\"2026-07-15 17:40:42\"} ','{\"msg\":\"仅总行管理员可新增批次\",\"code\":500}',0,NULL,'2026-07-15 17:41:03',4),(227,'订购批次',1,'cn.tf.vms.web.controller.order.VmsBatchController.add()','POST',1,'admin','研发部门','/order/batch','127.0.0.1','内网IP','{\"batchName\":\"3\",\"batchNo\":\"202603\",\"endTime\":\"2026-07-15 17:40:50\",\"params\":{},\"startTime\":\"2026-07-15 17:40:42\"} ','{\"msg\":\"仅总行管理员可新增批次\",\"code\":500}',0,NULL,'2026-07-15 17:41:07',4),(228,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:03:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[3000,3001,3002,3003,3004,3005,3006,3007,3008,3011,3013],\"params\":{},\"roleId\":102,\"roleKey\":\"head_manager\",\"roleName\":\"总行管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 17:42:26',44),(229,'用户管理',4,'cn.tf.vms.web.controller.system.SysUserController.insertAuthRole()','PUT',1,'admin','研发部门','/system/user/authRole','127.0.0.1','内网IP','{\"roleIds\":\"102\",\"userId\":\"102\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 17:43:06',14),(230,'订购批次',1,'cn.tf.vms.web.controller.order.VmsBatchController.add()','POST',1,'000002','四川天府银行','/order/batch','127.0.0.1','内网IP','{\"batchName\":\"03\",\"batchNo\":\"202603\",\"createTime\":\"2026-07-15 17:44:45\",\"createdBy\":\"000002\",\"endTime\":\"2026-07-30 00:00:00\",\"oid\":102,\"params\":{},\"startTime\":\"2026-07-15 17:44:26\",\"status\":\"10\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 17:44:45',17),(231,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:03:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,3000,3001,2000,2002,2004,2005,2006,2008,2009,2010,2011,2012,3002,3003,3004,3005,3006,3007,3008,3011,3013],\"params\":{},\"roleId\":102,\"roleKey\":\"head_manager\",\"roleName\":\"总行管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-15 17:45:26',25),(232,'批次明细',1,'cn.tf.vms.web.controller.order.VmsBatchController.addDetail()','POST',1,'001107','营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"202603\",\"detailStatus\":\"正常\",\"params\":{},\"price\":10,\"quantity\":10,\"spec\":\"A5\",\"subbranchOrgId\":\"0511001\",\"templateOid\":1,\"totalAmount\":100.00} ','{\"msg\":\"未找到机构状态记录\",\"code\":500}',0,NULL,'2026-07-15 17:47:19',73),(233,'批次明细',1,'cn.tf.vms.web.controller.order.VmsBatchController.addDetail()','POST',1,'001107','营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"202603\",\"detailStatus\":\"正常\",\"params\":{},\"price\":10,\"quantity\":10,\"spec\":\"A5\",\"subbranchOrgId\":\"0511001\",\"templateOid\":1,\"totalAmount\":100.00} ','{\"msg\":\"未找到机构状态记录\",\"code\":500}',0,NULL,'2026-07-15 18:01:12',42),(234,'批次明细',1,'cn.tf.vms.web.controller.order.VmsBatchController.addDetail()','POST',1,'001107','营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"202603\",\"detailStatus\":\"正常\",\"params\":{},\"price\":10,\"quantity\":10,\"spec\":\"A5\",\"subbranchOrgId\":\"0511001\",\"templateOid\":1,\"totalAmount\":100.00} ','{\"msg\":\"未找到机构状态记录\",\"code\":500}',0,NULL,'2026-07-15 18:09:45',263218),(235,'订购批次',1,'cn.tf.vms.web.controller.order.VmsBatchController.add()','POST',1,'000002','四川天府银行','/order/batch','127.0.0.1','内网IP','{\"batchName\":\"123\",\"batchNo\":\"123\",\"createTime\":\"2026-07-16 10:19:05\",\"createdBy\":\"000002\",\"endTime\":\"2026-07-17 00:00:00\",\"oid\":103,\"params\":{},\"startTime\":\"2026-07-15 00:00:00\",\"status\":\"10\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 10:20:32',781725),(236,'订购批次',1,'cn.tf.vms.web.controller.order.VmsBatchController.add()','POST',1,'000002','四川天府银行','/order/batch','127.0.0.1','内网IP','{\"batchName\":\"123\",\"batchNo\":\"123\",\"createTime\":\"2026-07-16 11:25:34\",\"createdBy\":\"000002\",\"endTime\":\"2026-07-28 00:00:00\",\"oid\":104,\"params\":{},\"startTime\":\"2026-07-16 00:00:00\",\"status\":\"10\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 11:25:34',107163),(237,'订购批次',1,'cn.tf.vms.web.controller.order.VmsBatchController.add()','POST',1,'000002','四川天府银行','/order/batch','127.0.0.1','内网IP','{\"batchName\":\"4\",\"batchNo\":\"4\",\"endTime\":\"2026-07-28 00:00:00\",\"params\":{},\"startTime\":\"2026-07-17 00:00:00\"} ',NULL,1,'\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'select dept_name from sys_dept where dept_id = d.parent_id) parent_name\n		from s\' at line 3\n### The error may exist in file [/Users/macbook/work/dcmt/vms-tf/vms-system/target/classes/mapper/system/SysDeptMapper.xml]\n### The error may involve cn.tf.vms.system.mapper.SysDeptMapper.selectDeptById-Inline\n### The error occurred while setting parameters\n### SQL: select d.dept_id, d.parent_id, d.ancestors, d.dept_name, d.order_num, d.leader, d.phone, d.email, d.status,             d.dept_level,d.dept_code            (select dept_name from sys_dept where dept_id = d.parent_id) parent_name   from sys_dept d   where d.dept_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'select dept_name from sys_dept where dept_id = d.parent_id) parent_name\n		from s\' at line 3\n; bad SQL grammar []','2026-07-16 11:26:38',11044),(238,'订购批次',1,'cn.tf.vms.web.controller.order.VmsBatchController.add()','POST',1,'000002','四川天府银行','/order/batch','127.0.0.1','内网IP','{\"batchName\":\"4\",\"batchNo\":\"4\",\"endTime\":\"2026-07-28 00:00:00\",\"params\":{},\"startTime\":\"2026-07-17 00:00:00\"} ',NULL,1,'\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'select dept_name from sys_dept where dept_id = d.parent_id) parent_name\n		from s\' at line 3\n### The error may exist in file [/Users/macbook/work/dcmt/vms-tf/vms-system/target/classes/mapper/system/SysDeptMapper.xml]\n### The error may involve cn.tf.vms.system.mapper.SysDeptMapper.selectDeptById-Inline\n### The error occurred while setting parameters\n### SQL: select d.dept_id, d.parent_id, d.ancestors, d.dept_name, d.order_num, d.leader, d.phone, d.email, d.status,             d.dept_level,d.dept_code            (select dept_name from sys_dept where dept_id = d.parent_id) parent_name   from sys_dept d   where d.dept_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'select dept_name from sys_dept where dept_id = d.parent_id) parent_name\n		from s\' at line 3\n; bad SQL grammar []','2026-07-16 11:27:24',15207),(239,'订购批次',1,'cn.tf.vms.web.controller.order.VmsBatchController.add()','POST',1,'000002','四川天府银行','/order/batch','127.0.0.1','内网IP','{\"batchName\":\"4\",\"batchNo\":\"4\",\"createTime\":\"2026-07-16 11:38:01\",\"createdBy\":\"000002\",\"endTime\":\"2026-07-28 00:00:00\",\"headOrgId\":\"0500000\",\"oid\":105,\"params\":{},\"startTime\":\"2026-07-17 00:00:00\",\"status\":\"10\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 11:38:02',494283),(240,'批次明细',1,'cn.tf.vms.web.controller.order.VmsBatchController.addDetail()','POST',1,'001107','营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"123\",\"branchOrgId\":\"0511000\",\"createTime\":\"2026-07-16 11:39:23\",\"createdBy\":\"001107\",\"detailStatus\":\"正常\",\"headOrgId\":\"0500000\",\"oid\":105,\"params\":{},\"price\":10,\"quantity\":1,\"spec\":\"A5\",\"subbranchOrgId\":\"0511001\",\"templateOid\":1,\"totalAmount\":10.00} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 11:39:23',4995),(241,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:02:27\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,3000,3001,2008,2009,2010,2011,2012,3002,3006,3007,3008,3011,3013],\"params\":{},\"roleId\":101,\"roleKey\":\"branch_manager\",\"roleName\":\"分行管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 11:43:49',45),(242,'用户管理',4,'cn.tf.vms.web.controller.system.SysUserController.insertAuthRole()','PUT',1,'admin','研发部门','/system/user/authRole','127.0.0.1','内网IP','{\"roleIds\":\"101\",\"userId\":\"101\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 11:44:14',14),(243,'菜单管理',1,'cn.tf.vms.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"明细详情查询\",\"menuType\":\"F\",\"orderNum\":18,\"params\":{},\"parentId\":3001,\"perms\":\"order:detail:query\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 15:31:45',48),(244,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:01:51\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2008,3000,3001,2009,3002,3011,3012,3013,3014,3024],\"params\":{},\"roleId\":100,\"roleKey\":\"subbranch_manager\",\"roleName\":\"支行管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 15:33:32',24),(245,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:02:27\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,3000,3001,2008,2009,2010,2011,2012,3002,3006,3007,3008,3011,3013,3024],\"params\":{},\"roleId\":101,\"roleKey\":\"branch_manager\",\"roleName\":\"分行管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 15:33:47',19),(246,'批次明细',2,'cn.tf.vms.web.controller.order.VmsBatchController.editDetail()','PUT',1,'001107','营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"123\",\"branchOrgId\":\"0511000\",\"createTime\":\"2026-07-16 11:39:23\",\"createdBy\":\"001107\",\"detailStatus\":\"正常\",\"detailView\":\"\",\"headOrgId\":\"0500000\",\"oid\":105,\"params\":{},\"price\":10,\"quantity\":2,\"spec\":\"A5\",\"subbranchOrgId\":\"0511001\",\"templateOid\":1,\"totalAmount\":20.00,\"updateTime\":\"2026-07-16 15:34:05\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 15:34:05',17),(247,'批次明细',2,'cn.tf.vms.web.controller.order.VmsBatchController.editDetail()','PUT',1,'000286','总行营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"123\",\"branchOrgId\":\"0511000\",\"createTime\":\"2026-07-16 11:39:23\",\"createdBy\":\"001107\",\"detailStatus\":\"正常\",\"detailView\":\"\",\"headOrgId\":\"0500000\",\"oid\":105,\"params\":{},\"price\":10,\"quantity\":2,\"spec\":\"A5\",\"subbranchOrgId\":\"0511001\",\"templateOid\":1,\"totalAmount\":20,\"updateTime\":\"2026-07-16 15:37:41\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 15:37:41',30161),(248,'批次明细',2,'cn.tf.vms.web.controller.order.VmsBatchController.editDetail()','PUT',1,'000286','总行营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"123\",\"branchOrgId\":\"0511000\",\"createTime\":\"2026-07-16 11:39:23\",\"createdBy\":\"001107\",\"detailStatus\":\"正常\",\"detailView\":\"\",\"headOrgId\":\"0500000\",\"oid\":105,\"params\":{},\"price\":10,\"quantity\":2,\"spec\":\"A5\",\"subbranchOrgId\":\"0511001\",\"templateOid\":1,\"totalAmount\":20,\"updateTime\":\"2026-07-16 15:50:41\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 15:50:41',12863),(249,'批次明细',2,'cn.tf.vms.web.controller.order.VmsBatchController.editDetail()','PUT',1,'000286','总行营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"123\",\"branchOrgId\":\"0511000\",\"createTime\":\"2026-07-16 11:39:23\",\"createdBy\":\"001107\",\"detailStatus\":\"正常\",\"detailView\":\"\",\"headOrgId\":\"0500000\",\"oid\":105,\"params\":{},\"price\":10,\"quantity\":2,\"spec\":\"A5\",\"subbranchOrgId\":\"0511001\",\"templateOid\":1,\"totalAmount\":20,\"updateTime\":\"2026-07-16 15:50:49\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 15:50:49',2668),(250,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:02:27\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,3000,3001,2008,2009,2010,2011,2012,3002,3006,3007,3008,3011,3013,3024,3025],\"params\":{},\"roleId\":101,\"roleKey\":\"branch_manager\",\"roleName\":\"分行管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 21:48:51',47),(251,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:03:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,3000,3001,2000,2002,2004,2005,2006,2008,2009,2010,2011,2012,3002,3003,3004,3005,3006,3007,3008,3011,3013,3025],\"params\":{},\"roleId\":102,\"roleKey\":\"head_manager\",\"roleName\":\"总行管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 21:49:02',23),(252,'角色管理',2,'cn.tf.vms.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2026-07-12 01:03:39\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[3000,3001,3002,3009,3010,3025],\"params\":{},\"roleId\":103,\"roleKey\":\"head_reviewer\",\"roleName\":\"总行复核员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 21:49:58',18),(253,'用户管理',4,'cn.tf.vms.web.controller.system.SysUserController.insertAuthRole()','PUT',1,'admin','研发部门','/system/user/authRole','127.0.0.1','内网IP','{\"roleIds\":\"103\",\"userId\":\"103\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-16 21:50:18',10),(254,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:17:40\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"正常\",\"dictSort\":1,\"dictType\":\"batch_detail_status\",\"dictValue\":\"00\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-17 11:47:50',21),(255,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:18:06\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"退回\",\"dictSort\":2,\"dictType\":\"batch_detail_status\",\"dictValue\":\"01\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-17 11:47:58',8),(256,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:22:46\",\"default\":false,\"dictCode\":115,\"dictLabel\":\"待总行管理员汇总\",\"dictSort\":10,\"dictType\":\"batch_status\",\"dictValue\":\"20\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-17 11:48:35',9),(257,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:24:33\",\"default\":false,\"dictCode\":116,\"dictLabel\":\"总行管理员汇总处理中\",\"dictSort\":11,\"dictType\":\"batch_status\",\"dictValue\":\"21\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-17 11:48:42',9),(258,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:25:49\",\"default\":false,\"dictCode\":118,\"dictLabel\":\"总行复核员审核中\",\"dictSort\":13,\"dictType\":\"batch_status\",\"dictValue\":\"23\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-17 11:48:53',8),(259,'字典数据',2,'cn.tf.vms.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2026-07-15 16:26:09\",\"default\":false,\"dictCode\":119,\"dictLabel\":\"总行复核员退回\",\"dictSort\":14,\"dictType\":\"batch_status\",\"dictValue\":\"24\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-17 11:49:02',8),(260,'批次明细',2,'cn.tf.vms.web.controller.order.VmsBatchController.editDetail()','PUT',1,'000286','总行营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"123\",\"branchOrgId\":\"0511000\",\"createTime\":\"2026-07-16 11:39:23\",\"createdBy\":\"001107\",\"detailStatus\":\"00\",\"detailView\":\"\",\"headOrgId\":\"0500000\",\"oid\":105,\"params\":{},\"price\":10,\"quantity\":3,\"spec\":\"A5\",\"subbranchOrgId\":\"0511001\",\"templateOid\":1,\"totalAmount\":30.00,\"updateTime\":\"2026-07-17 15:23:04\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-17 15:23:04',18820),(261,'批次明细',2,'cn.tf.vms.web.controller.order.VmsBatchController.editDetail()','PUT',1,'000286','总行营业部','/order/batch/detail','127.0.0.1','内网IP','{\"batchNo\":\"123\",\"branchOrgId\":\"0511000\",\"createTime\":\"2026-07-16 11:39:23\",\"createdBy\":\"001107\",\"detailStatus\":\"00\",\"detailView\":\"\",\"headOrgId\":\"0500000\",\"oid\":105,\"params\":{},\"price\":10,\"quantity\":3,\"spec\":\"A5\",\"subbranchOrgId\":\"0511001\",\"templateOid\":1,\"totalAmount\":30.00,\"updateTime\":\"2026-07-17 15:23:09\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-07-17 15:23:09',12);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2026-07-10 17:19:30','',NULL,''),(2,'se','项目经理',2,'0','admin','2026-07-10 17:19:30','',NULL,''),(3,'hr','人力资源',3,'0','admin','2026-07-10 17:19:30','',NULL,''),(4,'user','普通员工',4,'0','admin','2026-07-10 17:19:30','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2026-07-10 17:19:30','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2026-07-10 17:19:30','',NULL,'普通角色'),(100,'支行管理员','subbranch_manager',0,'1',1,1,'0','0','admin','2026-07-12 01:01:51','admin','2026-07-16 15:33:32',NULL),(101,'分行管理员','branch_manager',0,'1',1,1,'0','0','admin','2026-07-12 01:02:27','admin','2026-07-16 21:48:51',NULL),(102,'总行管理员','head_manager',0,'1',1,1,'0','0','admin','2026-07-12 01:03:02','admin','2026-07-16 21:49:02',NULL),(103,'总行复核员','head_reviewer',0,'1',1,1,'0','0','admin','2026-07-12 01:03:39','admin','2026-07-16 21:49:58',NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(100,1),(100,2008),(100,2009),(100,3000),(100,3001),(100,3002),(100,3011),(100,3012),(100,3013),(100,3014),(100,3024),(101,1),(101,2008),(101,2009),(101,2010),(101,2011),(101,2012),(101,3000),(101,3001),(101,3002),(101,3006),(101,3007),(101,3008),(101,3011),(101,3013),(101,3024),(101,3025),(102,1),(102,2000),(102,2002),(102,2004),(102,2005),(102,2006),(102,2008),(102,2009),(102,2010),(102,2011),(102,2012),(102,3000),(102,3001),(102,3002),(102,3003),(102,3004),(102,3005),(102,3006),(102,3007),(102,3008),(102,3011),(102,3013),(102,3025),(103,3000),(103,3001),(103,3002),(103,3009),(103,3010),(103,3025);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `user_code` varchar(64) DEFAULT '' COMMENT '用户代码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-07-20 09:37:52','2026-07-10 17:19:30','admin','2026-07-10 17:19:30','',NULL,'管理员',''),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-07-10 17:19:30','2026-07-10 17:19:30','admin','2026-07-10 17:19:30','',NULL,'测试员',''),(100,204,'001107','支行管理员','00','','','0','','$2a$10$dMZyrXAnkko6UweFA1lhZeK.mTcC4aB5nt8B2cqrgAzUO0jaT0e7y','0','0','127.0.0.1','2026-07-20 09:42:24','2026-07-15 10:50:51','admin','2026-07-12 00:58:12','admin','2026-07-15 10:50:51',NULL,'001107'),(101,202,'000286','分行管理员','00','','','0','','$2a$10$6nOBXzVJ85OtkrZZwk1ple/6cP8E1ZILY5wYJIakVEspDuzBm6BqW','0','0','127.0.0.1','2026-07-17 15:21:57',NULL,'admin','2026-07-12 01:21:02','',NULL,NULL,'000286'),(102,201,'000002','总行管理员','00','','','0','','$2a$10$rxcPXIPK0xaIiiHEJsjwp.wE1Gd51htoHW5OfEx2EMKhxSGlR1Jkm','0','0','127.0.0.1','2026-07-16 11:23:07',NULL,'admin','2026-07-12 01:21:26','',NULL,NULL,'000002'),(103,201,'000001','总行复核员','00','','','0','','$2a$10$TaUFZhegKYiimQB5z7bH2OOBPMHqZBANG6vUfhYQ9jxZqNWrl8GCy','0','0','',NULL,NULL,'admin','2026-07-12 01:24:40','',NULL,NULL,'000001');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,100),(101,101),(102,102),(103,103);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vms_batch`
--

DROP TABLE IF EXISTS `vms_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vms_batch` (
  `oid` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(32) NOT NULL COMMENT '批次号',
  `batch_name` varchar(200) DEFAULT '' COMMENT '批次名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `batch_desc` varchar(500) DEFAULT '' COMMENT '批次说明',
  `status` varchar(50) DEFAULT '采集中' COMMENT '批次状态: 采集中/总行管理员汇总中/总行复核员审核中/总行复核员退回/生成订单成功',
  `status_remark` varchar(500) DEFAULT NULL COMMENT '状态备注',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人ID',
  `version` int DEFAULT '1' COMMENT '乐观锁版本号',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `head_org_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '总行机构号',
  PRIMARY KEY (`oid`),
  UNIQUE KEY `uk_batch_no` (`batch_no`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订购批次表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vms_batch`
--

LOCK TABLES `vms_batch` WRITE;
/*!40000 ALTER TABLE `vms_batch` DISABLE KEYS */;
INSERT INTO `vms_batch` VALUES (104,'123','123','2026-07-16 00:00:00','2026-07-28 00:00:00','','20',NULL,'000002',1,'','2026-07-16 11:25:34','',NULL,NULL,''),(105,'4','4','2026-07-17 00:00:00','2026-07-28 00:00:00','','20',NULL,'000002',1,'','2026-07-16 11:38:02','',NULL,NULL,'0500000');
/*!40000 ALTER TABLE `vms_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vms_batch_detail`
--

DROP TABLE IF EXISTS `vms_batch_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vms_batch_detail` (
  `oid` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(32) DEFAULT '' COMMENT '批次号',
  `template_oid` bigint DEFAULT NULL COMMENT '凭证模版oid',
  `quantity` int DEFAULT '0' COMMENT '数量',
  `spec` varchar(100) DEFAULT '' COMMENT '规格',
  `price` decimal(12,2) DEFAULT '0.00' COMMENT '单价',
  `total_amount` decimal(14,2) DEFAULT '0.00' COMMENT '总价',
  `subbranch_org_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '支行号',
  `branch_org_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '分行号',
  `head_org_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '总行号',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人ID',
  `detail_view` varchar(20) DEFAULT '' COMMENT '明细视角: 支行/分行/总行',
  `detail_status` varchar(100) DEFAULT '正常' COMMENT '明细状态',
  `status_remark` varchar(500) DEFAULT NULL COMMENT '状态备注',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`oid`),
  KEY `idx_batch_no` (`batch_no`),
  KEY `idx_template_oid` (`template_oid`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='批次明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vms_batch_detail`
--

LOCK TABLES `vms_batch_detail` WRITE;
/*!40000 ALTER TABLE `vms_batch_detail` DISABLE KEYS */;
INSERT INTO `vms_batch_detail` VALUES (105,'123',1,3,'A5',10.00,30.00,'0511001','0511000','0500000','001107','','00',NULL,'','2026-07-16 11:39:23','','2026-07-17 15:23:09',NULL,'0');
/*!40000 ALTER TABLE `vms_batch_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vms_batch_order_segment`
--

DROP TABLE IF EXISTS `vms_batch_order_segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vms_batch_order_segment` (
  `oid` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(32) DEFAULT '' COMMENT '批次号',
  `template_oid` bigint DEFAULT NULL COMMENT '模版oid',
  `vendor_id` varchar(32) DEFAULT '' COMMENT '厂商ID',
  `print_start_no` varchar(100) DEFAULT '' COMMENT '印制开始号段',
  `print_end_no` varchar(100) DEFAULT '' COMMENT '印制结束号段',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`oid`),
  KEY `idx_batch_no` (`batch_no`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='批次订单模版号段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vms_batch_order_segment`
--

LOCK TABLES `vms_batch_order_segment` WRITE;
/*!40000 ALTER TABLE `vms_batch_order_segment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vms_batch_order_segment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vms_batch_org_status`
--

DROP TABLE IF EXISTS `vms_batch_org_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vms_batch_org_status` (
  `oid` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(32) DEFAULT '' COMMENT '批次号',
  `org_id` varchar(32) DEFAULT '' COMMENT '机构号',
  `detail_status` varchar(100) DEFAULT '' COMMENT '明细状态',
  `status_remark` varchar(500) DEFAULT NULL COMMENT '状态备注',
  `created_by` varchar(32) DEFAULT '' COMMENT '创建人ID',
  `version` int DEFAULT '1' COMMENT '乐观锁版本号',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oid`),
  KEY `idx_batch_no` (`batch_no`),
  KEY `idx_org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='批次机构状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vms_batch_org_status`
--

LOCK TABLES `vms_batch_org_status` WRITE;
/*!40000 ALTER TABLE `vms_batch_org_status` DISABLE KEYS */;
INSERT INTO `vms_batch_org_status` VALUES (100,'123','0511000','10',NULL,'000002',1,'','2026-07-16 11:25:34','',NULL,NULL),(101,'4','0511000','10',NULL,'000002',1,'','2026-07-16 11:38:02','',NULL,NULL);
/*!40000 ALTER TABLE `vms_batch_org_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vms_batch_vendor_order`
--

DROP TABLE IF EXISTS `vms_batch_vendor_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vms_batch_vendor_order` (
  `oid` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(32) DEFAULT '' COMMENT '批次号',
  `vendor_id` varchar(32) DEFAULT '' COMMENT '厂商ID',
  `order_fsip_url` varchar(500) DEFAULT '' COMMENT '订单模版fsip地址',
  `batch_status` varchar(50) DEFAULT '待发货' COMMENT '批次状态: 待发货/已完成',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oid`),
  KEY `idx_batch_no` (`batch_no`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='批次厂家订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vms_batch_vendor_order`
--

LOCK TABLES `vms_batch_vendor_order` WRITE;
/*!40000 ALTER TABLE `vms_batch_vendor_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `vms_batch_vendor_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vms_business_log`
--

DROP TABLE IF EXISTS `vms_business_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vms_business_log` (
  `oid` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(32) DEFAULT '' COMMENT '关联批次号',
  `order_oid` bigint DEFAULT NULL COMMENT '关联订单oid',
  `action_type` varchar(50) NOT NULL COMMENT '操作类型: CREATE_BATCH/SUBMIT/REJECT/AUDIT/CLAIM',
  `action_desc` varchar(500) DEFAULT '' COMMENT '操作描述',
  `operator_id` varchar(32) DEFAULT '' COMMENT '操作人ID',
  `operator_name` varchar(100) DEFAULT '' COMMENT '操作人姓名',
  `operator_org_id` varchar(32) DEFAULT '' COMMENT '操作机构',
  `detail_before` text COMMENT '操作前数据(JSON)',
  `detail_after` text COMMENT '操作后数据(JSON)',
  `version` int DEFAULT '1' COMMENT '乐观锁版本号',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`oid`),
  KEY `idx_batch_no` (`batch_no`),
  KEY `idx_action_type` (`action_type`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='业务操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vms_business_log`
--

LOCK TABLES `vms_business_log` WRITE;
/*!40000 ALTER TABLE `vms_business_log` DISABLE KEYS */;
INSERT INTO `vms_business_log` VALUES (100,'202603',NULL,'LOCK','锁定批次','admin','admin','',NULL,NULL,1,'','2026-07-14 17:47:02','',NULL),(101,'202603',NULL,'UNLOCK','解锁批次','admin','admin','',NULL,NULL,1,'','2026-07-14 17:47:10','',NULL);
/*!40000 ALTER TABLE `vms_business_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vms_order`
--

DROP TABLE IF EXISTS `vms_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vms_order` (
  `oid` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(32) DEFAULT '' COMMENT '批次号',
  `template_oid` bigint DEFAULT NULL COMMENT '凭证模版oid',
  `voucher_name` varchar(200) DEFAULT '' COMMENT '凭证名称',
  `vendor_oid` bigint DEFAULT NULL COMMENT '厂商oid',
  `vendor_name` varchar(200) DEFAULT '' COMMENT '厂商名称',
  `quantity` int DEFAULT '0' COMMENT '数量',
  `price` decimal(12,2) DEFAULT '0.00' COMMENT '单价',
  `spec` varchar(100) DEFAULT '' COMMENT '规格',
  `amount` decimal(14,2) DEFAULT '0.00' COMMENT '金额',
  `express_no` varchar(100) DEFAULT '' COMMENT '快递单号',
  `express_time` datetime DEFAULT NULL COMMENT '快递时间',
  `actual_claim_qty` int DEFAULT '0' COMMENT '实际申领数量',
  `claim_start_no` varchar(100) DEFAULT '' COMMENT '领用开始号段',
  `claim_end_no` varchar(100) DEFAULT '' COMMENT '领用结束号段',
  `claim_status` varchar(50) DEFAULT '待提交' COMMENT '申领状态: 待提交/审批中/申领成功/申领失败',
  `claim_remark` varchar(500) DEFAULT NULL COMMENT '申领备注',
  `attach_url` varchar(500) DEFAULT '' COMMENT '上传附件地址',
  `order_status` varchar(50) DEFAULT '待发货' COMMENT '订单状态',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oid`),
  KEY `idx_batch_no` (`batch_no`),
  KEY `idx_vendor_oid` (`vendor_oid`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vms_order`
--

LOCK TABLES `vms_order` WRITE;
/*!40000 ALTER TABLE `vms_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `vms_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vms_vendor`
--

DROP TABLE IF EXISTS `vms_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vms_vendor` (
  `oid` bigint NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(32) NOT NULL COMMENT '厂商ID',
  `vendor_name` varchar(200) NOT NULL COMMENT '厂商名称',
  `vendor_address` varchar(500) DEFAULT NULL COMMENT '厂商地址',
  `contact_name` varchar(100) DEFAULT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `contact_id_card` varchar(20) DEFAULT NULL COMMENT '联系人身份证号',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '收款账号',
  `bank_name` varchar(200) DEFAULT NULL COMMENT '开户行',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` char(1) DEFAULT '0' COMMENT '厂商状态（0正常 1停用）',
  PRIMARY KEY (`oid`),
  UNIQUE KEY `uk_vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='厂商管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vms_vendor`
--

LOCK TABLES `vms_vendor` WRITE;
/*!40000 ALTER TABLE `vms_vendor` DISABLE KEYS */;
INSERT INTO `vms_vendor` VALUES (1,'1','厂商1','成都市锦江区东大街下东大街258号','联系人1','1388888888','511523199207260632',NULL,NULL,'','2026-07-13 01:05:30','',NULL,NULL,'0');
/*!40000 ALTER TABLE `vms_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vms_voucher_template`
--

DROP TABLE IF EXISTS `vms_voucher_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vms_voucher_template` (
  `oid` bigint NOT NULL AUTO_INCREMENT,
  `template_id` varchar(32) NOT NULL COMMENT '模版ID',
  `template_name` varchar(200) NOT NULL COMMENT '模版名称',
  `template_code` varchar(100) DEFAULT NULL COMMENT '模版编号',
  `template_type` varchar(50) DEFAULT NULL COMMENT '模版类型',
  `category` varchar(50) DEFAULT NULL COMMENT '凭证类别: 一般/重空',
  `price` decimal(12,2) DEFAULT '0.00' COMMENT '单价',
  `spec` varchar(100) DEFAULT NULL COMMENT '规格',
  `unit` varchar(20) DEFAULT NULL COMMENT '单位',
  `tax_rate` decimal(5,2) DEFAULT '0.00' COMMENT '税率%',
  `vendor_id` varchar(32) DEFAULT NULL COMMENT '厂商ID',
  `manage_org` varchar(200) DEFAULT NULL COMMENT '管理机构',
  `manage_person` varchar(100) DEFAULT NULL COMMENT '管理人',
  `manage_phone` varchar(20) DEFAULT NULL COMMENT '管理人联系方式',
  `version` varchar(20) DEFAULT NULL COMMENT '版本',
  `fsip_url` varchar(500) DEFAULT NULL COMMENT '模版fsip地址',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  PRIMARY KEY (`oid`),
  UNIQUE KEY `uk_template_id` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='凭证模版表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vms_voucher_template`
--

LOCK TABLES `vms_voucher_template` WRITE;
/*!40000 ALTER TABLE `vms_voucher_template` DISABLE KEYS */;
INSERT INTO `vms_voucher_template` VALUES (1,'1','重空1','1',NULL,'重空',10.00,'A5','张',0.00,'1','0500000','模版管理员','13999999999','1.0','/cms','','2026-07-14 10:28:04','','2026-07-14 11:20:19',NULL,'0');
/*!40000 ALTER TABLE `vms_voucher_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vms-tf'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-20 18:03:28
