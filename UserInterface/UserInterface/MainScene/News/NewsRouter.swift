import UIKit

protocol INewsRouter {
    func setRootController(controller: UIViewController)
    func nextVC(controller: UIViewController)
}

final class NewsRouter {
    private var controller: UIViewController?
}

extension NewsRouter: INewsRouter {
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    func nextVC(controller: UIViewController) {
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
