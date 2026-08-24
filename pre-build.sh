#!/bin/bash

echo "Running pre-build customizations - hiding unwanted menu items..."

# 定义 state.js 文件路径（根据你的源码实际路径调整）
STATE_JS="trunk/user/www/n56u_ribbon_fixed/state.js"

if [ -f "$STATE_JS" ]; then
    echo "Modifying $STATE_JS..."

    # 1. 隐藏 VPN Server（menuL1 索引 3）
    sed -i 's/^\(.*menuL1_title\[3\].*\)/\/\/ \1/' "$STATE_JS"
    sed -i 's/^\(.*menuL1_link\[3\].*\)/\/\/ \1/' "$STATE_JS"

    # 2. 隐藏 VPN Client（menuL1 索引 4）
    sed -i 's/^\(.*menuL1_title\[4\].*\)/\/\/ \1/' "$STATE_JS"
    sed -i 's/^\(.*menuL1_link\[4\].*\)/\/\/ \1/' "$STATE_JS"

    # 3. 隐藏 LAN → IPTV（tablink 二级菜单索引 [2][4]）
    sed -i 's/^\(.*tablink\[2\]\[4\].*\)/\/\/ \1/' "$STATE_JS"
    sed -i 's/^\(.*tabtitle\[2\]\[4\].*\)/\/\/ \1/' "$STATE_JS"

    # 4. 隐藏 WAN → DDNS（tablink 二级菜单索引 [3][5]）
    sed -i 's/^\(.*tablink\[3\]\[5\].*\)/\/\/ \1/' "$STATE_JS"
    sed -i 's/^\(.*tabtitle\[3\]\[5\].*\)/\/\/ \1/' "$STATE_JS"

    echo "Modifications completed."
else
    echo "Warning: $STATE_JS not found. Skipping modifications."
fi

echo "Pre-build finished."
