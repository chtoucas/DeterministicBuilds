@echo off
@setlocal

@echo Cleaning up...
@call dotnet clean --nologo -v:minimal

@call dotnet pack %* --output artifacts

@endlocal
@exit /b %ERRORLEVEL%
