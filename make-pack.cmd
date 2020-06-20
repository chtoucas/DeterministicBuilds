@echo off
@setlocal

@call dotnet pack /p:TF_BUILD=true --output artifacts

@endlocal
@exit /b %ERRORLEVEL%
