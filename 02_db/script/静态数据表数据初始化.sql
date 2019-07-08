-- ----------------------------
-- 01-授权监管机构单位性质
-- ----------------------------
INSERT INTO config_supervision_org_nature(id,`value`,`order`) VALUES (uuid(),"审评机构","0"),(uuid(),'监督机构','1');

-- ----------------------------
-- 02-职称
-- ----------------------------
INSERT INTO config_title(id,`value`,`order`) VALUES (uuid(),"技术员","0"),(uuid(),'助理工程师','1'),(uuid(),'工程师','2'),(uuid(),'高级工程师','3'),(uuid(),'研究员级高工','4'),(uuid(),'研究实习员','5'),(uuid(),'助理研究员','6'),(uuid(),'副研究员','7'),(uuid(),'研究员','8'),(uuid(),'无','9');

-- ----------------------------
-- 03-政治面貌
-- ----------------------------
INSERT INTO config_political(id,`value`,`order`) VALUES (uuid(),"中共党员","0"),(uuid(),'中共预备党员','1'),(uuid(),'群众','2');

-- ----------------------------
-- 04-无损检验方法
-- ----------------------------
INSERT INTO config_check_method(id,`value`,`order`) VALUES (uuid(),"超声（UT）","0"),(uuid(),'射线（RT）','1'),(uuid(),'磁粉（MT）','2'),(uuid(),'渗透（PT）','3'),(uuid(),'涡流（ET）','4'),(uuid(),'目视（VT）','5'),(uuid(),'泄漏（LT）','6');

-- ----------------------------
-- 05-无损检验等级/无损检验级别
-- ----------------------------
INSERT INTO config_check_level(id,`value`,`order`) VALUES (uuid(),"Ⅰ（初级）","0"),(uuid(),'Ⅱ（中级）','1'),(uuid(),'Ⅲ（高级）','2');

-- ----------------------------
-- 06-研究堆操纵员执照种类/执照种类
-- ----------------------------
INSERT INTO config_operator_license_type(id,`value`,`order`) VALUES (uuid(),"操纵员","0"),(uuid(),'高级操纵员','1');

-- ----------------------------
-- 07-核设施监管类别
-- ----------------------------
INSERT INTO config_fac_supervison_category(id,`value`,`order`) VALUES (uuid(),"Ⅰ","0"),(uuid(),'Ⅱ','1'),(uuid(),'Ⅲ','2'),(uuid(),'Ⅳ','3');

-- ----------------------------
-- 08-核设施类型
-- ----------------------------
INSERT INTO config_fac_type(id,`value`,`order`) VALUES (uuid(),"生产设施","0"),(uuid(),'科研设施','1'),(uuid(),'废物管理','2');

-- ----------------------------
-- 09-核设施状态
-- ----------------------------
INSERT INTO config_fac_status(id,`value`,`order`) VALUES (uuid(),"待建","0"),(uuid(),'土建','1'),(uuid(),'建造','2'),(uuid(),'装（投）料调试','3'),(uuid(),'运行','4'),(uuid(),'停运','5'),(uuid(),'待退役','6'),(uuid(),'退役中','7'),(uuid(),'已退役','8');

-- ----------------------------
-- 10-审评状态
-- ----------------------------
INSERT INTO config_review_status(id,`value`,`order`) VALUES (uuid(),"已审评","0"),(uuid(),'审评中','1'),(uuid(),'未审评','2');

-- ----------------------------
-- 11-核设施许可情况
-- ----------------------------
INSERT INTO config_fac_permit_situation(id,`value`,`order`) VALUES (uuid(),"厂址选择审查意见书","0"),(uuid(),'土建施工批复','1'),(uuid(),'建造许可证','2'),(uuid(),'装（投）料调试批准书','3'),(uuid(),'运行许可证','4'),(uuid(),'退役批准书','5'),(uuid(),'否','6');

-- ----------------------------
-- 12-核设施定期报告类别
-- ----------------------------
INSERT INTO config_periodical_report_type(id,`value`,`order`) VALUES (uuid(),"月度报告","0"),(uuid(),'季度报告','1'),(uuid(),'年度报告','2');

-- ----------------------------
-- 13-铀尾矿(渣)库等别
-- ----------------------------
INSERT INTO config_umine_place_level(id,`value`,`order`) VALUES (uuid(),"一等","0"),(uuid(),'二等','1'),(uuid(),'三等','2'),(uuid(),'四等','3');

-- ----------------------------
-- 14-铀尾矿(渣) 库设施状态
-- ----------------------------
INSERT INTO config_umine_place_status(id,`value`,`order`) VALUES (uuid(),"建造","0"),(uuid(),'运行','1'),(uuid(),'待退役','2'),(uuid(),'退役中','3'),(uuid(),'已退役','4');

-- ----------------------------
-- 15-铀尾矿（渣）库许可情况
-- ----------------------------
INSERT INTO config_umine_place_permit_situation(id,`value`,`order`) VALUES (uuid(),"建造许可证","0"),(uuid(),'运行许可证','1'),(uuid(),'退役治理批准书','2'),(uuid(),'核安全验收意见','3'),(uuid(),'否','4');

-- ----------------------------
-- 16-铀矿山设施状态
-- ----------------------------
INSERT INTO config_umine_mountain_status(id,`value`,`order`) VALUES (uuid(),"运行","0"),(uuid(),'待退役','1'),(uuid(),'退役中','2'),(uuid(),'已退役','3'),(uuid(),'建造','4');

-- ----------------------------
-- 17-核设施许可阶段
-- ----------------------------
INSERT INTO config_fac_permit_stage(id,`value`,`order`) VALUES (uuid(),"厂址","0"),(uuid(),'土建','1'),(uuid(),'建造','2'),(uuid(),'装投料调试','3'),(uuid(),'运行','4'),(uuid(),'退役','5'),(uuid(),'监管类别','6'),(uuid(),'验收','7'),(uuid(),'其它','8');

-- ----------------------------
-- 18-核安全设备类别
-- ----------------------------
INSERT INTO config_equip_type(id,`value`,`order`) VALUES (uuid(),"机械设备","0"),(uuid(),'电气设备','1');

-- ----------------------------
-- 19-设备核安全级别
-- ----------------------------
INSERT INTO config_equip_level(id,`value`,`order`) VALUES (uuid(),"核安全 1 级","0"),(uuid(),'核安全 2 级','1'),(uuid(),'核安全 3 级','2'),(uuid(),'核安全重要','3'),(uuid(),'放化安全级','4'),(uuid(),'放化级','5'),(uuid(),'放化 2 级','6'),(uuid(),'1E 级','7');

-- ----------------------------
-- 20-核安全设备许可阶段
-- ----------------------------
INSERT INTO config_equip_permit_stage(id,`value`,`order`) VALUES (uuid(),"设计","0"),(uuid(),'制造','1'),(uuid(),'安装','2'),(uuid(),'无损检测','3'),(uuid(),'新增活动范围','4'),(uuid(),'其它','5');

-- ----------------------------
-- 21-铀尾矿(渣)库许可阶段
-- ----------------------------
INSERT INTO config_umine_place_permit_stage(id,`value`,`order`) VALUES (uuid(),"建造","0"),(uuid(),'运行','1'),(uuid(),'退役','2'),(uuid(),'验收','3');

-- ----------------------------
-- 22-核设施审评类型
-- ----------------------------
INSERT INTO config_fac_check_type(id,`value`,`order`) VALUES (uuid(),"新建审评","0"),(uuid(),'追溯性审评','1'),(uuid(),'定期安全审评','2'),(uuid(),'监管类别','3'),(uuid(),'其它','4');

-- ----------------------------
-- 23-核设施审评阶段
-- ----------------------------
INSERT INTO config_fac_check_stage(id,`value`,`order`) VALUES (uuid(),"厂址","0"),(uuid(),'土建','1'),(uuid(),'建造','2'),(uuid(),'装投料调试','3'),(uuid(),'运行','4'),(uuid(),'退役','5'),(uuid(),'无','6');

-- ----------------------------
-- 24-核安全设备审评阶段
-- ----------------------------
INSERT INTO config_equip_check_stage(id,`value`,`order`) VALUES (uuid(),"设计","0"),(uuid(),'制造','1'),(uuid(),'安装','2'),(uuid(),'无损检测','3'),(uuid(),'新增活动范围','4'),(uuid(),'其它','5');

-- ----------------------------
-- 25-铀尾矿（渣）库审评类型
-- ----------------------------
INSERT INTO config_umine_place_check_type(id,`value`,`order`) VALUES (uuid(),"新建审评","0"),(uuid(),'定期安全评价','1'),(uuid(),'验收审查','2'),(uuid(),'其它','3');

-- ----------------------------
-- 26-铀尾矿（渣）库审评阶段
-- ----------------------------
INSERT INTO config_umine_place_check_stage(id,`value`,`order`) VALUES (uuid(),"建造","0"),(uuid(),'运行','1'),(uuid(),'退役','2'),(uuid(),'无','3');

-- ----------------------------
-- 27-设施/设备/铀尾矿(渣)库审评文件类型
-- ----------------------------
INSERT INTO config_fac_check_file_type(id,`value`,`order`) VALUES (uuid(),"许可申请材料","0"),(uuid(),'委托函','1'),(uuid(),'审评实施方案','2'),(uuid(),'问题单','3'),(uuid(),'回答单','4'),(uuid(),'对话会记录','5'),(uuid(),'工作单','6'),(uuid(),'工作回答单','7'),(uuid(),'评价报告','8'),(uuid(),'审查意见','9'),(uuid(),'会议纪要','10'),(uuid(),'专家审查意见','11');

-- ----------------------------
-- 28-核活动类型
-- ----------------------------
INSERT INTO config_activity_type(id,`value`,`order`) VALUES (uuid(),"运输","0"),(uuid(),'研制活动','1'),(uuid(),'生产活动','2'),(uuid(),'试验活动','3'),(uuid(),'改造活动','4'),(uuid(),'运行限值调整','5'),(uuid(),'分析计算','6'),(uuid(),'监管分类','7'),(uuid(),'其他','8');

-- ----------------------------
-- 29-核活动及其他审评文件类型/核活动及其他审评信息文件类型表
-- ----------------------------
INSERT INTO config_activity_check_file_type(id,`value`,`order`) VALUES (uuid(),"许可申请材料","0"),(uuid(),'委托函','1'),(uuid(),'问题单','2'),(uuid(),'回答单','3'),(uuid(),'对话会记录','4'),(uuid(),'工作单','5'),(uuid(),'工作回答单','6'),(uuid(),'评价报告','7'),(uuid(),'审查意见','8');

-- ----------------------------
-- 30-铀矿山井下消防审评文件类型
-- ----------------------------
INSERT INTO config_umine_mountain_check_file_type(id,`value`,`order`) VALUES (uuid(),"备案申请材料","0"),(uuid(),'委托函','1'),(uuid(),'问题单','2'),(uuid(),'回答单','3'),(uuid(),'审查意见','4'),(uuid(),'验收申请材料','5'),(uuid(),'验收意见','6');

-- ----------------------------
-- 31-日常监督文件类型
-- ----------------------------
INSERT INTO config_monitor_daily_file_type(id,`value`,`order`) VALUES (uuid(),"专题报告","0"),(uuid(),'问题澄清单','1'),(uuid(),'观察意见','2'),(uuid(),'核安全要求通知单','3'),(uuid(),'监督日志其它','4');

-- ----------------------------
-- 32-监督检查类型
-- ----------------------------
INSERT INTO config_monitor_check_type(id,`value`,`order`) VALUES (uuid(),"例行综合检查","0"),(uuid(),'例行专项检查','1'),(uuid(),'非例行检查','2'),(uuid(),'安全大检查','3'),(uuid(),'日常监督专题检查','4');

-- ----------------------------
-- 33-监督检查文件类型
-- ----------------------------
INSERT INTO config_monitor_check_file_type(id,`value`,`order`) VALUES (uuid(),"检查通知","0"),(uuid(),'检查意见','1'),(uuid(),'检查方案','2'),(uuid(),'整改核查报告','3');

-- ----------------------------
-- 34-监督报告类型
-- ----------------------------
INSERT INTO config_monitor_report_type(id,`value`,`order`) VALUES (uuid(),"月报","0"),(uuid(),'季报','1'),(uuid(),'年报','2'),(uuid(),'工作报告','3'),(uuid(),'专项报告','4');

-- ----------------------------
-- 35-安全问题检查类型
-- ----------------------------
INSERT INTO config_security_check_type(id,`value`,`order`) VALUES (uuid(),"日常监督","0"),(uuid(),'例行检查','1'),(uuid(),'专项检查','2'),(uuid(),'非例行检查','3'),(uuid(),'安全大检查','4');

-- ----------------------------
-- 36-核设施安全问题类别
-- ----------------------------
INSERT INTO config_fac_security_question_type(id,`value`,`order`) VALUES (uuid(),"Ⅰ类","0"),(uuid(),'Ⅱ类','1'),(uuid(),'Ⅲ类','2'),(uuid(),'一般问题','3'),(uuid(),'重大不符合项','4'),(uuid(),'重大设计变更','5');

-- ----------------------------
-- 37-核设施安全问题性质
-- ----------------------------
INSERT INTO config_fac_security_question_nature(id,`value`,`order`) VALUES (uuid(),"核安全法规","0"),(uuid(),'安全制度','1'),(uuid(),'质量保证','2'),(uuid(),'辐射防护','3'),(uuid(),'放射性废物','4'),(uuid(),'应急','5'),(uuid(),'实物保护','6'),(uuid(),'消防','7'),(uuid(),'安全管理','8'),(uuid(),'防洪安全','9'),(uuid(),'其它','10');

-- ----------------------------
-- 38-安全问题整改状态
-- ----------------------------
INSERT INTO config_security_reform_status(id,`value`,`order`) VALUES (uuid(),"已整改","0"),(uuid(),'正在整改','1'),(uuid(),'部分整改','2'),(uuid(),'未整改','3');

-- ----------------------------
-- 39-设备安全问题类别
-- ----------------------------
INSERT INTO config_equip_security_question_type(id,`value`,`order`) VALUES (uuid(),"一般问题","0"),(uuid(),'重大不符合项','1'),(uuid(),'重大设计变更','2');

-- ----------------------------
-- 40-铀尾矿（渣）库安全问题类别
-- ----------------------------
INSERT INTO config_umine_place_security_question_type(id,`value`,`order`) VALUES (uuid(),"一般问题","0"),(uuid(),'重大不符合项','1'),(uuid(),'重大设计变更','2');

-- ----------------------------
-- 41-铀尾矿（渣）库安全问题性质
-- ----------------------------
INSERT INTO config_umine_place_security_question_nature(id,`value`,`order`) VALUES (uuid(),"核安全法规","0"),(uuid(),'安全制度','1'),(uuid(),'质量保证','2'),(uuid(),'辐射防护','3'),(uuid(),'放射性废物管理','4'),(uuid(),'应急','5'),(uuid(),'坝体稳定性','6'),(uuid(),'防洪安全','7'),(uuid(),'安全管理','8'),(uuid(),'其它','9');

-- ----------------------------
-- 42-事故事件类别
-- ----------------------------
INSERT INTO config_accident_type(id,`value`,`order`) VALUES (uuid(),"工业安全","0"),(uuid(),'核安全','1');


-- ----------------------------
-- 43-事故事件性质
-- ----------------------------
INSERT INTO config_accident_nature(id,`value`,`order`) VALUES (uuid(),"人因","0"),(uuid(),'老化','1'),(uuid(),'自然灾害','2');


-- ----------------------------
-- 44-学历
-- ----------------------------
INSERT INTO config_education(id,`value`,`order`) VALUES (uuid(),"大专","0"),(uuid(),'本科','1'),(uuid(),'硕士研究生','2'),(uuid(),'博士研究生','3');

-- ----------------------------
-- 45-学位
-- ----------------------------
INSERT INTO config_degree(id,`value`,`order`) VALUES (uuid(),"学士","0"),(uuid(),'硕士','1'),(uuid(),'博士','2');