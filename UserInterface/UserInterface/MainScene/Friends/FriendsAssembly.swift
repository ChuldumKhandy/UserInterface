import UIKit

final class FriendsAssembly {
    static func build() -> UIViewController {
        let router = FriendsRouter()
        let model = User()
        let presenter = FriendsPresenter(User: model, router: router)
        let controller = FriendsViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
