//
//  SampleSettingsController.swift
//  ModernSettingsExample
//
//  Created by Taylor Lineman on 2/22/26.
//

import SwiftUI
import ModernSettings

struct SampleSettingsController: View {
    @State var selectedPage: SettingsPage = .general
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedPage) {
                ForEach(SettingsPage.allCases, id: \.name) { page in
                    Label(page.name, systemImage: page.sfSymbol)
                        .tag(page)
                }
            }
            .lockSidebar()
        } detail: {
            switch selectedPage {
            case .general:
                GeneralSettingsPage()
            case .advanced:
                AdvancedSettingsPage()
            }
        }
    }
}
