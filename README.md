# Issue

Unable to propagate `batect.local.yml` variable as an environment variable to the `Dockerfile` build process during the `./batect run` task execution.

An attempt was also tried using `build_args` to pass the environment variable in, but this also failed. Commented out code shows this approach in both `batect.yml` and `Dockerfile`

# Reproduction Steps

On Windows:

1. Run Docker, ensuring it's been switched to run Windows containers.
1. `./batect run`
1. Examine `appsettings.config` to check all variables have been injected. Can be done using `type appsettings.config` from the command prompt.
1. Observe that the `SecretKeyFromEnv` setting value has been replaced with an empty string rather than the desired `TOP-SECRET-KEY` string from `batect.local.yml`.

The results:

```
C:\app>type appsettings.config
<appSettings>
  <add key="SecretKeyFromEnv" value="" />
  <add key="ValueFromHardCoded" value="HARD-CODED-VALUE" />
</appSettings>
```