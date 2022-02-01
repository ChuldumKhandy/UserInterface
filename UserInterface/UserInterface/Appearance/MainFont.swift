//
//  MainFont.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

enum MainFont {
    enum Style: String {
            case bold = "Bold"
            case light = "Light"
        }
    case thonburi(size: CGFloat)
    case thonburiStyle(size: CGFloat, style: Style)

    var uiFont: UIFont {
        switch self {
        case .thonburi(let size):
            return UIFont(name: "Thonburi", size: size)!
        case .thonburiStyle(let size, let style):
                return UIFont(name: "Thonburi-\(style.rawValue)", size: size)!
        }
    }
}

enum FontSize {
    static let title: CGFloat = 22
    static let large: CGFloat = 18
    static let regular: CGFloat = 16
    static let small: CGFloat = 12
    static let weight: CGFloat = 300
}
