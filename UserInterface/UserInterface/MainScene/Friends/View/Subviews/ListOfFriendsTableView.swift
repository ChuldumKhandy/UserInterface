//
//  ListOfFriendsTableView.swift
//  UserInterface
//
//  Created by user on 01.02.2022.
//

import UIKit

final class ListOfFriendsTableView: UITableView {
    
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

extension ListOfFriendsTableView: UITableViewDelegate {
}

extension ListOfFriendsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.identifier, for: indexPath) as? FriendsCell else {
            return UITableViewCell() }
        
        let friend = Friend()
        cell.setDataForCell(avatar: friend.avatar, name: String(indexPath.row) + friend.name )
        
        return cell
    }
}

private extension ListOfFriendsTableView {
    func customizeTableView () {
        self.backgroundColor = MainPallete.alabaster
        self.register(FriendsCell.self, forCellReuseIdentifier: FriendsCell.identifier)
        self.rowHeight = FriendsConstraint.height
        self.separatorColor = MainPallete.lavender
    }
}
