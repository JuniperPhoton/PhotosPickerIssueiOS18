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
