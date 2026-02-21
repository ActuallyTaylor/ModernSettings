//
//  SettingsShortcut.swift
//  ModernSettingsWindow
//
//  Created by Taylor Lineman on 2/21/26.
//

import SwiftUI

extension Scene {
    public func settingsShortcut(_ openSettingsShortcut: KeyEquivalent, _ openSettingsModifiers: EventModifiers) -> some Scene {
        transformEnvironment(\.configuration) { configuration in
            configuration.openSettingsShortcut = openSettingsShortcut
            configuration.openSettingsModifiers = openSettingsModifiers
        }
    }
}
