# 不指定 SDK 版本（服务器自动选择）
# 多巴胺只支持 iOS 15+，UI 相关 API 都可用，故关闭"旧版本可用性"报错
ARCHS := arm64

# rootless：所有文件装到 /var/jb
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DemoAlert
DemoAlert_FILES = Tweak.x
DemoAlert_CFLAGS = -fobjc-arc -Wno-error=unguarded-availability-new -Wno-error=unguarded-availability

include $(THEOS_MAKE_PATH)/tweak.mk
