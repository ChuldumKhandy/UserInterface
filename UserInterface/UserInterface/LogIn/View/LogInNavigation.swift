//
//  LogInNavigation.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

protocol ILogInNavigation {
    func loadView(controller: LogInViewController)
}

final class LogInNavigation: UIView {
    private weak var controller: LogInViewController?
    
    private func customizeNavigation() {
        self.controller?.navigationController?.navigationBar.barTintColor = MainPallete.marble
        self.controller?.navigationController?.navigationBar.isTranslucent = false
        self.controller?.navigationController?.navigationBar.shadowImage = UIImage()
    }
}

extension LogInNavigation: ILogInNavigation {
    func loadView(controller: LogInViewController) {
        self.controller = controller
        self.customizeNavigation()
    }
}
