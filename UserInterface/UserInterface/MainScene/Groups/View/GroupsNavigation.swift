import UIKit

protocol IGroupsNavigation: UIView {
    func loadView(controller: GroupsViewController)
}

final class GroupsNavigation: UIView {
    private weak var controller: GroupsViewController?
}

extension GroupsNavigation: IGroupsNavigation {
    func loadView(controller: GroupsViewController) {
        self.controller = controller
        self.customizeNavigation()
    }
}

private extension GroupsNavigation {
    func customizeNavigation() {
        self.controller?.navigationController?.navigationBar.barTintColor = MainPallete.alabaster
        self.controller?.navigationController?.navigationBar.isTranslucent = false
        self.controller?.navigationController?.navigationBar.shadowImage = UIImage()
        self.controller?.title = "Мои группы"
        self.controller?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: MainFont.thonburi(size: FontSize.title).uiFont]
    }
}
