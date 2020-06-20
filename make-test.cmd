@echo off
@setlocal

@echo Cleaning up...
@call dotnet clean --nologo -v:minimal

@call dotnet test %* ^
    /p:CollectCoverage=true ^
    /p:CoverletOutput=..\artifacts\

@endlocal
@exit /b %ERRORLEVEL%
