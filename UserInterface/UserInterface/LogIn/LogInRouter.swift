//
//  LogInRouter.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

protocol ILogInRouter {
    func setRootController(controller: UIViewController)
    func next(controller: UIViewController)
}

final class LogInRouter {
    private var controller: UIViewController?
}

extension LogInRouter: ILogInRouter {
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    func next(controller: UIViewController) {
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
