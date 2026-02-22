//
//  ModernSettingsScene.swift
//  ModernSettingsScene
//
//  Created by Taylor Lineman on 2/21/26.
//

import SwiftUI

/// A SwiftUI settings scene that creates a more Modern Settings Window.
///
/// To use in your app, create a `ModernSettings()` sub-scene within your `@main` app. 
/// ```
///     @main
///     struct TextEditor: App {
///         var body: some Scene {
///             ModernSettings() {
///                 SettingsController()
///             }
///         }
///     }
/// ```
public struct ModernSettings<Content: View>: Scene {
    @Environment(\.openWindow) var openWindow
    @Environment(\.openModernSettings) var openSettings
    
    @ViewBuilder var content: () -> Content
    
    @Environment(\.configuration) private var configuration: ModernSettingsConfiguration
    
    public init(content: @escaping () -> Content) {
        // Swizzle NSplitView:canCollapse to prevent collapsing in our custom settings window.
        NSSplitViewItem.swizzle()
        self.content = content
    }
    
    public var body: some Scene {
        Window(SceneID.settings.title, id: SceneID.settings.id) {
            content()
                .toolbarTitleDisplayMode(.inlineLarge)
        }
        .defaultSize(width: 790, height: 500)
        .defaultPosition(.center)
        .restorationBehavior(.disabled)
        .commands {
            CommandGroup(replacing: .appSettings) {
                Button(LocalizedStringResource.settings) {
                    openSettings()
                }
                .keyboardShortcut(configuration.openSettingsShortcut, modifiers: configuration.openSettingsModifiers)
                .onAppear {
                    // Pass the openWindow action into a static variable that can be used by any OpenModernSettingsAction instance. Since this scene is always instantiated it should be okay.
                    OpenModernSettingsAction.openWindowAction = openWindow
                }
            }
        }
    }
}

