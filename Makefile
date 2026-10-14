# SDK 用 16.5（编译服务器已装），最低部署 iOS 15（多巴胺最低要求）
TARGET := iphone:clang:16.5:15.0
ARCHS := arm64

# rootless：所有文件装到 /var/jb
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DemoAlert
DemoAlert_FILES = Tweak.x
DemoAlert_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
