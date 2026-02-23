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
To mimic other Modern macOS settings, the sidebar of the SettingsController needs to be locked. This can be done using the `.lockSidebar` modifier. This removes the sidebar toggle button, as well as locking it to a specific width.
```
struct SettingsController: View {
    var body: some View {
       NavigationSplitView {
            MySidebar()
                .lockSidebar(width: 250)
       } detail: {
           MyDetail()
       }
   }
}
```

#### Implementation Note
Modern macOS settings prevent the `NavigationSplitView's` sidebar from being collapsed. This is seemingly done through a private API. To get around this, ModernSettings uses a modifier, `lockSidebar` within the `NavigationSplitView`. This removes the toggle button and locking the width. To prevent the drag gesture on the sidebar, ``NSplitView:canCollapse`` is swizzled by the `ModernSettings` scene. This swizzling stops the sidebar from being collapse through any methods, which matches the behavior in Settings & Xcode.

