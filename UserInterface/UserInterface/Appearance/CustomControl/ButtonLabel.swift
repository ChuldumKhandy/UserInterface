//
//  Button+Label.swift
//  UserInterface
//
//  Created by user on 28.01.2022.
//

import UIKit

protocol IButtonLabel: UIView {
    func setNormalImage(systemName: String)
}

final class ButtonLabel: UIView {
    private let button = UIButton()
    private let counterLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ButtonLabel {
    func customizeView() {
        self.addSubview(self.button)
        self.addSubview(self.counterLabel)
        self.button.tintColor = .gray
        self.counterLabel.isHidden = true
        self.counterLabel.textColor = .gray
        self.counterLabel.text = "0"
        self.setConstraints()
    }
    
    func setConstraints() {
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.button.widthAnchor.constraint(equalToConstant: NewsConstraint.controlWidth / 2).isActive = true
        self.button.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.counterLabel.translatesAutoresizingMaskIntoConstraints = false
        self.counterLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.counterLabel.leadingAnchor.constraint(equalTo: self.button.trailingAnchor).isActive = true
        self.counterLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.counterLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension ButtonLabel: IButtonLabel {
    func setNormalImage(systemName: String) {
        self.button.setBackgroundImage(UIImage(systemName: systemName), for: .normal)
    }
}
