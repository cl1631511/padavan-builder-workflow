#!/bin/bash

echo "=== Running pre-build customizations ==="

STATE_JS="padavan-ng/trunk/user/www/n56u_ribbon_fixed/state.js"

if [ -f "$STATE_JS" ]; then
    echo "Modifying $STATE_JS to hide menu items..."

    # 备份原文件
    cp "$STATE_JS" "$STATE_JS.bak"

    # ------------------------------------------------------------
    # 1. 隐藏 VPN Server（menuL1 索引 3）
    #    原内容: menuL1_title = new Array("", "<#menu1#>", "<#menu3#>", "<#menu2#>", ...)
    #    改为:   menuL1_title = new Array("", "<#menu1#>", "<#menu3#>", "", ...)
    # ------------------------------------------------------------
    sed -i 's/menuL1_title = new Array("", "<#menu1#>", "<#menu3#>", "<#menu2#>/menuL1_title = new Array("", "<#menu1#>", "<#menu3#>", ""/g' "$STATE_JS"
    sed -i 's/menuL1_link = new Array("", "index.asp", "aidisk.asp", "vpnsrv.asp"/menuL1_link = new Array("", "index.asp", "aidisk.asp", ""/g' "$STATE_JS"

    # ------------------------------------------------------------
    # 2. 隐藏 VPN Client（menuL1 索引 4）
    #    原内容: ..., "<#menu2#>", "<#menu6#>", "<#menu4#>", ...
    #    改为:   ..., "", "", "<#menu4#>", ...
    # ------------------------------------------------------------
    sed -i 's/", "<#menu2#>", "<#menu6#>", "<#menu4#>/", "", "", "<#menu4#>/g' "$STATE_JS"
    sed -i 's/", "vpnsrv.asp", "vpncli.asp", "Main_TrafficMonitor_realtime.asp"/", "", "", "Main_TrafficMonitor_realtime.asp"/g' "$STATE_JS"

    # ------------------------------------------------------------
    # 3. 隐藏 LAN → IPTV（tablink[2] 和 tabtitle[2] 索引 4）
    #    原内容: tablink[2] = new Array("", "Advanced_LAN_Content.asp", ...)
    #    改为:   tablink[2] = new Array("", "Advanced_LAN_Content.asp", ..., "", ...)
    # ------------------------------------------------------------
    sed -i 's/tablink\[2\] = new Array("", "Advanced_LAN_Content.asp", "Advanced_DHCP_Content.asp", "Advanced_GWStaticRoute_Content.asp", "Advanced_IPTV_Content.asp"/tablink[2] = new Array("", "Advanced_LAN_Content.asp", "Advanced_DHCP_Content.asp", "Advanced_GWStaticRoute_Content.asp", ""/g' "$STATE_JS"
    sed -i 's/tabtitle\[2\] = new Array("", "<#menu5_2_1#>", "<#menu5_2_2#>", "<#menu5_2_3#>", "<#menu5_2_4#>/tabtitle[2] = new Array("", "<#menu5_2_1#>", "<#menu5_2_2#>", "<#menu5_2_3#>", ""/g' "$STATE_JS"

    # ------------------------------------------------------------
    # 4. 隐藏 WAN → DDNS（tablink[3] 和 tabtitle[3] 索引 5）
    #    原内容: tablink[3] = new Array("", "Advanced_WAN_Content.asp", ...)
    #    改为:   tablink[3] = new Array("", "Advanced_WAN_Content.asp", ..., "")
    # ------------------------------------------------------------
    sed -i 's/tablink\[3\] = new Array("", "Advanced_WAN_Content.asp", "Advanced_IPv6_Content.asp", "Advanced_VirtualServer_Content.asp", "Advanced_Exposed_Content.asp", "Advanced_DDNS_Content.asp"/tablink[3] = new Array("", "Advanced_WAN_Content.asp", "Advanced_IPv6_Content.asp", "Advanced_VirtualServer_Content.asp", "Advanced_Exposed_Content.asp", ""/g' "$STATE_JS"
    sed -i 's/tabtitle\[3\] = new Array("", "<#menu5_3_1#>", "<#menu5_3_3#>", "<#menu5_3_4#>", "<#menu5_3_5#>", "<#menu5_3_6#>/tabtitle[3] = new Array("", "<#menu5_3_1#>", "<#menu5_3_3#>", "<#menu5_3_4#>", "<#menu5_3_5#>", ""/g' "$STATE_JS"

    echo "Modifications completed."
    echo "Backup saved as $STATE_JS.bak"
else
    echo "Warning: $STATE_JS not found."
fi

echo "=== Pre-build finished ==="
