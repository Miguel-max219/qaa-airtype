# QAA AirType - 无线语音输入工具

<div align="center">

![Demo](demo.png)

**通过手机端语音输入实现电脑端远程输入的便捷工具**

[![Python Version](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows-blue.svg)](https://www.microsoft.com/windows)

</div>

## 📖 项目简介

QAA AirType 是一个轻量级的远程输入工具，让你可以通过手机端的语音输入（如豆包输入法）来实现电脑端的文字输入。

### 为什么开发这个项目？

在日常使用中，我们发现：
- 电脑端的语音识别质量普遍较差
- 电脑的麦克风设备往往不够理想
- 手机端的语音输入法（如豆包输入法）识别准确率更高
- 需要一个简单的方式将手机的语音输入同步到电脑

因此，这个项目应运而生，让你可以充分利用手机端优秀的语音识别能力，提升电脑端的输入效率。

> **注意**：本程序目前主要针对 Windows 系统开发和测试，在 macOS 和 Linux 上可能需要额外的配置或存在兼容性问题。

## ✨ 主要特性

- 🎤 **高质量语音输入**：利用手机端优秀的语音识别能力
- 📱 **扫码即用**：启动程序后扫描二维码即可连接
- 🔄 **实时同步**：手机输入的文字实时发送到电脑
- 📝 **历史记录**：保存最近10条输入记录，支持快速重发
- 🌐 **局域网连接**：无需互联网，局域网内即可使用
- 🎨 **简洁界面**：清爽的 UI 设计，操作简单直观

## 🚀 快速开始

### 普通用户（推荐）

1. 下载 `QAA-AirType.exe`
2. 双击运行程序
3. 点击"启动服务并生成二维码"按钮
4. 使用手机扫描二维码
5. 在手机网页中使用语音输入，点击发送即可

就这么简单！

### 开发者

如果你想从源码运行或修改程序：

#### 1. 安装依赖

```bash
# 克隆项目
git clone https://github.com/QAA-Tools/qaa-airtype.git
cd qaa-airtype

# 方式一：使用 pip（推荐）
pip install -e .

# 方式二：使用 uv（更快）
pip install uv
uv pip install -e .

# 方式三：传统方式
pip install -r requirements.txt
```

#### 2. 运行程序

```bash
python remote_server.py
```

#### 3. 编译可执行文件（可选）

如果你想自己编译：

```bash
# 使用提供的构建脚本（会自动生成图标）
powershell -ExecutionPolicy Bypass -File build.ps1

# 或手动编译
pip install pyinstaller
python generate_icon.py
pyinstaller --onefile --windowed --name="RemoteTyper" --icon=icon.ico remote_server.py
```

编译完成后，可执行文件位于 `dist/QAA-AirType.exe`

## 🎯 使用说明

### 基本流程

1. **启动服务** - 运行程序，点击"启动服务并生成二维码"
2. **连接手机** - 确保手机和电脑在同一 WiFi，扫描二维码
3. **开始输入** - 在手机网页使用语音输入，点击发送

### 使用技巧

- **语音输入**：推荐使用豆包输入法，识别准确率高
- **历史记录**：点击历史记录可快速重发
- **自定义端口**：如果默认端口 5000 被占用，可在启动前修改

## 🔧 技术架构

- **后端**：Flask Web 框架
- **前端**：原生 HTML/CSS/JavaScript
- **GUI**：Tkinter
- **输入模拟**：PyAutoGUI + Pyperclip
- **二维码生成**：qrcode + Pillow

## 📋 依赖项

```
flask>=3.0.0
pyautogui>=0.9.54
pyperclip>=1.8.2
qrcode>=7.4.2
pillow>=10.0.0
```

## 🛠️ 常见问题

**Q: 手机无法连接？**
- 确保手机和电脑在同一 WiFi
- 检查防火墙设置
- 尝试更换端口号

**Q: 文字无法输入？**
- 确保电脑上有文本框处于激活状态
- 点击你想输入的位置

**Q: 二维码无法生成？**
- 重新安装依赖：`pip install --upgrade qrcode pillow`

## 📁 项目结构

```
qaa-airtype/
├── remote_server.py          # 主程序
├── generate_icon.py          # 图标生成脚本
├── build.ps1                 # Windows 构建脚本
├── requirements.txt          # 依赖列表
├── pyproject.toml           # 项目配置
├── README.md                # 项目说明
├── CONTRIBUTING.md          # 贡献指南
├── CHANGELOG.md             # 更新日志
├── PROJECT_STRUCTURE.md     # 项目结构详细说明
└── LICENSE                  # MIT 开源协议
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！详见 [贡献指南](CONTRIBUTING.md)。

## 📄 开源协议

本项目采用 [MIT License](LICENSE) 开源协议。

## 🙏 致谢

- **Gemini**：感谢 Gemini 完成了核心程序的编写
- **Claude**：感谢 Claude 对这个项目进行了标准化的设计和优化

## 📮 联系方式

如有问题或建议：

- 提交 [Issue](https://github.com/QAA-Tools/qaa-airtype/issues)

---

<div align="center">
Made with ❤️ for better voice input experience
</div>
