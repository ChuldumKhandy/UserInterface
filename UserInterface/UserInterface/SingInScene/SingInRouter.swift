//
//  SingInRouter.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

protocol ISingInRouter {
    func setRootController(controller: UIViewController)
    func next(controller: UIViewController)
    func addAnimation(animation: CAAnimation)
}

final class SingInRouter {
    private var controller: UIViewController?
}

extension SingInRouter: ISingInRouter {
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    func next(controller: UIViewController) {
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
    func addAnimation(animation: CAAnimation) {
        self.controller?.navigationController?.view.layer.add(animation, forKey: nil)
    }
}
