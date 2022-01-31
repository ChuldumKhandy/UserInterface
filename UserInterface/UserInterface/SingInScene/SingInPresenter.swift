//
//  SingInPresenter.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import Foundation

protocol ISingInPresenter {
    func loadView(controller: ISingInViewController, viewScene: ISingInView)
}

final class SingInPresenter {
    private weak var controller: ISingInViewController?
    private weak var viewScene: ISingInView?
    private let userStorage: IUserStorage
    private let router: ISingInRouter
    
    init(router: SingInRouter) {
        self.router = router
        self.userStorage = UserStorage()
    }
}

extension SingInPresenter: ISingInPresenter {
    func loadView(controller: ISingInViewController, viewScene: ISingInView) {
        self.controller = controller
        self.viewScene = viewScene
        self.sigin()
        self.registration()
    }
}

private extension SingInPresenter {
    func sigin() {
        self.viewScene?.checkPasswordHandler = { [weak self] login, password in
            guard let login = login,
                  login.isEmpty == false,
                  let password = password,
                  password.isEmpty == false else {
                self?.controller?.showAlert(message: "Введите логин/пароль")
                return
            }
            
            if (self?.userStorage.checkPassword(login: login, passoword: password)) == true {
                self?.viewScene?.loadingIndicatorHandler?()
                self?.router.next(controller: MainScene.createTabs())
            } else {
                self?.controller?.showAlert(message: "Пароль не верен")
            }
        }
    }
    
    func registration() {
        self.viewScene?.registrationHandler = { [weak self] in
            self?.controller?.registrationAlert()
        }
        self.registerUser()
    }
    
    func registerUser() {
        self.controller?.registrationDataHandler = { [weak self] login, password in
            guard let login = login,
                  login.isEmpty == false,
                  let password = password,
                  password.isEmpty == false else {
                self?.controller?.showAlert(message: "Введите логин и пароль")
                return
            }
            let newUser = LogInDataUser(login: login, password: password)
            self?.userStorage.saveUser(user: newUser)
            self?.controller?.showAlert(message: "Данные сохранены")
        }
    }
}
