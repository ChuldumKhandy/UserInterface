//
//  SingInView.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

protocol ISingInView: UIView {
    var checkPasswordHandler: ((_ login: String?, _ password: String?) -> Void)? { get set }
    var registrationHandler: (() -> Void)? { get set }
    var loadingIndicatorHandler: (() -> Void)? { get set }
}

final class SingInView: UIView {
    private let titleLabel = UILabel()
    private let loginTextField = MainTextField()
    private let passwordTextField = MainTextField()
    private let signinButton = MainButton()
    private let registrationButton = MainButton()
    private let textFieldsStackView = UIStackView()
    private let buttonsStackView = UIStackView()
    private let cloudView = CloudView()
    var checkPasswordHandler: ((_ login: String?, _ password: String?) -> Void)?
    var registrationHandler: (() -> Void)?
    var loadingIndicatorHandler: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        self.loadingIndicatorHandler = { [weak self] in
            self?.cloudView.isHidden = false
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
}

extension SingInView: ISingInView {
}

private extension SingInView {
    func setup() {
        self.backgroundColor = MainPallete.marble
        self.cloudView.isHidden = true
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
        self.addSubview(self.cloudView)
    }
    
    func customizeLabel() {
        self.titleLabel.text = "Добро пожаловать!"
        self.titleLabel.font = Font.thonburiStyle(size: FontSize.title, style: .bold).uiFont
        self.titleLabel.textColor = MainPallete.lavender
        self.titleLabel.textAlignment = .center
    }
    
    func customizeStackViews() {
        UIStackView.appearance().axis = .vertical
        UIStackView.appearance().distribution = .equalSpacing
        UIStackView.appearance().alignment = .fill
        UIStackView.appearance().spacing = ViewConstraint.stackViewSpacing
        self.textFieldsStackView.addArrangedSubview(self.loginTextField)
        self.textFieldsStackView.addArrangedSubview(self.passwordTextField)
        self.buttonsStackView.addArrangedSubview(self.signinButton)
        self.buttonsStackView.addArrangedSubview(self.registrationButton)
    }
    
    func customizeTextFields() {
        let attributes = [NSAttributedString.Key.foregroundColor: MainPallete.lavender,
                          .font : Font.thonburi(size: FontSize.regular).uiFont]
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
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: ViewConstraint.top).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: ViewConstraint.margin).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        self.textFieldsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.textFieldsStackView.widthAnchor.constraint(equalToConstant: TextFieldConstraint.width.rawValue).isActive = true
        self.textFieldsStackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: ViewConstraint.margin).isActive = true
        
        self.buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        self.buttonsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.buttonsStackView.widthAnchor.constraint(equalToConstant: ButtonConstraint.width.rawValue).isActive = true
        self.buttonsStackView.topAnchor.constraint(equalTo: self.textFieldsStackView.bottomAnchor, constant: ViewConstraint.margin * 2).isActive = true
        
        self.cloudView.translatesAutoresizingMaskIntoConstraints = false
        self.cloudView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.cloudView.topAnchor.constraint(equalTo: self.textFieldsStackView.bottomAnchor).isActive = true
        self.cloudView.heightAnchor.constraint(equalToConstant: CloudViewConstraint.height).isActive = true
        self.cloudView.widthAnchor.constraint(equalToConstant: CloudViewConstraint.width).isActive = true
    }
}
