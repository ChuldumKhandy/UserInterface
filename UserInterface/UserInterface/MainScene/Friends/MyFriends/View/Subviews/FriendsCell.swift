//
//  FriendsCell.swift
//  UserInterface
//
//  Created by user on 01.02.2022.
//

import UIKit

final class FriendsCell: UITableViewCell {
    static let identifier = "FriendsTableViewCell"
    private let avatarImageView = UIImageView()
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
    
    func setDataForCell(avatar: String?, name: String) {
        self.nameLabel.text = name
        self.avatarImageView.image = UIImage(named: avatar ?? DefaultValue.noPhoto)
        
    }
}

private extension FriendsCell {
    func addSubviews() {
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.nameLabel)
    }
    
    func customizeCell() {
        self.backgroundColor = MainPallete.alabaster
        self.nameLabel.font = MainFont.thonburi(size: FontSize.regular).uiFont
        self.avatarImageView.contentMode = .scaleAspectFill
        self.avatarImageView.layer.cornerRadius = FriendsConstraint.avatarSize / 2
        self.avatarImageView.layer.masksToBounds = true
    }
    
    func setConstraints() {
        self.avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: FriendsConstraint.cellMargin).isActive = true
        self.avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.avatarImageView.widthAnchor.constraint(equalToConstant: FriendsConstraint.avatarSize).isActive = true
        self.avatarImageView.heightAnchor.constraint(equalToConstant: FriendsConstraint.avatarSize).isActive = true
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: FriendsConstraint.cellMargin).isActive = true
        self.nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: FriendsConstraint.cellMargin).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant: FriendsConstraint.avatarSize).isActive = true
    }
}
