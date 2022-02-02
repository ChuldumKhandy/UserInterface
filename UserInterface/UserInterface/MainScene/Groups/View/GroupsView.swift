import UIKit

protocol IGroupsView: UIView {
}

final class GroupsView: UIView {
    private let myGroupsTableView = ListOfMyGroupsTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customizeView()
    }
}

extension GroupsView: IGroupsView {
}

private extension GroupsView {
    func customizeView() {
        self.backgroundColor = MainPallete.alabaster
        self.addSubview(self.myGroupsTableView)
        self.setConstraints()
    }
    
    func setConstraints() {
        self.myGroupsTableView.translatesAutoresizingMaskIntoConstraints = false
        self.myGroupsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.myGroupsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.myGroupsTableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.myGroupsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

