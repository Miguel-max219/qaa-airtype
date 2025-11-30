# 更新日志

所有重要的项目变更都会记录在这个文件中。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
版本号遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [未发布]

### 计划中的功能
- 支持多语言界面
- 添加输入历史导出功能
- 支持自定义快捷键
- 添加暗色主题

## [1.0.0] - 2025-11-30

### 新增
- 🎉 首次发布
- ✨ 基于 Flask 的 Web 服务器
- 📱 响应式手机端界面
- 🎤 支持语音输入（通过手机输入法）
- 📝 历史记录功能（保存最近 10 条）
- 🔄 实时文字同步到电脑
- 📲 二维码快速连接
- 🖥️ Tkinter GUI 界面
- 🎨 简洁美观的 UI 设计
- 💻 跨平台支持（Windows、macOS、Linux）
- 🔧 自定义端口配置
- 📦 PyInstaller 打包支持
- 🎯 自动生成应用图标
- 📚 完整的项目文档

### 技术栈
- Python 3.8+
- Flask 3.0+
- PyAutoGUI 0.9.54+
- Pyperclip 1.8.2+
- QRCode 7.4.2+
- Pillow 10.0+

### 文档
- README.md - 项目说明
- QUICKSTART.md - 快速开始指南
- CONTRIBUTING.md - 贡献指南
- LICENSE - MIT 开源协议

### 构建工具
- build.ps1 - Windows 构建脚本
- build.sh - Linux/macOS 构建脚本
- generate_icon.py - 图标生成脚本

---

## 版本说明

### 版本号格式：主版本号.次版本号.修订号

- **主版本号**：不兼容的 API 修改
- **次版本号**：向下兼容的功能性新增
- **修订号**：向下兼容的问题修正

### 变更类型

- `新增` - 新功能
- `变更` - 现有功能的变更
- `弃用` - 即将移除的功能
- `移除` - 已移除的功能
- `修复` - 问题修复
- `安全` - 安全相关的修复

---

[未发布]: https://github.com/QAA-Tools/qaa-airtype/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/QAA-Tools/qaa-airtype/releases/tag/v1.0.0
