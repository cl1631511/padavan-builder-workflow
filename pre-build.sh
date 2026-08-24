#!/bin/bash

echo "=== Running pre-build customizations ==="

# 定义 state.js 文件路径（相对于仓库根目录）
STATE_JS="padavan-ng/trunk/user/www/n56u_ribbon_fixed/state.js"

if [ -f "$STATE_JS" ]; then
    echo "Modifying $STATE_JS to hide menu items..."

    # 备份原文件
    cp "$STATE_JS" "$STATE_JS.bak"

    # 1. 隐藏 VPN Server 和 VPN Client（menuL1 索引 3 和 4）
    # 将 menuL1_title 和 menuL1_link 数组中对应位置设为空
    sed -i 's/^\([[:space:]]*menuL1_title = new Array(.*\), "<#menu2#>", "<#menu6#>",\(.*\))$/\1, "", "",\2/' "$STATE_JS"
    sed -i 's/^\([[:space:]]*menuL1_link = new Array(.*\), "vpnsrv.asp", "vpncli.asp",\(.*\))$/\1, "", "",\2/' "$STATE_JS"

    # 2. 隐藏 LAN → IPTV（tablink[2] 和 tabtitle[2] 索引 4）
    sed -i 's/^\([[:space:]]*tablink\[2\] = new Array(.*\), "Advanced_IPTV_Content.asp",\(.*\))$/\1, "",\2/' "$STATE_JS"
    sed -i 's/^\([[:space:]]*tabtitle\[2\] = new Array(.*\), "<#menu5_2_4#>",\(.*\))$/\1, "",\2/' "$STATE_JS"

    # 3. 隐藏 WAN → DDNS（tablink[3] 和 tabtitle[3] 索引 5）
    sed -i 's/^\([[:space:]]*tablink\[3\] = new Array(.*\), "Advanced_DDNS_Content.asp"\(.*\))$/\1, ""\2/' "$STATE_JS"
    sed -i 's/^\([[:space:]]*tabtitle\[3\] = new Array(.*\), "<#menu5_3_6#>"\(.*\))$/\1, ""\2/' "$STATE_JS"

    echo "Modifications completed."
else
    echo "Warning: $STATE_JS not found."
fi

echo "=== Pre-build finished ==="
