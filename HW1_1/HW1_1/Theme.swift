//
//  Theme.swift
//  HW1_1
//
//  Created by MacBook Pro on 01/08/23.
//

import Foundation
import UIKit

enum AllAppTheme: String {
    case white
    case blue
    case green
}

/// Theme fields protocol
protocol ThemeProtocol {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var subtitleTextColor: UIColor { get }
    var type: AllAppTheme { get }
}

extension ThemeProtocol {
    var subtitleTextColor: UIColor { .gray }
}

final class Theme {
    static var currentTheme: ThemeProtocol = WhiteTheme()
}

/// theme with white background
final class WhiteTheme: ThemeProtocol {
    var backgroundColor: UIColor = .white
    var textColor: UIColor = .black
    var type: AllAppTheme = .white
    
}

/// theme with blue background
final class BlueTheme: ThemeProtocol {
    var backgroundColor: UIColor = UIColor(red: 228/255, green: 231/255, blue: 255, alpha: 1)
    var textColor: UIColor = .brown
    var type: AllAppTheme = .blue
    
}

/// theme with green background
final class GreenTheme: ThemeProtocol {
    var backgroundColor: UIColor = UIColor(red: 206/255, green: 1, blue: 162/255, alpha: 1)
    var textColor: UIColor = .brown
    var type: AllAppTheme = .green
    
}
