# PhotosPicker issue on iOS 18

This is a minimum demo that can replicate the PhotosPicker issue on iOS 18:

1. Run the app on iOS 18.
2. Click the "Pick photo" button, which will invoke the PhotosPicker.
3. Navigate to the "Collection" tab, and the picker will show a "failure" UI.

The code is rather simple:

```swift
struct ContentView: View {
    @State private var selection: PhotosPickerItem? = nil
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            PhotosPicker("Pick photo", selection: $selection)
        }
        .padding()
    }
}
```
## Workround

We can avoid this issue by disabling the Collections feature in PhotosPicker. However this API isn't exposed in SwiftUI. You have bridge your SwiftUI view to use `PHPickerViewController`, which is the underlying part in `PhotosPicker`.

```swift
private func createNewInstance(sizeLimit: Int) -> PHPickerViewController {    
    var configuration = PHPickerConfiguration(photoLibrary: .shared())
    configuration.filter = PHPickerFilter.any(of: [.images])
    configuration.preferredAssetRepresentationMode = .current
    configuration.selection = .ordered
    configuration.selectionLimit = sizeLimit
    
    // Workaround to prevent users navigate to the Collections tab, which will crash.
    // https://developer.apple.com/documentation/uikit/view_controllers/collaborating_and_sharing_copies_of_your_data
    if #available(iOS 18.0, *) {
        configuration.disabledCapabilities = [.collectionNavigation]
    }
    
    return PHPickerViewController(configuration: configuration)
}
```
