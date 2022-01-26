//
//  UserStorage.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import Foundation

protocol IUserStorage {
    func saveUser(user: LogInUser)
    func checkPassword(login: String, passoword: String) -> Bool
}

enum SettingsKeys: String {
    case userLogin
    case userPassword
}

final class UserStorage {
    private let defaults = UserDefaults.standard
}

extension UserStorage: IUserStorage {
    func saveUser(user: LogInUser) {
        defaults.set(user.login, forKey: SettingsKeys.userLogin.rawValue)
        defaults.set(user.password, forKey: SettingsKeys.userPassword.rawValue)
    }
    
    func checkPassword(login: String, passoword: String) -> Bool {
        if (defaults.string(forKey: SettingsKeys.userLogin.rawValue) == login) && (defaults.string(forKey: SettingsKeys.userPassword.rawValue) == passoword) {
            return true
        } else {
            return false
        }
    }
}
