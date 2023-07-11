ARCHS = arm64 arm64e

TARGET := iphone:14.5
# THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NotBrightRespringPreferences

NotBrightRespringPreferences_FILES = NOTRootListController.m
NotBrightRespringPreferences_FRAMEWORKS = UIKit
NotBrightRespringPreferences_PRIVATE_FRAMEWORKS = Preferences
NotBrightRespringPreferences_EXTRA_FRAMEWORKS += Cephei CepheiPrefs
NotBrightRespringPreferences_INSTALL_PATH = /Library/PreferenceBundles
NotBrightRespringPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
