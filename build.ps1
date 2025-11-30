# QAA AirType 构建脚本
# 用于将 Python 脚本打包成可执行文件

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  QAA AirType 构建脚本" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 激活 Conda 环境（如果使用 Conda）
if (Test-Path "$env:USERPROFILE\miniconda3\shell\condabin\conda-hook.ps1") {
    Write-Host "[1/4] 激活 Conda 环境..." -ForegroundColor Yellow
    . "$env:USERPROFILE\miniconda3\shell\condabin\conda-hook.ps1"
    conda activate "$env:USERPROFILE\miniconda3"
} else {
    Write-Host "[1/4] 跳过 Conda 环境激活（未找到 Conda）" -ForegroundColor Yellow
}

# 检查依赖
Write-Host "[2/4] 检查依赖..." -ForegroundColor Yellow
$dependencies = @("flask", "pyautogui", "pyperclip", "qrcode", "pillow", "pystray", "pyinstaller")
foreach ($dep in $dependencies) {
    $installed = python -c "import $dep" 2>$null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "  ✗ 缺少依赖: $dep" -ForegroundColor Red
        Write-Host "  正在安装 $dep..." -ForegroundColor Yellow
        pip install $dep
    } else {
        Write-Host "  ✓ $dep 已安装" -ForegroundColor Green
    }
}

# 生成图标
Write-Host "[3/4] 生成应用图标..." -ForegroundColor Yellow
if (Test-Path "src\generate_icon.py") {
    python src\generate_icon.py
    if (Test-Path "icon.ico") {
        Write-Host "  ✓ 图标生成成功" -ForegroundColor Green
    } else {
        Write-Host "  ✗ 图标生成失败" -ForegroundColor Red
    }
} else {
    Write-Host "  ⚠ 未找到 generate_icon.py，跳过图标生成" -ForegroundColor Yellow
}

# 构建可执行文件
Write-Host "[4/4] 开始构建可执行文件..." -ForegroundColor Yellow

# 检查是否存在图标文件
$iconParam = ""
if (Test-Path "icon.ico") {
    $iconParam = "--icon=icon.ico"
    Write-Host "  使用自定义图标: icon.ico" -ForegroundColor Green
}

# 执行 PyInstaller
$buildCommand = "pyinstaller --onefile --windowed --name=QAA-AirType $iconParam src\remote_server.py"
Write-Host "  执行命令: $buildCommand" -ForegroundColor Cyan
Invoke-Expression $buildCommand

# 检查构建结果
Write-Host ""
if (Test-Path "dist\QAA-AirType.exe") {
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ✓ 构建成功！" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "可执行文件位置: dist\QAA-AirType.exe" -ForegroundColor Cyan
    Write-Host ""

    # 显示文件大小
    $fileSize = (Get-Item "dist\QAA-AirType.exe").Length / 1MB
    Write-Host "文件大小: $([math]::Round($fileSize, 2)) MB" -ForegroundColor Cyan
} else {
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  ✗ 构建失败" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "请检查上方的错误信息" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "按任意键退出..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
