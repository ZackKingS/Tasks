//
//  ThemeBarStylePicker.swift
//  SwiftTheme
//
//  Created by Gesen on 2017/1/28.
//  Copyright © 2017年 Gesen. All rights reserved.
//

import UIKit

public final class ThemeBarStylePicker: ThemePicker {
    
    public convenience init(keyPath: String) {
        self.init(v: { ThemeBarStylePicker.getStyle(stringStyle: ThemeManager.string(for: keyPath) ?? "") })
    }
    
    public convenience init(keyPath: String, map: @escaping (Any?) -> UIBarStyle?) {
        self.init(v: { map(ThemeManager.value(for: keyPath)) })
    }
    
    public convenience init(styles: UIBarStyle...) {
        self.init(v: { ThemeManager.element(for: styles) })
    }
    
    public required convenience init(arrayLiteral elements: UIBarStyle...) {
        self.init(v: { ThemeManager.element(for: elements) })
    }
    
    public required convenience init(stringLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public required convenience init(unicodeScalarLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public class func pickerWithKeyPath(_ keyPath: String) -> ThemeBarStylePicker {
        return ThemeBarStylePicker(keyPath: keyPath)
    }
    
    public class func pickerWithKeyPath(_ keyPath: String, map: @escaping (Any?) -> UIBarStyle?) -> ThemeBarStylePicker {
        return ThemeBarStylePicker(v: { map(ThemeManager.value(for: keyPath)) })
    }
    
    public class func pickerWithStyles(_ styles: [UIBarStyle]) -> ThemeBarStylePicker {
        return ThemeBarStylePicker(v: { ThemeManager.element(for: styles) })
    }
    
    public class func pickerWithStringStyles(_ styles: [String]) -> ThemeBarStylePicker {
        return ThemeBarStylePicker(v: { ThemeManager.element(for: styles.map(getStyle)) })
    }
    
    class func getStyle(stringStyle: String) -> UIBarStyle {
        switch stringStyle.lowercased() {
        case "default"  : return .default
        case "black"    : return .black
        default: return .default
        }
    }
    
}

extension ThemeBarStylePicker: ExpressibleByArrayLiteral {}
extension ThemeBarStylePicker: ExpressibleByStringLiteral {}
