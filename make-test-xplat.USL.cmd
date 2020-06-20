@echo off
@setlocal

@echo Cleaning up...
@call dotnet clean --nologo -v:minimal

@call dotnet test %* ^
    --collect:"XPlat Code Coverage" ^
    --results-directory artifacts ^
    --settings coverlet.USL.runsettings

@endlocal
@exit /b %ERRORLEVEL%
