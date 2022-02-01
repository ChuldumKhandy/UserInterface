import UIKit

final class NewsCell: UICollectionViewCell {
    static let identifier = "NewsCollectionViewCell"
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let newImageView = UIImageView()
    private var heartControl: IButtonLabel
    private var commentControl: IButtonLabel
    private var shareControl: IButtonLabel
    private var browsingControl: IButtonLabel
    
    override init(frame: CGRect) {
        self.heartControl = ButtonLabel()
        self.commentControl = ButtonLabel()
        self.shareControl = ButtonLabel()
        self.browsingControl = ButtonLabel()
        super.init(frame: frame)
        self.backgroundColor = MainPallete.alabaster
        self.addSubview()
        self.customizeCell()
        self.customizeControl()
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDataForCell(name: String, date: String, avatar: UIImage?, description: String?, image: UIImage?) {
        self.nameLabel.text = name
        self.dateLabel.text = date
        self.avatarImageView.image = avatar
        self.descriptionLabel.text = description
        self.newImageView.image = image
    }
}

private extension NewsCell {
    func addSubview() {
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.dateLabel)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.newImageView)
        self.contentView.addSubview(self.heartControl)
        self.contentView.addSubview(self.commentControl)
        self.contentView.addSubview(self.shareControl)
        self.contentView.addSubview(self.browsingControl)
    }
    
    func customizeCell() {
        self.nameLabel.font = MainFont.thonburi(size: FontSize.regular).uiFont
        self.dateLabel.font = MainFont.thonburiStyle(size: FontSize.small, style: .light).uiFont
        self.dateLabel.textColor = .gray
        self.descriptionLabel.text = description
        self.descriptionLabel.font = MainFont.thonburi(size: FontSize.regular).uiFont
        self.newImageView.contentMode = .scaleAspectFit
    }
    
    func customizeControl() {
        self.heartControl.setNormalImage(systemName: "heart")
        self.commentControl.setNormalImage(systemName: "bubble.left")
        self.shareControl.setNormalImage(systemName: "arrowshape.turn.up.right")
        self.browsingControl.setNormalImage(systemName: "eye")
    }
    
    func setConstraints() {
        self.avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: NewsConstraint.cellMargin).isActive = true
        self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.avatarImageView.widthAnchor.constraint(equalToConstant: NewsConstraint.cellHeader).isActive = true
        self.avatarImageView.heightAnchor.constraint(equalToConstant: NewsConstraint.cellHeader).isActive = true
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: NewsConstraint.cellHeader + NewsConstraint.cellMargin).isActive = true
        self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: NewsConstraint.cellMargin).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant: NewsConstraint.cellHeader / 2).isActive = true
        
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: NewsConstraint.cellHeader + NewsConstraint.cellMargin).isActive = true
        self.dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: NewsConstraint.cellHeader / 2).isActive = true
        self.dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -NewsConstraint.cellMargin).isActive = true
        self.dateLabel.heightAnchor.constraint(equalToConstant: NewsConstraint.cellHeader / 2).isActive = true
        
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: NewsConstraint.cellMargin).isActive = true
        self.descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: NewsConstraint.cellHeader).isActive = true
        self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -NewsConstraint.cellMargin).isActive = true
        self.descriptionLabel.heightAnchor.constraint(equalToConstant: NewsConstraint.cellHeader).isActive = true
        
        self.newImageView.translatesAutoresizingMaskIntoConstraints = false
        self.newImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: NewsConstraint.cellMargin).isActive = true
        self.newImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2 * NewsConstraint.cellHeader).isActive = true
        self.newImageView.widthAnchor.constraint(equalToConstant: NewsConstraint.width).isActive = true
        self.newImageView.heightAnchor.constraint(equalToConstant: NewsConstraint.width).isActive = true
        
        self.heartControl.translatesAutoresizingMaskIntoConstraints = false
        self.heartControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: NewsConstraint.cellMargin).isActive = true
        self.heartControl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.heartControl.widthAnchor.constraint(equalToConstant: NewsConstraint.controlWidth).isActive = true
        self.heartControl.heightAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        
        self.commentControl.translatesAutoresizingMaskIntoConstraints = false
        self.commentControl.leadingAnchor.constraint(equalTo: self.heartControl.trailingAnchor, constant: NewsConstraint.cellMargin).isActive = true
        self.commentControl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.commentControl.widthAnchor.constraint(equalToConstant: NewsConstraint.controlWidth).isActive = true
        self.commentControl.heightAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        
        self.shareControl.translatesAutoresizingMaskIntoConstraints = false
        self.shareControl.leadingAnchor.constraint(equalTo: self.commentControl.trailingAnchor, constant: NewsConstraint.cellMargin).isActive = true
        self.shareControl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.shareControl.widthAnchor.constraint(equalToConstant: NewsConstraint.controlWidth).isActive = true
        self.shareControl.heightAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        
        self.browsingControl.translatesAutoresizingMaskIntoConstraints = false
        self.browsingControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -NewsConstraint.cellMargin).isActive = true
        self.browsingControl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.browsingControl.widthAnchor.constraint(equalToConstant: NewsConstraint.controlWidth).isActive = true
        self.browsingControl.heightAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
    }
}
