import UIKit

final class GroupsAssembly {
    static func build() -> UIViewController {
        let router = GroupsRouter()
        let model = Group()
        let presenter = GroupsPresenter(model: model, router: router)
        let controller = GroupsViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
