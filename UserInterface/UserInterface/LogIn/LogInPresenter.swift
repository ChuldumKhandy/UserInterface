//
//  LogInPresenter.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import Foundation

protocol ILogInPresenter {
    func loadView(controller: ILogInViewController, viewScene: ILogInView)
}

final class LogInPresenter {
    private weak var controller: ILogInViewController?
    private weak var viewScene: ILogInView?
    private let userStorage: IUserStorage
    private let router: ILogInRouter
    
    init(router: LogInRouter) {
        self.router = router
        self.userStorage = UserStorage()
    }
}

extension LogInPresenter: ILogInPresenter {
    func loadView(controller: ILogInViewController, viewScene: ILogInView) {
        self.controller = controller
        self.viewScene = viewScene
        self.sigin()
        self.registration()
    }
}

private extension LogInPresenter {
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
                print("Success")
                self?.viewScene?.loadingIndicatorHandler?()
                //self?.router.next(controller: MainScene.build())
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
            let newUser = LogInUser(login: login, password: password)
            self?.userStorage.saveUser(user: newUser)
            self?.controller?.showAlert(message: "Данные сохранены")
        }
    }
}
