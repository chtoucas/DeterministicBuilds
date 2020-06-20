@echo off
@setlocal

@echo Cleaning up...
@call dotnet clean --nologo -v:minimal

@call dotnet pack %*

@endlocal
@exit /b %ERRORLEVEL%
