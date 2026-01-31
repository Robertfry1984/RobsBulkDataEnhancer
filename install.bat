@echo off
setlocal
cd /d "%~dp0"
if exist "installation\requirements.txt" (
  python -m pip install --upgrade pip
  python -m pip install -r "installation\requirements.txt"
) else (
  python -m pip install --upgrade pip
  python -m pip install -r "requirements.txt"
)
if exist "vendor\ddgs\requirements.txt" (
  python -m pip install -r "vendor\ddgs\requirements.txt"
)
if exist "vendor\trafilatura\requirements.txt" (
  python -m pip install -r "vendor\trafilatura\requirements.txt"
)
endlocal
