//
//  LogInView.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

protocol ILogInView: UIView {
    var checkPasswordHandler: ((_ login: String?, _ password: String?) -> Void)? { get set }
    var registrationHandler: (() -> Void)? { get set }
}

final class LogInView: UIView {
    private let titleLabel = UILabel()
    private let loginTextField = MainTextField()
    private let passwordTextField = MainTextField()
    private let signinButton = MainButton()
    private let registrationButton = MainButton()
    private let textFieldsStackView = UIStackView()
    private let buttonsStackView = UIStackView()
    var checkPasswordHandler: ((_ login: String?, _ password: String?) -> Void)?
    var registrationHandler: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
}

extension LogInView: ILogInView {
}

private extension LogInView {
    func setup() {
        self.backgroundColor = MainPallete.marble
        self.addSubview()
        self.customizeLabel()
        self.customizeStackViews()
        self.customizeTextFields()
        self.customizeButtons()
        self.setConstraints()
    }
    
    func addSubview() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.textFieldsStackView)
        self.addSubview(self.buttonsStackView)
    }
    
    func customizeLabel() {
        self.titleLabel.text = "Добро пожаловать!"
        self.titleLabel.font = Font.thonburiStyle(size: FontSize.title.rawValue, style: .bold).uiFont
        self.titleLabel.textColor = MainPallete.lavender
        self.titleLabel.textAlignment = .center
    }
    
    func customizeStackViews() {
        UIStackView.appearance().axis = .vertical
        UIStackView.appearance().distribution = .equalSpacing
        UIStackView.appearance().alignment = .fill
        UIStackView.appearance().spacing = ViewConstraint.stackViewSpacing.rawValue
        self.textFieldsStackView.addArrangedSubview(self.loginTextField)
        self.textFieldsStackView.addArrangedSubview(self.passwordTextField)
        self.buttonsStackView.addArrangedSubview(self.signinButton)
        self.buttonsStackView.addArrangedSubview(self.registrationButton)
    }
    
    func customizeTextFields() {
        let attributes = [NSAttributedString.Key.foregroundColor: MainPallete.lavender,
                          .font : Font.thonburi(size: FontSize.regular.rawValue).uiFont]
        self.loginTextField.attributedPlaceholder = NSAttributedString(string: "Телефон или email", attributes: attributes)
        self.passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: attributes)
    }
    
    func customizeButtons() {
        self.signinButton.setTitle("Войти", for: .normal)
        self.signinButton.addTarget(self, action: #selector(self.onSiginButtonTouch), for: .touchUpInside)
        self.registrationButton.backgroundColor = MainPallete.lilac
        self.registrationButton.setTitle("Зарегистрироваться", for: .normal)
        self.registrationButton.addTarget(self, action: #selector(self.onRegistrationButtonTouch), for: .touchUpInside)
    }
    
    @objc func onSiginButtonTouch() {
        self.checkPasswordHandler?(self.loginTextField.text, self.passwordTextField.text)
    }
    
    @objc func onRegistrationButtonTouch() {
        self.registrationHandler?()
    }
    
    func setConstraints() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: ViewConstraint.top.rawValue).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: ViewConstraint.margin.rawValue).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        self.textFieldsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.textFieldsStackView.widthAnchor.constraint(equalToConstant: TextFieldConstraint.width.rawValue).isActive = true
        self.textFieldsStackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: ViewConstraint.margin.rawValue).isActive = true
        
        self.buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        self.buttonsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.buttonsStackView.widthAnchor.constraint(equalToConstant: ButtonConstraint.width.rawValue).isActive = true
        self.buttonsStackView.topAnchor.constraint(equalTo: self.textFieldsStackView.bottomAnchor, constant: ViewConstraint.margin.rawValue * 2).isActive = true
    }
}
