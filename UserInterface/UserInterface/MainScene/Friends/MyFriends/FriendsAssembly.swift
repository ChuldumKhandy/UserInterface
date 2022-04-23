import UIKit

final class FriendsAssembly {
    static func build() -> UIViewController {
        let router = FriendsRouter()
        let model = FriendModel()
        let presenter = FriendsPresenter(friends: model, router: router)
        let controller = FriendsViewController(presenter: presenter)
        router.setRootController(controller: controller)
        return controller
    }
}
