//
//  ListOfMyGroupTableView.swift
//  UserInterface
//
//  Created by user on 02.02.2022.
//

import UIKit

final class ListOfMyGroupsTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.customizeTableView()
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ListOfMyGroupsTableView: UITableViewDelegate {
}

extension ListOfMyGroupsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupsCell.identifier, for: indexPath) as? GroupsCell else {
            return UITableViewCell() }
        
        let group = Group()
        cell.setDataForCell(iconName: group.iconName, name: String(indexPath.row) + group.groupName )
        
        return cell
    }
}

private extension ListOfMyGroupsTableView {
    func customizeTableView () {
        self.backgroundColor = MainPallete.alabaster
        self.register(GroupsCell.self, forCellReuseIdentifier: GroupsCell.identifier)
        self.rowHeight = FriendsConstraint.height
        self.separatorColor = MainPallete.lavender
    }
}
