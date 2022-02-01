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
    
    func setDataForCell(avatar: UIImage?, name: String) {
        self.avatarImageView.image = avatar
        self.nameLabel.text = name
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }

}

private extension FriendsCell {
    func addSubviews() {
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.nameLabel)
    }
    
    func customizeCell() {
        self.backgroundColor = MainPallete.alabaster
        self.nameLabel.font = MainFont.thonburi(size: FontSize.regular).uiFont
        self.avatarImageView.contentMode = .scaleAspectFit
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
