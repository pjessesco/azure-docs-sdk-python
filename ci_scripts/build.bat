cd /d "%~dp0"

FOR /D %%G in ("..\azure-*") DO (
    Echo ***Found folder: %%G
    Echo %%G\setup.py

    C:/Python35/scripts/sphinx-apidoc.exe %%G --module-first --no-toc --output-dir=./ref --force ^
      %%G\setup.py ^
      %%G\azure_bdist_wheel.py ^
      %%G\tests ^
      %%G\testutils
)

if errorlevel 1 exit /b 1
