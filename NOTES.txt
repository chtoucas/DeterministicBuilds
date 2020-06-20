
Non-deterministic packing.
> make-pack.cmd

Fully deterministic packing.
> make-pack.cmd /p:ContinuousIntegrationBuild=true

Testing + CC with UseSourceLink = false
> make-test.cmd
> make-test.cmd /p:ContinuousIntegrationBuild=true
> make-test-xplat.cmd
> make-test-xplat.cmd /p:CI=true

Testing + CC with UseSourceLink = true
> make-test.cmd /p:UseSourceLink=true
> make-test.cmd /p:UseSourceLink=true /p:ContinuousIntegrationBuild=true    <--- fails
> make-test-xplat.USL.cmd
> make-test-xplat.USL.cmd /p:ContinuousIntegrationBuild=true                <--- fails
