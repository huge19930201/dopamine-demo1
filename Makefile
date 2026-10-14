# 目标系统：iOS 16（多巴胺 rootless 越狱）
TARGET := iphone:clang:16.0
ARCHS := arm64

# rootless：所有文件装到 /var/jb
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DemoAlert
DemoAlert_FILES = Tweak.x
DemoAlert_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
