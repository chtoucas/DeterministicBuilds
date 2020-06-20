:: Will crash if the packages were not restored before.

@rem @call dotnet build /p:TF_BUILD=true

@call dotnet test /p:TF_BUILD=true ^
    /p:UseSourceLink=true ^
    /p:CollectCoverage=true ^
    /p:CoverletOutputFormat=opencover ^
    /p:CoverletOutput=..\artifacts\ ^
    /p:Include="[MyLibrary]*"

exit

@call dotnet test ^
    --collect:"XPlat Code Coverage" ^
    --results-directory __ ^
    --settings coverlet.runsettings
