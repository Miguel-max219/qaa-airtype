# 项目结构说明

本文档描述了 QAA AirType 项目的文件结构和各文件的作用。

## 📁 目录结构

```
qaa-airtype/
├── 📄 remote_server.py          # 主程序文件
├── 📄 generate_icon.py          # 图标生成脚本
├── 📄 build.ps1                 # Windows 构建脚本
├── 🖼️ demo.png                  # 演示截图
│
├── 📦 配置文件
│   ├── requirements.txt         # Python 依赖列表
│   ├── pyproject.toml          # 项目配置文件
│   ├── RemoteTyper.spec        # PyInstaller 配置（自动生成）
│   └── .gitignore              # Git 忽略文件
│
├── 📚 文档
│   ├── README.md               # 项目说明文档
│   ├── CONTRIBUTING.md         # 贡献指南
│   ├── CHANGELOG.md            # 更新日志
│   ├── PROJECT_STRUCTURE.md    # 项目结构说明（本文件）
│   └── LICENSE                 # MIT 开源协议
│
└── 📂 构建产物（自动生成，不提交到 Git）
    ├── build/                  # PyInstaller 构建临时文件
    ├── dist/                   # 可执行文件输出目录
    │   └── QAA-AirType.exe     # Windows 可执行文件
    ├── icon.ico                # 应用图标（Windows）
    └── icon.png                # 应用图标（PNG 格式）
```

## 📄 核心文件说明

### remote_server.py

**主程序文件**，包含所有核心功能：

- **Flask Web 服务器**：处理手机端的 HTTP 请求
- **Tkinter GUI**：电脑端的图形界面
- **输入模拟**：使用 PyAutoGUI 和 Pyperclip 实现文字输入
- **二维码生成**：使用 qrcode 库生成连接二维码
- **网络功能**：自动检测本机 IP 地址

**主要组件：**

```python
# Flask 路由
@app.route('/')              # 手机端主页
@app.route('/type')          # 接收输入请求

# 工具函数
get_host_ip()                # 获取本机 IP 地址

# GUI 类
class ServerApp:             # 主窗口类
    run_flask()              # 运行 Flask 服务器
    generate_qr()            # 生成二维码
    toggle_server()          # 启动服务器
```

### generate_icon.py

**图标生成脚本**，用于创建应用程序图标：

- 使用 Pillow 库绘制图标
- 生成 PNG 和 ICO 格式
- 包含键盘、手机和箭头元素
- 支持多种尺寸（16x16 到 256x256）

**使用方法：**
```bash
python generate_icon.py
```

### build.ps1

**Windows 构建脚本**，用于将 Python 脚本打包成可执行文件：

**功能：**
1. 检查并激活 Python 环境
2. 验证所有依赖是否已安装
3. 生成应用图标
4. 使用 PyInstaller 打包程序
5. 显示构建结果和文件大小

**使用方法：**
```bash
powershell -ExecutionPolicy Bypass -File build.ps1
```

## 📦 配置文件

### requirements.txt

**Python 依赖列表**：

```
flask>=3.0.0          # Web 框架
pyautogui>=0.9.54     # 自动化输入
pyperclip>=1.8.2      # 剪贴板操作
qrcode>=7.4.2         # 二维码生成
pillow>=10.0.0        # 图像处理
```

### pyproject.toml

**项目配置文件**，符合 PEP 518 标准：

- 项目元数据（名称、版本、描述）
- 依赖声明
- 构建系统配置
- 项目 URL

### .gitignore

**Git 忽略文件**，指定不提交到版本控制的文件：

- Python 缓存文件（`__pycache__`、`*.pyc`）
- 虚拟环境（`venv/`、`env/`）
- 构建产物（`build/`、`dist/`）
- IDE 配置文件（`.vscode/`、`.idea/`）
- 生成的图标文件（`icon.ico`、`icon.png`）

## 📚 文档文件

### README.md

**项目主文档**，包含：
- 项目简介和开发背景
- 主要特性
- 快速开始指南（普通用户和开发者）
- 使用说明和技巧
- 技术架构
- 常见问题
- 致谢信息

### CONTRIBUTING.md

**贡献指南**，包含：
- 如何报告问题
- 如何提交代码
- 代码规范
- 开发建议

### CHANGELOG.md

**更新日志**，记录：
- 版本历史
- 新增功能
- 问题修复
- 重要变更

### LICENSE

**开源协议**（MIT License）：
- 允许商业使用
- 允许修改和分发
- 需要保留版权声明

## 🏗️ 构建产物

### build/

**PyInstaller 构建临时目录**：
- 包含编译过程中的中间文件
- 不应提交到版本控制
- 可以安全删除

### dist/

**可执行文件输出目录**：
- `QAA-AirType.exe`（Windows）
- 这是最终的可分发文件

### icon.ico / icon.png

**应用图标文件**：
- 由 `generate_icon.py` 生成
- 用于可执行文件的图标
- 不提交到版本控制

## 🔄 工作流程

### 普通用户

1. 下载 `QAA-AirType.exe`
2. 双击运行
3. 扫码连接手机
4. 开始使用

### 开发者

#### 开发流程

1. **克隆项目**
   ```bash
   git clone https://github.com/QAA-Tools/qaa-airtype.git
   cd qaa-airtype
   ```

2. **安装依赖**
   ```bash
   pip install -r requirements.txt
   ```

3. **运行程序**
   ```bash
   python remote_server.py
   ```

4. **修改代码并测试**

5. **提交更改**
   ```bash
   git add .
   git commit -m "描述你的修改"
   git push
   ```

#### 发布流程

1. **更新版本号**
   - 修改 `pyproject.toml` 中的 `version`
   - 更新 `CHANGELOG.md`

2. **生成图标并构建**
   ```bash
   powershell -ExecutionPolicy Bypass -File build.ps1
   ```

3. **测试可执行文件**
   - 运行 `dist/QAA-AirType.exe`
   - 验证所有功能正常

4. **创建 Release**
   - 在 GitHub 上创建新的 Release
   - 上传 `QAA-AirType.exe`
   - 添加更新说明

## 📝 代码组织

### remote_server.py 代码结构

```python
# 1. 导入模块
import socket, threading, tkinter, flask, ...

# 2. Flask 应用配置
app = Flask(__name__)

# 3. HTML 模板
HTML_TEMPLATE = """..."""

# 4. 全局变量
IS_MAC = ...
PASTE_KEY = ...

# 5. Flask 路由
@app.route('/')
@app.route('/type')

# 6. 工具函数
def get_host_ip():

# 7. GUI 类
class ServerApp:

# 8. 主程序入口
if __name__ == '__main__':
```

## 🎯 最佳实践

1. **保持代码简洁**：每个文件专注于单一职责
2. **添加注释**：为复杂逻辑添加说明
3. **使用版本控制**：定期提交代码
4. **更新文档**：代码变更时同步更新文档
5. **测试功能**：修改后充分测试

## 📞 获取帮助

如果对项目结构有疑问：

- 查看 [README.md](README.md) 了解项目概况
- 查看 [CONTRIBUTING.md](CONTRIBUTING.md) 了解开发流程
- 提交 [Issue](https://github.com/QAA-Tools/qaa-airtype/issues) 询问

---

最后更新：2025-11-30
