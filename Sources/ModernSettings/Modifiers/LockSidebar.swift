//
//  LockSidebar.swift
//  ModernSettings
//
//  Created by Taylor Lineman on 2/21/26.
//

import SwiftUI

public extension View {
    /// Lock the sidebar of a NavigationSplitView.
    ///
    /// This stops the sidebar from being resized using the sidebar toggle. It also fixes the width to the provided  `width` parameter.
    ///
    /// A fix for a macOS 26 bug is enabled by default, this is controlled using the parameter `disableWindowStyleFix`. If this is set to true, the toolbar will not have a hidden element added to it. *This can be useful if you are seeing weird interactions with other toolbar items.*
    ///
    /// For example to lock the main sidebar of your settings window:
    /// ```
    ///     @main
    ///     struct TextEditor: App {
    ///         var body: some Scene {
    ///             ModernSettings() {
    ///                 SettingsController()
    ///             }
    ///         }
    ///     }
    ///
    ///    struct SettingsController: View {
    ///         var body: some View {
    ///            NavigationSplitView {
    ///                List {
    ///                    ForEach(0..<10) { i in
    ///                        Text("index: \(i)")
    ///                    }
    ///                }
    ///                .lockSidebar()
    ///            } detail: {
    ///                Text("My Settings")
    ///            }
    ///        }
    ///    }
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width the sidebar will be locked too.
    ///   - disableWindowStyleFix: Should the window style fix be disabled.
    /// - Returns: A view that has had its NavigationSplitView locked.
    @ViewBuilder
    func lockSidebar(width: CGFloat = 200, disableWindowStyleFix: Bool = false) -> some View {
        self
            .toolbar(removing: .sidebarToggle)
            .toolbar {
                if !disableWindowStyleFix {
                    // Fake macOS out so it shows the title bar normally. Without this, the NavigationSplitView will render weirdly, where the toolbar is slightly hidden.
                    Rectangle().hidden()
                } else {
                    EmptyView()
                }
            }
            .navigationSplitViewColumnWidth(min: width, ideal: width, max: width)
    }
}
