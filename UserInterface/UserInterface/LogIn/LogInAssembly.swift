//
//  LogInAssembly.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

final class LogInAssembly {
    static func build() -> UIViewController {
        let router = LogInRouter()
        let presenter = LogInPresenter(router: router)
        let controller = LogInViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
