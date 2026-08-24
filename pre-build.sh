#!/bin/sh
# 在编译前动态修改 doh_proxy 的 Makefile，启用静态编译
sed -i 's/^LDFLAGS += -Wl,--gc-sections/ LDFLAGS += -static -Wl,--gc-sections/' padavan-ng/trunk/user/doh_proxy/Makefile
echo "✅ pre-build: 已修改 doh_proxy/Makefile 启用静态编译"
