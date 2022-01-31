//
//  SingInAssembly.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

final class SingInAssembly {
    static func build() -> UIViewController {
        let router = SingInRouter()
        let presenter = SingInPresenter(router: router)
        let controller = SingInViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
