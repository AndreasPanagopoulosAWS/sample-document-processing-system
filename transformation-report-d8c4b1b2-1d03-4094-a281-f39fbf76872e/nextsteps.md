# Next Steps

## Issues resolved
- Transformed DocumentProcessor.Web.csproj to net8.0

## Summary

The solution has no build errors following the transformation. All projects compiled successfully, which indicates the migration to cross-platform .NET has completed without introducing any compilation-level issues.

## Validation Steps

### 1. Review Target Framework

Open `src/DocumentProcessor.Web/DocumentProcessor.Web.csproj` and confirm the `<TargetFramework>` element is set to the intended .NET version (e.g., `net8.0`). Ensure any dependent class libraries target a compatible framework or use `netstandard2.0`/`netstandard2.1` where appropriate.

### 2. Restore and Build Locally

Run the following commands from the solution root to confirm a clean restore and build:

```bash
dotnet restore
dotnet build --configuration Release
```

Review the output for any warnings that may indicate deprecated APIs or platform-specific code paths that compiled but may not behave correctly at runtime.

### 3. Run the Test Suite

If the solution contains test projects, execute them to verify runtime behavior:

```bash
dotnet test --configuration Release --logger "console;verbosity=detailed"
```

Address any failing tests before proceeding. Pay particular attention to tests covering file I/O, registry access, or Windows-specific APIs, as these are common sources of cross-platform runtime failures even when the build succeeds.

### 4. Check for Platform-Specific Runtime Behavior

Even with a clean build, certain APIs behave differently or are unavailable on non-Windows platforms. Review the codebase for usage of:

- `System.Drawing` (GDI+ is not fully supported on Linux/macOS without additional packages)
- `Microsoft.Win32` registry APIs
- Windows-specific file path assumptions (e.g., backslash separators, drive letters)
- COM interop or P/Invoke calls targeting Windows-only native libraries

Use `dotnet` analyzers or search the codebase directly for these patterns.

### 5. Run the Application Locally

Start the web application and verify it runs as expected:

```bash
dotnet run --project src/DocumentProcessor.Web/DocumentProcessor.Web.csproj --configuration Release
```

Navigate through the application's primary workflows, specifically any document processing features, and confirm they function correctly.

### 6. Verify Configuration and Middleware

Check `Program.cs` and any `Startup.cs` files to confirm:

- Middleware registration is compatible with the target .NET version.
- Configuration sources (e.g., `appsettings.json`, environment variables) are loading correctly.
- Any legacy `web.config` settings have been migrated to `appsettings.json` or equivalent.

### 7. Review NuGet Package Compatibility

Run the following to check for outdated or vulnerable packages:

```bash
dotnet list package --outdated
dotnet list package --vulnerable
```

Update packages where necessary, particularly any that were carried over from the legacy project and may have newer cross-platform compatible versions available.

### 8. Publish and Verify Output

Produce a published output and verify its contents:

```bash
dotnet publish src/DocumentProcessor.Web/DocumentProcessor.Web.csproj --configuration Release --output ./publish
```

Confirm the output directory contains the expected assemblies, static assets, and configuration files. Test the published output by running it directly:

```bash
dotnet ./publish/DocumentProcessor.Web.dll
```