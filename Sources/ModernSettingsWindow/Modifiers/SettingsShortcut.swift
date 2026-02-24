//
//  SettingsShortcut.swift
//  ModernSettingsWindow
//
//  Created by Taylor Lineman on 2/21/26.
//

import SwiftUI

extension Scene {
    /// Use the `settingsShortcut` modifier to change the keyboard shortcut used to open the App's ``ModernSettings`` window.
    ///
    /// For example, you can change the shortcut to be `cmd + shift + ,`:
    /// ```
    ///     @main
    ///     struct TextEditor: App {
    ///         var body: some Scene {
    ///             ModernSettings() {
    ///                 SettingsController()
    ///                     .settingsShortcut(",", [.command, .shift])
    ///             }
    ///         }
    ///     }
    /// ```
    public func settingsShortcut(_ openSettingsShortcut: KeyEquivalent, _ openSettingsModifiers: EventModifiers) -> some Scene {
        transformEnvironment(\.configuration) { configuration in
            configuration.openSettingsShortcut = openSettingsShortcut
            configuration.openSettingsModifiers = openSettingsModifiers
        }
    }
}
