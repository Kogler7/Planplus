import '../base.dart';

class KGroupBase {
  static List<GroupBase> taskGroups = [
    GroupBase(title: '垃圾箱', section: '_FIXED', iconRef: 1, members: [
      MemberBase(title: '已删除的任务会在这里', subTitle: '记得随时检查哦'),
    ]),
    GroupBase(title: '重要事项', section: '_FIXED', iconRef: 2, members: [
      MemberBase(title: '', subTitle: ''),
    ]),
    GroupBase(title: '我的关注', section: '_FIXED', iconRef: 3, members: [
      MemberBase(title: '', subTitle: ''),
    ]),
    GroupBase(title: '每日打卡', section: '', members: [
      MemberBase(title: '6：00早起', subTitle: '已坚持：30天'),
      MemberBase(title: '11：00睡觉', subTitle: '已坚持：24天'),
      MemberBase(title: '看书一小时', subTitle: '已坚持：14天'),
    ]),
    GroupBase(title: '子程序模仿示例', section: '', members: [
      MemberBase(title: '端午节', subTitle: '倒计时：16天；抽象任务；自动完成'),
      MemberBase(title: '每日单词打卡', subTitle: '每日重复；不晚于8:00；关联至：每月单词统计'),
      MemberBase(title: '今日番茄', subTitle: '应用模板：番茄任务；限时25min；触发锁机'),
      MemberBase(title: '今日减肥', subTitle: '每日重复；关联至：每年减肥计划'),
      MemberBase(title: '今日阅读', subTitle: '每日重复；关联至：每月读书计划'),
      MemberBase(title: '每日回顾', subTitle: '每日重复；关联问卷：每日三问'),
    ]),
    GroupBase(title: '成就清单', section: '新手礼物', members: [
      MemberBase(title: '坚持看书', subTitle: '期望值：1，次数不限'),
      MemberBase(title: '坚决完成任务', subTitle: '期望值：2，次数不限'),
    ]),
    GroupBase(title: '欲望清单', section: '新手礼物', members: [
      MemberBase(title: '追剧', subTitle: '累计期望：-3，单次累计：-1'),
      MemberBase(title: '熬夜', subTitle: '累计期望：-4，单次累计：-2'),
    ]),
    GroupBase(title: '每日锻炼', section: '坚持就是力量', members: [
      MemberBase(title: '仰卧起坐', subTitle: '达标量：一组30个，共3组'),
      MemberBase(title: '小跑', subTitle: '2km！'),
      MemberBase(title: '散步', subTitle: ''),
      MemberBase(title: '长跑', subTitle: '10公里大关！'),
      MemberBase(title: '引体向上', subTitle: '达标量：一组10个，共3组'),
      MemberBase(title: '俯卧撑', subTitle: '达标量：一组20个，共3组'),
      MemberBase(title: '举重', subTitle: ''),
    ]),
    GroupBase(title: '习惯养成', section: '坚持就是力量', members: [
      MemberBase(title: '坚持喝水', subTitle: '达标量：每天四次'),
    ]),
    GroupBase(title: '学期目标', section: '目标清单', members: [
      MemberBase(title: '绩点全A', subTitle: '绩点全A绩点全A绩点全A！！！'),
    ]),
    GroupBase(title: '月目标', section: '目标清单', members: [
      MemberBase(title: '三月', subTitle: ''),
      MemberBase(title: '四月', subTitle: ''),
      MemberBase(title: '五月', subTitle: ''),
      MemberBase(title: '六月', subTitle: ''),
    ]),
    GroupBase(title: '周目标', section: '目标清单', members: [
      MemberBase(title: '学习周', subTitle: ''),
      MemberBase(title: '数学强化', subTitle: '我爱数学！'),
      MemberBase(title: '考试周', subTitle: ''),
      MemberBase(title: '运动冲刺', subTitle: ''),
    ]),
    GroupBase(title: '100h任务', section: '目标清单', members: [
      MemberBase(title: '唱歌练习', subTitle: '已累计：10h'),
      MemberBase(title: '写手练习', subTitle: '已累计：14h'),
      MemberBase(title: '经济学报', subTitle: '已累计：4h'),
      MemberBase(title: '书法练习', subTitle: '已累计：30h'),
    ]),
    GroupBase(title: '课程', section: '学习例行', members: [
      MemberBase(title: '语文', subTitle: '周一上午第一节'),
      MemberBase(title: '高数', subTitle: '周二上午第二节'),
      MemberBase(title: '高代', subTitle: '周三上午第三节'),
      MemberBase(title: '大物', subTitle: '周四下午第一节'),
      MemberBase(title: '英语', subTitle: '周五下午第二节'),
      MemberBase(title: 'C语言', subTitle: '周六下午第三节'),
    ]),
    GroupBase(title: '研讨会', section: '学习例行', members: [
      MemberBase(title: '', subTitle: ''),
    ]),
    GroupBase(title: '下午茶', section: '学习例行', members: [
      MemberBase(title: '', subTitle: ''),
    ]),
    GroupBase(title: '番茄专注', section: '专注列表', members: [
      MemberBase(title: '25分钟番茄', subTitle: '每天不少于4个个'),
      MemberBase(title: '40分钟番茄', subTitle: '每天至少一个'),
      MemberBase(title: '90分钟番茄', subTitle: '酌量食用'),
      MemberBase(title: '180分钟番茄', subTitle: '每周要挑战一下自己'),
    ]),
    GroupBase(title: '试卷', section: '专注列表', members: [
      MemberBase(title: '语文试卷', subTitle: '已完成2/16套'),
      MemberBase(title: '数学试卷', subTitle: '已完成5/12套'),
      MemberBase(title: '英语试卷', subTitle: '已完成9/18套'),
      MemberBase(title: '理综试卷', subTitle: '已完成4/14套'),
    ]),
    GroupBase(title: '冥想', section: '专注列表', members: [
      MemberBase(title: '', subTitle: ''),
    ]),
    GroupBase(title: '发现更多', section: '……', members: [
      MemberBase(title: '', subTitle: ''),
    ]),
    GroupBase(title: '未来信箱', section: '', members: [
      MemberBase(title: '致18岁的自己', subTitle: '2021年2月17日'),
    ]),
    GroupBase(title: '待办列表', section: '', members: [
      MemberBase(title: '', subTitle: ''),
    ]),
  ];
  static List<GroupBase> modelGroups = [
    GroupBase(title: '垃圾箱', section: '_FIXED', iconRef: 1, members: [
      MemberBase(title: '', subTitle: ''),
    ]),
    GroupBase(title: '重要模板', section: '_FIXED', iconRef: 2, members: [
      MemberBase(title: '', subTitle: ''),
    ]),
    GroupBase(title: '每日打卡', section: '', members: []),
    GroupBase(title: '每日提醒', section: '自我提醒', members: []),
    GroupBase(title: '每日三问', section: '自我提醒', members: []),
    GroupBase(title: '100h任务模板', section: '目标清单', members: []),
  ];
  static List<GroupBase> queryGroups = [
    GroupBase(title: '垃圾箱', section: '_FIXED', iconRef: 1, members: []),
    GroupBase(title: '重要事项', section: '_FIXED', iconRef: 2, members: []),
    GroupBase(title: '我的关注', section: '_FIXED', iconRef: 3, members: []),
    GroupBase(title: '每日打卡', section: '', members: []),
    GroupBase(title: '成就清单', section: '给你准备的新手礼物', members: []),
    GroupBase(title: '欲望清单', section: '给你准备的新手礼物', members: []),
    GroupBase(title: '每日锻炼', section: '坚持就是力量', members: []),
    GroupBase(title: '习惯养成', section: '坚持就是力量', members: []),
    GroupBase(title: '每日提醒', section: '自我提醒', members: []),
    GroupBase(title: '每日三问', section: '自我提醒', members: []),
    GroupBase(title: '纪念时光', section: '自我提醒', members: []),
  ];
}
