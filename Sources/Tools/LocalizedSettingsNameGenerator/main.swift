//
//  main.swift
//  ModernSettings
//
//  Created by Taylor Lineman on 2/21/26.
//

/*
 LocalizedSettingsNameGenerator:
 A quick and dirty tool that can be used to extract the localized strings from SwiftUI that are used to show the default Settings menu item.
 */


import Foundation

enum LocalizationError: Error {
    case noSwiftUIBundle
}

struct Localization {
    /// The loctable that contains the "Settings…" key as of macOS 26.3 (25D125)
    static let primaryLoctableName: String = "MainMenu"
    
    func getSwiftUIBundle() throws -> Bundle {
        guard let bundle = Bundle(identifier: "com.apple.SwiftUI") else {
            throw LocalizationError.noSwiftUIBundle
        }
        return bundle
    }
    
//    func search(loctableURL: URL, forKey key: String) throws -> String? {
//        let data = try Data(contentsOf: loctableURL)
//        guard let loctable = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String: [String: Any]] else {
//            print("Failed to decode")
//            return nil
//        }
//        print(loctable)
//        guard let localizedStrings = loctable[key] else {
//            print("Failed to get strings")
//            return nil
//        }
//        print(localizedStrings)
//        return nil
//    }
    
//    func getSwiftUILoctable() throws {
//        let bundle = try getSwiftUIBundle()
//        
//        //        let primaryLocalization
//        if let primaryLoctable = bundle.url(forResource: Localization.primaryLoctableName, withExtension: "loctable") {
//            try search(loctableURL: primaryLoctable, forKey: "Settings…")
//        } else {
//            print("Unable to get loctable url")
//        }
//        
//        
//    }
}


do {
    let localization = Localization()
    let bundle = try localization.getSwiftUIBundle()

    if let primaryLoctable = bundle.url(forResource: Localization.primaryLoctableName, withExtension: "loctable") {
        let data = try Data(contentsOf: primaryLoctable)
        
        guard let loctable = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String: [String: Any]] else {
            print("Failed to decode")
            exit(0)
        }
        
        
        for (key, value) in loctable {
            guard let settingsString = value["Settings…"] as? String else {
                print("Could not settings for \(key)")
                continue
            }
            
            print(key, settingsString)
            
        }

    }
} catch {
    
}
