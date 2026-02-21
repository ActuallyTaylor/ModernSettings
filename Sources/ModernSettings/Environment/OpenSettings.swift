//
//  OpenSettings.swift
//  ModernSettingsWindow
//
//  Created by Taylor Lineman on 2/21/26.
//

import SwiftUI

/// <#Description#>
@MainActor
public struct OpenModernSettingsAction {
    /// A reference to SwiftUI's openWindow action. The reference is held by the ModernSettings scene, and passed on the menu command's initialization.
    static var openWindowAction: OpenWindowAction? = nil
    
    /// <#Description#>
    public func callAsFunction() {
        if let openWindowAction = Self.openWindowAction {
            openWindowAction(id: SceneID.settings.id)
        }
    }
}


public extension EnvironmentValues {
    /// The environment value for modifiers to update the configurations.
    @Entry var openModernSettings: OpenModernSettingsAction = OpenModernSettingsAction()
}
