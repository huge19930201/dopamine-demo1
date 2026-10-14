# 不指定具体 SDK 版本，自动用编译服务器上的最新版，避免版本不存在导致失败
ARCHS := arm64

THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DemoAlert
DemoAlert_FILES = Tweak.x
DemoAlert_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
