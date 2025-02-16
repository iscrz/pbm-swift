# Pinball Map API Wrapper for iOS and macOS

## Supported Endpoints

### Location Machines

[GET /api/v1/locations/autocomplete.json](https://pinballmap.com/api/v1/docs/1.0/locations/autocomplete.html)

```swift
try await PinballMap.request(.locationMachines(id: 10804))
```

### Location Fuzzy Search

[GET /api/v1/locations/:id/machine_details.json](https://pinballmap.com/api/v1/docs/1.0/locations/machine_details.html)

```swift
try await PinballMap.request(.search(locationName: "Wedgehead"))
```
