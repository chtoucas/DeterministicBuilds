:: Will crash if the packages were not restored before.

@rem @call dotnet build /p:TF_BUILD=true

@call dotnet test /p:TF_BUILD=true /p:EnableSourceLink=true ^
    --collect:"XPlat Code Coverage" ^
    --settings coverlet.runsettings

@call dotnet test /p:TF_BUILD=true /p:EnableSourceLink=true ^
    /p:UseSourceLink=true ^
    /p:CollectCoverage=true ^
    /p:Include="[ClassLibrary1]*"
