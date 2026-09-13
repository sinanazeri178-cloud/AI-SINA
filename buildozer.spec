[app]
title = SINA AI
package.name = sinaai
package.domain = org.sinaai
source.dir = .
source.include_exts = py,json,txt,png,jpg,atlas,kv
version = 1.0.0
requirements = python3,kivy,requests
orientation = portrait
fullscreen = 0
android.api = 35
android.minapi = 23
android.ndk = 27c
android.accept_sdk_license = True
android.permissions = INTERNET
android.arch = arm64-v8a
log_level = 2

[buildozer]
build_dir = .buildozer
log_level = 2
