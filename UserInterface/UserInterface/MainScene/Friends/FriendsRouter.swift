import UIKit

protocol IFriendsRouter {
    func setRootController(controller: UIViewController)
    func nextVC(controller: UIViewController)
}

final class FriendsRouter {
    private var controller: UIViewController?
}

extension FriendsRouter: IFriendsRouter {
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    func nextVC(controller: UIViewController) {
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
