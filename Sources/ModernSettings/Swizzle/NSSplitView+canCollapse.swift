//
//  NSSplitView+canCollapse.swift
//  Amoeba
//
//  Created by Taylor Lineman on 2/18/26.
//  Inspired by: https://github.com/jordanbaird/Ice/blob/main/Ice/Swizzling/NSSplitViewItem%2BswizzledCanCollapse.swift
//

import AppKit

extension NSSplitViewItem {
    @MainActor @preconcurrency
    static private var hasSwizzled: Bool = false
    
    @MainActor @preconcurrency
    private static func _swizzle() {
        // Find the original selectors of the two functions we are going to swizzle.
        let originalCanCollapseSelector = #selector(getter: NSSplitViewItem.canCollapse)
        let newCanCollapseSelector = #selector(getter: NSSplitViewItem.customCanCollapse)
        
        // Now we find the actual implementations
        guard let originalMethod = class_getInstanceMethod(NSSplitViewItem.self, originalCanCollapseSelector) else { return }
        guard let customMethod = class_getInstanceMethod(NSSplitViewItem.self, newCanCollapseSelector) else { return }
        
        // A quick swap. Now NSplitView.canCollapse will point to our customCanCollapse function. When you call customCanCollapse it will run the original NSSplitView.canCollapse
        method_exchangeImplementations(originalMethod, customMethod)
        
        hasSwizzled = true
        print("[ModernSettings] Successfully Swizzled NSSplitView.canCollapse!")
    }
    
    @MainActor @preconcurrency
    @objc var customCanCollapse: Bool {
        if self.viewController.view.window?.identifier?.rawValue == SceneID.settings.id {
            return false
        }
        
        // Using self to explicitly silence the call within itself warning. Since we swapped canCollapse and customCanCollapse, calling customCanCollapse calls the original implementation.
        return self.customCanCollapse
    }
    
    /// Swizzles `NSplitView:canCollapse` to prevent collapsing in the custom settings window.
    @MainActor @preconcurrency
    static func swizzle() {
        guard !hasSwizzled else { return }
        _swizzle()
    }
}
