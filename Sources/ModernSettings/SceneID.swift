//
//  SceneID.swift
//  ModernSettingsWindow
//
//  Created by Taylor Lineman on 2/21/26.
//

enum SceneID: String, Identifiable {
    var id: String { rawValue }
    
    case settings = "settings"
    
    var title: String {
        switch self {
        case .settings:
            return "Settings"
        }
    }
}
