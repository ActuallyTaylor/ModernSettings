//
//  SampleApp.swift
//  ModernSettings
//
//  Created by Taylor Lineman on 2/22/26.
//

import SwiftUI
import ModernSettings

@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            Text("Hello World")
        }
        
        ModernSettings {
            SampleSettingsController()
        }
    }
}

struct SampleSettingsController: View {
    var body: some View {
        NavigationSplitView {
            Text("My Settings Category")
                .lockSidebar()
        } detail: {
            Text("My Settings")
        }
    }
}
