@echo off
@setlocal

@echo Cleaning up...
@call dotnet clean -v:minimal --nologo

@call dotnet test ^
    /p:UseSourceLink=true ^
    /p:CollectCoverage=true ^
    /p:CoverletOutputFormat=\"json,cobertura,opencover\" ^
    /p:CoverletOutput=..\artifacts\ ^
    /p:Include="[MyLibrary]*"

@endlocal
@exit /b %ERRORLEVEL%
