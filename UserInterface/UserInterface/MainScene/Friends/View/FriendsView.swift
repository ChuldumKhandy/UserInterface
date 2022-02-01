import UIKit

protocol IFriendsViewScene: UIView {
}

final class FriendsView: UIView {
    private let friendsTableView = ListOfFriendsTableView()
    private let friendSearchBar = FriendSearchBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
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

