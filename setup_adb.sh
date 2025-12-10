#!/bin/bash

# 获取脚本所在目录（兼容 bash 和 zsh，支持 source 方式调用）
if [[ -n "${BASH_SOURCE[0]}" ]]; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
elif [[ -n "${(%):-%x}" ]]; then
    SCRIPT_DIR="$(cd "$(dirname "${(%):-%x}")" && pwd)"
else
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
fi

# 检查 adb 是否存在
if [[ ! -x "$SCRIPT_DIR/platform-tools/adb" ]]; then
    echo "Error: adb not found at $SCRIPT_DIR/platform-tools/adb"
    echo "Please download platform-tools and extract to $SCRIPT_DIR/platform-tools/"
    return 1 2>/dev/null || exit 1
fi

export PATH="$SCRIPT_DIR/platform-tools:$PATH"

echo "ADB path configured: $SCRIPT_DIR/platform-tools"
