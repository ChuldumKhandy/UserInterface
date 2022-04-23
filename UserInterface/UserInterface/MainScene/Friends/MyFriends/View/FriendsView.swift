import UIKit

protocol IFriendsViewScene: UIView {
    var getFriendsHandler: (([Friend]) -> Void?)? { get set }
    var openGalleryHandler: (([String]) -> Void)? { get set }
}

final class FriendsView: UIView {
    private let friendsTableView = ListOfFriendsTableView()
    private let friendSearchBar = FriendSearchBar()
    var getFriendsHandler: (([Friend]) -> Void?)?
    var openGalleryHandler: (([String]) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
        self.getFriendsHandler = { [weak self] friends in
            self?.friendsTableView.setFriends(friends: friends)
        }
        self.friendsTableView.selectCellHandler = { [weak self] photos in
            self?.openGalleryHandler?(photos)
        }
}
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customizeView()
    }
}

extension FriendsView: IFriendsViewScene {
}

private extension FriendsView {
    func customizeView() {
        self.backgroundColor = MainPallete.alabaster
        self.addSubview(self.friendsTableView)
        self.friendsTableView.tableHeaderView = self.friendSearchBar
        self.setConstraints()
    }
    
    func setConstraints() {
        self.friendsTableView.translatesAutoresizingMaskIntoConstraints = false
        self.friendsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.friendsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.friendsTableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.friendsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

