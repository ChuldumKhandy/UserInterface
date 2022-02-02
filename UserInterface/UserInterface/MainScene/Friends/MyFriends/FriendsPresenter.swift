import Foundation

protocol IFriendsPresenter {
    func loadView(controller: FriendsViewController, viewScene: IFriendsViewScene)
}

final class FriendsPresenter {
    private weak var controller: IFriendsViewController?
    private weak var viewScene: IFriendsViewScene?
    private let router: IFriendsRouter
    private let Friend: IFriend
    
    init(Friend: Friend, router: FriendsRouter) {
        self.router = router
        self.Friend = Friend
    }
}

extension FriendsPresenter: IFriendsPresenter {
    func loadView(controller: FriendsViewController, viewScene: IFriendsViewScene) {
        self.controller = controller
        self.viewScene = viewScene
        self.onTouched()
    }
}

private extension FriendsPresenter {
    func onTouched() {
    }
}

