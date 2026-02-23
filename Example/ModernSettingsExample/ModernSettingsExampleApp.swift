//
//  ModernSettingsExampleApp.swift
//  ModernSettingsExample
//
//  Created by Taylor Lineman on 2/22/26.
//

import SwiftUI
import ModernSettings

@main
struct ModernSettingsExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        ModernSettings {
            SampleSettingsController()
        }
    }
}
