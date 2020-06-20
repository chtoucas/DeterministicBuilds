# Coverlet + Source Link + Deterministic build

.NET Core version: 3.1.300+

### Packing

Non-deterministic packing.
```
make-pack.cmd
```
Deterministic packing.
```
make-pack.cmd /p:ContinuousIntegrationBuild=true
```

### Code Coverage

Coverlet with `UseSourceLink = false` works fine.
```
make-test.cmd
make-test-xplat.cmd
make-test.cmd /p:ContinuousIntegrationBuild=true
make-test-xplat.cmd /p:ContinuousIntegrationBuild=true
```
Coverlet with `UseSourceLink = true` and `ContinuousIntegrationBuild = false` works fine.
```
make-test.cmd /p:UseSourceLink=true
make-test-xplat.cmd --settings coverlet.USL.runsettings
```

Coverlet with `UseSourceLink = true` and `ContinuousIntegrationBuild = true` fails.
```
make-test.cmd /p:UseSourceLink=true /p:ContinuousIntegrationBuild=true
make-test-xplat.cmd --settings coverlet.USL.runsettings /p:ContinuousIntegrationBuild=true
```
Diagnostic (see failure.txt).
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

The file `CoverletSourceRootsMapping` seems wrong???