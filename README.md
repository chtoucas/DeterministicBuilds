# Coverlet + Source Link + Deterministic build

.NET Core version 3.1.300+

### Packing

NB: before packing, please reset the repository (reset.ps1).

Non-deterministic packing.
```
dotnet pack
```
Deterministic packing.
```
dotnet pack /p:ContinuousIntegrationBuild=true
```

### Code Coverage

IMPORTANT: reset the repository between each run (reset.ps1).

UPDATE: fixed with the current nightly builds of coverlet.

Coverlet with `UseSourceLink = false` works fine.
```
dotnet test /p:CollectCoverage=true
dotnet test /p:CollectCoverage=true /p:ContinuousIntegrationBuild=true
dotnet test --collect:"XPlat Code Coverage"
dotnet test --collect:"XPlat Code Coverage" /p:ContinuousIntegrationBuild=true
```
Coverlet with `UseSourceLink = true` and `ContinuousIntegrationBuild = false` works fine.
```
dotnet test /p:CollectCoverage=true /p:UseSourceLink=true
dotnet test --collect:"XPlat Code Coverage" --settings coverlet.USL.runsettings
```

Coverlet with `UseSourceLink = true` and `ContinuousIntegrationBuild = true` fails.
```
dotnet test /p:CollectCoverage=true /p:UseSourceLink=true /p:ContinuousIntegrationBuild=true
dotnet test --collect:"XPlat Code Coverage" --settings coverlet.USL.runsettings /p:ContinuousIntegrationBuild=true
```
Detailed error:
```
Data collector 'XPlat code coverage' message: [coverlet]Coverlet.Collector.Utilities.CoverletDataCollectorException: CoverletCoverageDataCollector: Failed to get coverage result
 ---> System.Collections.Generic.KeyNotFoundException: The given key '' was not present in the dictionary.
   at System.Collections.Generic.Dictionary`2.get_Item(TKey key)
   at Coverlet.Core.Coverage.GetSourceLinkUrl(Dictionary`2 sourceLinkDocuments, String document) in /_/src/coverlet.core/Coverage.cs:line 452
   at Coverlet.Core.Coverage.CalculateCoverage() in /_/src/coverlet.core/Coverage.cs:line 350
   at Coverlet.Core.Coverage.GetCoverageResult() in /_/src/coverlet.core/Coverage.cs:line 141
   at Coverlet.Collector.DataCollection.CoverageWrapper.GetCoverageResult(Coverage coverage) in /_/src/coverlet.collector/DataCollection/CoverageWrapper.cs:line 44
   at Coverlet.Collector.DataCollection.CoverageManager.GetCoverageResult() in /_/src/coverlet.collector/DataCollection/CoverageManager.cs:line 93
   --- End of inner exception stack trace ---
   at Coverlet.Collector.DataCollection.CoverageManager.GetCoverageResult() in /_/src/coverlet.collector/DataCollection/CoverageManager.cs:line 98
   at Coverlet.Collector.DataCollection.CoverletCoverageCollector.OnSessionEnd(Object sender, SessionEndEventArgs e) in /_/src/coverlet.collector/DataCollection/CoverletCoverageCollector.cs:line 160.
```

If we force `DeterministicSourcePaths` to `false`, things work again.
The build won't be fully deterministic, but Coverlet will use Source Link.
```
dotnet test /p:CollectCoverage=true /p:UseSourceLink=true /p:ContinuousIntegrationBuild=true /p:DeterministicSourcePaths=false
```
