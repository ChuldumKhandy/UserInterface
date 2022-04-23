import Foundation

protocol IFriendsPresenter {
    func loadView(controller: FriendsViewController, viewScene: IFriendsViewScene)
}

final class FriendsPresenter {
    private weak var controller: IFriendsViewController?
    private weak var viewScene: IFriendsViewScene?
    private let router: IFriendsRouter
    private let friends: IFriendModel
    
    init(friends: FriendModel, router: FriendsRouter) {
        self.router = router
        self.friends = friends
    }
}

extension FriendsPresenter: IFriendsPresenter {
    func loadView(controller: FriendsViewController, viewScene: IFriendsViewScene) {
        self.controller = controller
        self.viewScene = viewScene
        self.onTouched()
        self.viewScene?.getFriendsHandler?(self.sortFriends())
        self.viewScene?.openGalleryHandler = { [weak self] photos in
            self?.router.nextVC(controller: PhotoGalleryAssembly.build(photos: photos))
        }
    }
}

private extension FriendsPresenter {
    func sortFriends() -> [Friend] {
        let friends = self.friends.getFriends()
        return friends.sorted { $0.name.uppercased() < $1.name.uppercased() }
    }
    
    func onTouched() {
    }
}

