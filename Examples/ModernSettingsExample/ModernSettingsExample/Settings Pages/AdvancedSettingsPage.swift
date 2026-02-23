//
//  AdvancedSettingsPage.swift
//  ModernSettingsExample
//
//  Created by Taylor Lineman on 2/22/26.
//


import SwiftUI

struct AdvancedSettingsPage: View {
    @State var sampleSetting: Bool = false
    
    var body: some View {
        Form {
            Toggle("Advanced Setting", isOn: $sampleSetting)
        }
        .formStyle(.grouped)
    }
}
