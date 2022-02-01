import UIKit

final class FriendsAssembly {
    static func build() -> UIViewController {
        let router = FriendsRouter()
        let model = Friend()
        let presenter = FriendsPresenter(Friend: model, router: router)
        let controller = FriendsViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
