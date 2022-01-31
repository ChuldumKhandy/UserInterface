import UIKit

protocol IFriendsNavigation: UIView {
    func loadView(controller: FriendsViewController)
}

final class FriendsNavigation: UIView {
    private weak var controller: FriendsViewController?
}

extension FriendsNavigation: IFriendsNavigation {
    func loadView(controller: FriendsViewController) {
        self.controller = controller
        self.customizeNavigation()
    }
}

private extension FriendsNavigation {
    func customizeNavigation() {
        self.controller?.navigationController?.navigationBar.barTintColor = MainPallete.marble
        self.controller?.navigationController?.navigationBar.isTranslucent = false
        self.controller?.navigationController?.navigationBar.shadowImage = UIImage()
    }
}
