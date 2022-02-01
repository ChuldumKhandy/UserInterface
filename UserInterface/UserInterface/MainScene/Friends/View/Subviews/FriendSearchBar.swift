//
//  FriendSearchBar.swift
//  UserInterface
//
//  Created by user on 01.02.2022.
//

import UIKit

final class FriendSearchBar: UISearchBar {
    var searchBarIsEmpty: Bool {
        guard let text = self.text else {
            return false }
        return text.isEmpty
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.customizeSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FriendSearchBar: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

private extension FriendSearchBar {
    func customizeSearchBar() {
        self.barTintColor = MainPallete.alabaster
        self.frame.size.height = FriendsConstraint.heightHeader
        self.placeholder = "Поиск"
    }
}
