# Planplus
![PPS](./assets/images/logo_w.png "logo")

## 概要
---
`Planplus`是一个以智慧任务为核心的计划/规划类软件，旨在为渴望自律的同学提供`智慧`、`自由`、`灵活`、`强大`的工具，助力自我实现。
### 详细信息：
|开发语言|开发框架|适用平台|最新版本|版本状态|
|:---:|:---:|:---:|:---:|:---:|
|Dart|Flutter|Android/ios|0.1.0 beta 1|Snapshot (21w03d)|
## 案例引入
---
## 设计说明
---
### 理论参考
- SMART 理论
- GTD 理论
>`Getting Things Done`

### 功能设计
> `"一核三翼"` 是指？

|核心特性|英文|缩写|
|:---:|:---:|:---:|
|智慧任务为核心|Smart-task Core|STC|
|面向自定义设计|DIY-oriented Design|DOD|
|计划与执行轨道|Plan-excuting Tracks|PET|
|基于问卷的评价|Query-based Evaluation|QBE|
||||
> `一核三翼` 详细说明：
- 智慧任务核心
- 自定义设计

- 计划执行轨道

- 基于问卷的评价机制

### UI设计
>基于 `Flutter` 框架，采用 `Material` 设计风格




## 待开发列表
---
>我们真诚地希望您能参加到我们的开发工作中。
### 近期 todo：
- 数据库访问层初步设计
- PET 初步开发
    - 弹性布局组件的开发
    - 相关数据结构的设计
- QBE 初步开发
    - 统计图的设计
    - 核心算法设计
### 闲余 todo：
- 成就系统

        引导并提示用户探索App的功能，帮助用户尽快熟悉相关操作

### 未来 todo：
>基于DIY交流的自律社区
## 待修复Bugs
---
### ListPage/GroupDetailPage：
- 超出边界的拖动会导致 `[item]` 异常消失
- 已分区的分组在拖动到未展开分组后面不会更新状态
- `[_duration]` 的控制逻辑尚未优化，有时会导致不必要的抖动动画
- 分区展开的淡入淡出效果疑似失效？
- 尚未添加对空列表的处理逻辑，稳定性不高


## 关于我们
[Github：Planplus](https://github.com/Kogler7/Planplus)
