# 📲 安装指南

<div align="center">
  <img src="https://img.shields.io/badge/支持系统-Android 7+-brightgreen?logo=android" alt="Android版本">
  <img src="https://img.shields.io/badge/Termux-0.118.1+-12B7F5" alt="Termux版本">
  <img src="https://img.shields.io/badge/安装耗时-3分钟-orange" alt="安装耗时">
</div>

## 🛠️ 环境准备

### 第一步：安装/更新Termux
> 请确保使用最新版Termux以获得最佳体验

<div align="center" style="margin:1rem 0;">

[![下载按钮](https://img.shields.io/badge/下载-Termux_0.118.1-12B7F5?style=for-the-badge&logo=android)](https://github.com/gaowan-u/Mobile-Dev-Setup/releases/download/Termux_0.118.1_arm64.apk/Termux_0.118.1.apk)
  
<small>📌 如果已安装旧版，直接覆盖安装即可</small>
</div>

### 第二步：基础配置
```bash
# 授予存储权限（首次安装必做）
termux-setup-storage
```

## 🚀 一键安装开发环境
复制以下命令到Termux终端执行：
```bash
curl -L https://github.com/gaowan-u/Mobile-Dev-Setup/releases/download/install.sh/install.sh | bash
```

<div class="admonition tip" style="background:#e6f7ff;padding:1rem;border-radius:8px;margin:1rem 0;">
<p style="margin:0;font-weight:bold;">💡 安装过程说明：</p>
<ul style="margin:0.5rem 0 0 1rem;">
<li>自动检测并安装Python/C++环境</li>
<li>静默配置清华镜像源加速</li>
<li>安装后自动添加环境变量</li>
</ul>
</div>

## 🛠️ 手动分步安装
<details>
<summary>点击查看分步方案</summary>

1. 更新软件源
```bash
pkg update -y
```

2. 安装基础工具
```bash
pkg install -y python clang make
```

3. 配置Python环境
```bash
pip install --user requests tqdm python-dotenv
```
</details>

## 📞 技术支持
遇到问题可通过以下方式联系：
- 📧 开发者邮箱: [gaowange2024@163.com](mailto:gaowange2024@163.com)
- 🐛 提交[GitHub Issue](https://github.com/gaowan-u/Mobile-Dev-Setup/issues)

<div align="center" style="margin-top:2rem;">
  <a href="#-安装指南">⬆️返回顶部</a> | 
  <a href="README.md">📚返回主文档</a>
</div>