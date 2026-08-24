#!/bin/bash

echo "=== Running pre-build customizations ==="

STATE_JS="padavan-ng/trunk/user/www/n56u_ribbon_fixed/state.js"

if [ -f "$STATE_JS" ]; then
    echo "Modifying $STATE_JS to hide menu items..."
    cp "$STATE_JS" "$STATE_JS.bak"

    # 隐藏 VPN 服务器
    sed -i 's/"<#menu2#>"/""/g' "$STATE_JS"
    sed -i 's/"vpnsrv.asp"/""/g' "$STATE_JS"

    # 隐藏 VPN 客户端（使用稳健的直接匹配方式）
    sed -i 's/"<#menu6#>"/""/g' "$STATE_JS"
    sed -i 's/"vpncli.asp"/""/g' "$STATE_JS"

    # 隐藏 LAN → IPTV
    sed -i 's/"Advanced_IPTV_Content.asp"/""/g' "$STATE_JS"
    sed -i 's/"<#menu5_2_4#>"/""/g' "$STATE_JS"

    # 隐藏 WAN → DDNS
    sed -i 's/"Advanced_DDNS_Content.asp"/""/g' "$STATE_JS"
    sed -i 's/"<#menu5_3_6#>"/""/g' "$STATE_JS"

    echo "Modifications completed."
    echo "Backup saved as $STATE_JS.bak"
else
    echo "Warning: $STATE_JS not found."
fi

echo "=== Pre-build finished ==="
