# 贡献指南

感谢你对 QAA AirType 项目的关注！我们欢迎各种形式的贡献。

## 如何贡献

### 报告问题

如果你发现了 bug 或有功能建议：

1. 在 [Issues](https://github.com/QAA-Tools/qaa-airtype/issues) 页面搜索是否已有相关问题
2. 如果没有，创建一个新的 Issue
3. 清晰地描述问题或建议，包括：
   - 问题的详细描述
   - 复现步骤（如果是 bug）
   - 期望的行为
   - 实际的行为
   - 系统环境（操作系统、Python 版本等）

### 提交代码

1. **Fork 项目**
   ```bash
   # 在 GitHub 上 Fork 项目，然后克隆到本地
   git clone https://github.com/your-username/qaa-airtype.git
   cd qaa-airtype
   ```

2. **创建分支**
   ```bash
   git checkout -b feature/your-feature-name
   # 或
   git checkout -b fix/your-bug-fix
   ```

3. **设置开发环境**
   ```bash
   # 安装依赖
   pip install -r requirements.txt

   # 安装开发依赖
   pip install pyinstaller
   ```

4. **进行修改**
   - 保持代码风格一致
   - 添加必要的注释
   - 确保代码可以正常运行

5. **测试你的修改**
   ```bash
   # 运行程序测试
   python remote_server.py

   # 测试构建
   python generate_icon.py
   pyinstaller --onefile --windowed --name="QAA-AirType" --icon=icon.ico remote_server.py
   ```

6. **提交修改**
   ```bash
   git add .
   git commit -m "描述你的修改"
   git push origin feature/your-feature-name
   ```

7. **创建 Pull Request**
   - 在 GitHub 上创建 Pull Request
   - 清晰地描述你的修改
   - 关联相关的 Issue（如果有）

## 代码规范

### Python 代码风格

- 遵循 [PEP 8](https://www.python.org/dev/peps/pep-0008/) 规范
- 使用 4 个空格缩进
- 函数和类添加文档字符串
- 变量命名使用小写字母和下划线

### 提交信息规范

提交信息应该清晰明了：

```
类型: 简短描述

详细描述（可选）

关联 Issue: #123
```

类型可以是：
- `feat`: 新功能
- `fix`: 修复 bug
- `docs`: 文档更新
- `style`: 代码格式调整
- `refactor`: 代码重构
- `test`: 测试相关
- `chore`: 构建或辅助工具的变动

示例：
```
feat: 添加历史记录导出功能

添加了将历史记录导出为 JSON 文件的功能，
方便用户备份和迁移数据。

关联 Issue: #42
```

## 开发建议

### 项目结构

```
sync-input/
├── remote_server.py      # 主程序
├── generate_icon.py      # 图标生成脚本
├── build.ps1            # Windows 构建脚本
├── build.sh             # Linux/macOS 构建脚本
├── requirements.txt     # 依赖列表
├── pyproject.toml       # 项目配置
├── README.md            # 项目说明
├── CONTRIBUTING.md      # 贡献指南
├── LICENSE              # 开源协议
└── .gitignore          # Git 忽略文件
```

### 添加新功能

如果你想添加新功能：

1. 先创建 Issue 讨论功能的必要性和实现方案
2. 确保功能不会破坏现有功能
3. 保持代码简洁，避免过度设计
4. 更新 README.md 文档

### 修复 Bug

1. 在 Issue 中描述 bug 的详细信息
2. 创建分支进行修复
3. 添加注释说明修复的原因
4. 测试确保 bug 已修复且没有引入新问题

## 需要帮助？

如果你在贡献过程中遇到问题：

- 查看 [README.md](README.md) 了解项目基本信息
- 在 [Issues](https://github.com/QAA-Tools/qaa-airtype/issues) 中提问

## 行为准则

- 尊重所有贡献者
- 保持友好和专业的态度
- 接受建设性的批评
- 关注对项目最有利的事情

感谢你的贡献！🎉
