# Modern Settings
A SwiftUI package that brings a more modern settings window to macOS. The current SwiftUI settings window is still in an older style. This package matches the post Ventura Settings.


## Example
To create a Modern Settings window, use the `ModernSettings` scene within your Main App. Within your Settings view, use a `NavigationSplitView` with a locked sidebar. To lock the sidebar, use the `lockSidebar` modifier on the main view within your sidebar.
```swift
@main
struct TextEditor: App {
    var body: some Scene {
        ModernSettings() {
            SettingsController()
        }
    }
}

struct SettingsController: View {
    var body: some View {
       NavigationSplitView {
           List {
               ForEach(0..<10) { i in
                   Text("index: \(i)")
               }
           }
           .lockSidebar()
       } detail: {
           Text("My Settings")
       }
   }
}
```

### Locked Sidebar
Modern macOS settings prevent the `NavigationSplitView's` sidebar from being collapsed. This is seemingly done through a private API. To get around this, ModernSettings uses a modifier, `lockSidebar` within the `NavigationSplitView`. This removes the toggle button and locking the width. To prevent the drag gesture on the sidebar, ``NSplitView:canCollapse`` is swizzled by the `ModernSettings` scene.

