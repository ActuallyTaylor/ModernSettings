//
//  OpenSettings.swift
//  ModernSettingsWindow
//
//  Created by Taylor Lineman on 2/21/26.
//

import SwiftUI

/// An callable struct that can be accessed throughout SwiftUI using `@Environment(\.openModernSettings)`.
/// Like the build in `OpenSettingsAction`, this function will open the ModernSettings Window. The window will only open once at a time, and subsequent calls will focus an existing window.
@MainActor
public struct OpenModernSettingsAction {
    /// A copy of SwiftUI's openWindow action.
    ///
    /// In this library, this copy is created by `ModernSettingsScene`'s  Menu Bar command. This was chosen since menu bar *should* not be destructed.
    /// > Warning: There is a chance this assumption is incorrect. In this case, use `openWindow(id: "settings")`
    static var openWindowAction: OpenWindowAction? = nil
    
    /// See https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations/#Methods-with-Special-Names
    func callAsFunction() {
        if let openWindowAction = Self.openWindowAction {
            openWindowAction(id: SceneID.settings.id)
        }
    }
}


public extension EnvironmentValues {
    /// The environment value for modifiers to update the configurations.
    @Entry var openModernSettings: OpenModernSettingsAction = OpenModernSettingsAction()
}
