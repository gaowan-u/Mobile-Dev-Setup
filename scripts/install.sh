#!/data/data/com.termux/files/usr/bin/bash
# 自动检测并安装依赖
if ! command -v python3 &> /dev/null; then
    echo "安装Python..."
    pkg install python -y
fi

# 添加环境变量
echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc