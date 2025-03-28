# 📲 安装指南

<div align="center">
  <img src="https://img.shields.io/badge/支持系统-Termux 0.118+-12B7F5?logo=android" alt="Termux版本">
  <img src="https://img.shields.io/badge/脚本大小-8KB-success" alt="脚本体积">
  <img src="https://img.shields.io/badge/预计耗时-3分钟-orange" alt="安装耗时">
</div>

## 🛠️ 环境要求
- Android 10 及以上版本
- Termux 应用需更新至最新版
- 至少 500MB 可用存储空间
- 稳定的网络连接

## 🚀 一键安装方案

```bash
# 下载安装脚本（推荐清华镜像源）
curl -L https://cdn.example.com/install.sh -o install.sh --speed-limit 1 --speed-time 30
```
＃ 下载完成后运行
```bash
bash install.sh
```
## 🔍 分步安装说明

### 步骤 1：基础环境准备
```bash
# 更新软件源（国内用户建议先执行）
termux-change-repo

# 安装必要依赖
pkg update -y && pkg upgrade -y
```

### 步骤 2：执行自动化脚本
```bash
# 下载安装脚本（备用地址）
wget https://raw.githubusercontent.com/gaowan-u/Mobile-Dev-Setup/main/install.sh

# 可视化进度显示（可选）
bash install.sh | tee install.log
```

### 步骤 3：环境验证
```bash
# 测试Python环境
python3 -c "import requests; print('网络模块加载成功！')"

# 测试C++编译
echo '#include <iostream>\nint main(){std::cout << "Hello Mobile Dev!";}' > test.cpp
g++ test.cpp -o test
./test
```

## 🚨 常见问题解决

<details>
<summary>点击查看常见问题</summary>

### ❗ 网络连接超时
```bash
# 切换镜像源
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
```

### ❗ Python模块安装缓慢
```bash
# 配置清华PyPI镜像
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```

### ❗ 存储空间不足
```bash
# 清理缓存文件
pkg clean
rm -rf ~/.cache/pip
```

### ❗ 权限问题处理
```bash
# 修复$PATH配置
echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
source ~/.bashrc
```
</details>

## 🔄 环境升级
```bash
# 重新执行安装脚本即可自动更新
./install.sh --upgrade
```

## 📞 技术支持
遇到无法解决的问题时，可通过以下方式联系：
- 开发者邮箱: [gaowange2024@163.com](mailto:gaowange2024@163.com)
- 紧急问题: 提交 [GitHub Issue](https://github.com/gaowan-u/Mobile-Dev-Setup/issues)

<div align="center" style="margin-top:2rem;">
  <a href="#-安装指南">⬆️返回顶部</a> | 
  <a href="../README.md">📚返回主文档</a>
</div>