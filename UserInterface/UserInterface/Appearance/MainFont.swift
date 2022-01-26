//
//  MainFont.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

enum Font {
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

enum FontSize: CGFloat {
    case title = 22
    case large = 18
    case regular = 16
    case small = 14
    case weight = 300
}
