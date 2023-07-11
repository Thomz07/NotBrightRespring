ARCHS = arm64 arm64e

TARGET := iphone:14.5
INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NotBrightRespring

NotBrightRespring_FILES = Tweak.xm
NotBrightRespring_CFLAGS = -fobjc-arc -std=c++11
NotBrightRespring_PRIVATE_FRAMEWORKS += BackBoardServices
NotBrightRespring_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += notbrightrespringpreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
