@echo off
@setlocal

set name=TestInterfaces

set exe_name=%name%.exe
set exe_path=.\bin

REM Check if AS libraries are in the path
for %%X in (DllMain.dll) do (set FOUND=%%~$PATH:X)
if not defined FOUND (
    echo Please ensure the libraries are in your path
    echo For example "set PATH=..\..\lib\;%%PATH%%"
    exit /B 1
)

REM clean the build directory ..
if not exist "%exe_path%" mkdir %exe_path%

del .\src\drivers\*.* /q
del .\src\services\*.* /q
del .\src\wrappers\*.* /q

xcopy ..\..\drivers .\src\drivers /E /Y /I
xcopy ..\..\services .\src\services /E /Y /I
xcopy ..\..\wrappers .\src\wrappers /E /Y /I

REM echo Compiling
swiftc .\src\%name%.swift ^
    .\src\services\Services.swift ^
    .\src\services\Loader.swift ^
    .\src\drivers\TestInterfaceDriver.swift ^
    .\src\wrappers\DllMainWrapper.swift -o %exe_path%\%exe_name%

if %ERRORLEVEL% NEQ 0 (
    echo "Error compiling code"
    exit /B 1
)

echo Running example
%exe_path%\%exe_name%

if %ERRORLEVEL% NEQ 0 (
    echo "Error executing %exe_name%"
    exit /B 1
)
