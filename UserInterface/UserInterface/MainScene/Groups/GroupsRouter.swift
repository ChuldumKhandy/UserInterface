import UIKit

protocol IGroupsRouter {
    func setRootController(controller: UIViewController)
    func nextVC(controller: UIViewController)
}

final class GroupsRouter {
    private var controller: UIViewController?
}

extension GroupsRouter: IGroupsRouter {
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    func nextVC(controller: UIViewController) {
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
