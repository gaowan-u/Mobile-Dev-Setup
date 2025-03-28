#!/data/data/com.termux/files/usr/bin/bash
# Termux 开发环境安装器 (清爽版)

set -e

# ==================== 颜色定义 ====================
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
WHITE="\033[0m"
BOLD="\033[1m"
RESET="\033[0m"

# ==================== 界面组件 ====================
function show_header() {
  clear
  echo -e "${CYAN}${BOLD}"
  echo "============================================"
  echo "   Termux 移动开发环境一键安装工具"
  echo "============================================"
  echo -e "${RESET}"
}

function show_step() {
  echo -e "${BLUE}${BOLD}➤ $1${RESET}"
}

function show_success() {
  echo -e "${GREEN}✓ $1${RESET}"
}

function show_warning() {
  echo -e "${YELLOW}⚠ $1${RESET}"
}

# ==================== 核心功能 ====================
function prepare_env() {
  show_step "1/4 正在准备安装环境"
  
  # 静默处理目录权限
  mkdir -p $PREFIX/tmp 2>/dev/null
  chmod 1777 $PREFIX/tmp 2>/dev/null
  
  # 完全静默更新
  echo -n "正在更新软件源..."
  if ! pkg update -y >/dev/null 2>&1; then
    echo
    show_warning "更新失败，正在切换镜像源..."
    sed -i 's@^\(deb.*\)$@#\1@' $PREFIX/etc/apt/sources.list
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main" >> $PREFIX/etc/apt/sources.list
    pkg update -y >/dev/null 2>&1 || {
      echo -e "${RED}✗ 更新失败，请手动执行：termux-change-repo${RESET}"
      exit 1
    }
  fi
  echo -e " ${GREEN}完成${RESET}"
}

function install_python() {
  show_step "2/4 正在配置Python环境"
  if ! command -v python3 &>/dev/null; then
    echo -n "正在安装Python..."
    pkg install -y python clang >/dev/null 2>&1 && {
      echo -e " ${GREEN}完成${RESET}"
    } || {
      echo -e " ${RED}失败${RESET}"
      exit 1
    }
  else
    show_success "已检测到Python $(python3 -V | cut -d' ' -f2)"
  fi
}

function install_cpp() {
  show_step "3/4 正在配置C++环境"
  if ! command -v g++ &>/dev/null; then
    echo -n "正在安装编译器..."
    pkg install -y clang make >/dev/null 2>&1 && {
      echo -e " ${GREEN}完成${RESET}"
    } || {
      echo -e " ${RED}失败${RESET}"
      exit 1
    }
  else
    show_success "已检测到编译器 $(g++ --version | head -n1 | awk '{print $1,$3}')"
  fi
}

function install_packages() {
  show_step "4/4 正在安装Python工具包"
  echo -n "正在配置镜像源..."
  pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple >/dev/null 2>&1
  echo -e " ${GREEN}完成${RESET}"
  
  echo -n "正在安装核心模块..."
  pip3 install --user requests tqdm python-dotenv >/dev/null 2>&1 && {
    echo -e " ${GREEN}完成${RESET}"
  } || {
    echo -e " ${RED}失败${RESET}"
    exit 1
  }
}

# ==================== 主流程 ====================
show_header

prepare_env
install_python
install_cpp
install_packages

# ==================== 完成提示 ====================
echo -e "\n${CYAN}============================================"
echo -e "✅ 环境配置成功完成！"
echo -e "============================================${RESET}"
echo -e "${BOLD}使用指南：${RESET}"
echo -e "  ${BLUE}▸${RESET} 输入 ${GREEN}python3${RESET} 开始Python编程"
echo -e "  ${BLUE}▸${RESET} 输入 ${GREEN}g++ test.cpp -o test${RESET} 编译C++程序"
echo -e "\n${YELLOW}提示：重启终端后所有配置生效${RESET}"