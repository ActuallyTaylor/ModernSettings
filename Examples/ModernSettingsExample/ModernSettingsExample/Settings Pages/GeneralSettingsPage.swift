//
//  GeneralSettingsPage.swift
//  ModernSettingsExample
//
//  Created by Taylor Lineman on 2/22/26.
//

import SwiftUI

struct GeneralSettingsPage: View {
    @State var sampleSetting: Bool = false
    
    var body: some View {
        Form {
            Section("Standard Settings") {
                Toggle("General Setting", isOn: $sampleSetting)
                Toggle("General Setting 2", isOn: $sampleSetting)
                Toggle("General Setting 3", isOn: $sampleSetting)
            }
        }
        .formStyle(.grouped)
    }
}
