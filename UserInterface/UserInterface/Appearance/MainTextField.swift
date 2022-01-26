//
//  MainTextField.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

final class MainTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    private func setup() {
        self.borderStyle = .roundedRect
        self.layer.cornerRadius = TextFieldConstraint.radius.rawValue
        self.layer.masksToBounds = true
        self.frame.size.height = TextFieldConstraint.height.rawValue
        self.frame.size.width = TextFieldConstraint.width.rawValue
    }
}
