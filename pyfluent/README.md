PySide6 + FluentUI minimal example

This small example demonstrates how to use the local cloned `PySide6-FluentUI-QML` wrapper with PySide6 and QML.

Prerequisites
- Python 3.11
- PySide6 (installed via pip)
- Optionally qasync (the full example uses it)
- The wrapper project cloned at `../PySide6-FluentUI-QML` (this repo already contains it in this workspace)

Quick run (from the workspace root):

1) Create a virtualenv and install dependencies (recommended):

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r pyfluent/requirements.txt
# If you didn't clone the wrapper into the workspace, install it from GitHub:
# pip install git+https://github.com/zhuzichu520/PySide6-FluentUI-QML.git
```

2) Run the example:

```bash
python pyfluent/main.py
```

Notes and cross-platform tips
- Wayland vs X11: Qt may default to the Wayland platform plugin on modern GNOME/KDE Wayland sessions. If you run into platform plugin issues, try setting `QT_QPA_PLATFORM=xcb` (for X11) or `QT_QPA_PLATFORM=wayland` explicitly.
- Hyprland: Hyprland is a Wayland compositor; ensure your Qt build supports the Wayland platform plugin.
- Windows: Use the same code; packaging can be done with PyInstaller or PyOxidizer. See the `script-build-pyinstaller.py` included in the wrapper repo for a starting point.
- If you want the C++ FluentUI library installed system-wide, build the upstream `FluentUI` repo and install it to your Qt install's qml import path so native QML imports work outside the Python wrapper.

If you'd like, I can:
- Try to install PySide6 and run this example in the container (may fail if GUI/display isn't available here).
- Build a distributable for Windows or Linux (PyInstaller) and provide packaging steps.
