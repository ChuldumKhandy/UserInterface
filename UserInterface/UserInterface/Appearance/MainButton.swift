//
//  MainButton.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

final class MainButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = ButtonConstraint.radius.rawValue
        self.clipsToBounds = true
        self.backgroundColor = MainPallete.lavender
        self.frame.size.height = ButtonConstraint.height.rawValue
        self.frame.size.width = ButtonConstraint.width.rawValue
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = Font.thonburi(size: FontSize.regular).uiFont
    }
}
