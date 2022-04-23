//
//  ListOfFriendsTableView.swift
//  UserInterface
//
//  Created by user on 01.02.2022.
//

import UIKit

final class ListOfFriendsTableView: UITableView {
    private var friends = [Friend]()
    var selectCellHandler: (([String]) -> Void)?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.customizeTableView()
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setFriends(friends: [Friend]) {
        self.friends = friends
    }
}

extension ListOfFriendsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var photoGallery = self.friends[indexPath.row].image ?? []
        photoGallery.insert(self.friends[indexPath.row].avatar ?? DefaultValue.noPhoto, at: 0)
        self.selectCellHandler?(photoGallery)
    }
}

extension ListOfFriendsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.identifier, for: indexPath) as? FriendsCell else {
            return UITableViewCell() }
        
        cell.setDataForCell(avatar: self.friends[indexPath.row].avatar, name: self.friends[indexPath.row].name )
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
