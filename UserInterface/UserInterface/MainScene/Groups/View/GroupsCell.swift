//
//  GroupsCell.swift
//  UserInterface
//
//  Created by user on 02.02.2022.
//

import UIKit

final class GroupsCell: UITableViewCell {
    static let identifier = "GroupsTableViewCell"
    private let iconImageView = UIImageView()
    private let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubviews()
        self.customizeCell()
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDataForCell(iconName: String?, name: String) {
        self.iconImageView.image = UIImage(systemName: iconName ?? "questionmark.circle")
        self.nameLabel.text = name
    }
}

private extension GroupsCell {
    func addSubviews() {
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.nameLabel)
    }
    
    func customizeCell() {
        self.backgroundColor = MainPallete.alabaster
        self.nameLabel.font = MainFont.thonburi(size: FontSize.regular).uiFont
        self.iconImageView.contentMode = .scaleAspectFit
    }
    
    func setConstraints() {
        self.iconImageView.translatesAutoresizingMaskIntoConstraints = false
        self.iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: FriendsConstraint.cellMargin).isActive = true
        self.iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.iconImageView.widthAnchor.constraint(equalToConstant: FriendsConstraint.avatarSize).isActive = true
        self.iconImageView.heightAnchor.constraint(equalToConstant: FriendsConstraint.avatarSize).isActive = true
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.leadingAnchor.constraint(equalTo: self.iconImageView.trailingAnchor, constant: FriendsConstraint.cellMargin).isActive = true
        self.nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: FriendsConstraint.cellMargin).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant: FriendsConstraint.avatarSize).isActive = true
    }
}
