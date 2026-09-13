SINA AI — Android Build Package

Main:
- main.py
- buildozer.spec
- SINA_AI_LOCAL_SETUP.sh (optional)
- README_UPLOAD.txt

Build with Buildozer:
    buildozer -v android debug

The resulting APK is placed in the bin/ directory after a successful build.

Note:
The Kivy app is packaged here. The local LLM engine/model is a separate runtime and is not embedded in this ZIP.
