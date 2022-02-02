//
//  Constraints.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

enum ViewConstraint  {
    static let stackViewSpacing: CGFloat = 16
    static let margin: CGFloat = 40
    static let top: CGFloat = 200
}

enum CloudViewConstraint {
    static let height: CGFloat = 60
    static let width: CGFloat = 120
}

enum NewsConstraint {
    static let width = UIScreen.main.bounds.width
    static let height = NewsConstraint.width + NewsConstraint.cellHeader * 2 + NewsConstraint.cellFooter
    static let minimumLineSpacing: CGFloat = 16
    static let cellMargin: CGFloat = 16
    static let cellHeader: CGFloat = 30
    static let cellFooter: CGFloat = 20
    static let counterWidth: CGFloat = 30
}

enum FriendsConstraint {
    static let width = UIScreen.main.bounds.width
    static let height: CGFloat = 60
    static let heightHeader: CGFloat = 50
    static let cellMargin: CGFloat = 16
    static let avatarSize: CGFloat = 50
}

enum TextFieldConstraint: CGFloat  {
    case radius = 10
    case height = 40
    case width = 260
}

enum ButtonConstraint: CGFloat {
    case radius = 10
    case height = 40
    case width = 205
}
