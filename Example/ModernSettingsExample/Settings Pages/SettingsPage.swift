//
//  SettingsPage.swift
//  ModernSettingsExample
//
//  Created by Taylor Lineman on 2/22/26.
//

enum SettingsPage: CaseIterable {
    case general
    case advanced
    
    var name: String {
        switch self {
        case .general:
            return "General"
        case .advanced:
            return "Advanced"
        }
    }
    
    var sfSymbol: String {
        switch self {
        case .general:
            return "gearshape"
        case .advanced:
            return "gearshape.2"
        }
    }
}
