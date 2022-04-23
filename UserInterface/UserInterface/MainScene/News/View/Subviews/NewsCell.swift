import UIKit

final class NewsCell: UICollectionViewCell {
    static let identifier = "NewsCollectionViewCell"
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let newImageView = UIImageView()
    private let heartButton = UIButton()
    private let heartCounterLabel = UILabel()
    private let commentButton = UIButton()
    private let commentCounterLabel = UILabel()
    private let shareButton = UIButton()
    private let shareCounterLabel = UILabel()
    private let browsingButton = UIButton()
    private let browsingCounterLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = MainPallete.alabaster
        self.addSubview()
        self.customizeCell()
        self.touchedButton()
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDataForCell(name: String, date: String, avatar: String?, description: String?, image: String?) {
        self.nameLabel.text = name
        self.dateLabel.text = date
        self.descriptionLabel.text = description
        self.checkImage(imageView: self.avatarImageView, imageName: avatar)
        self.checkImage(imageView: self.newImageView, imageName: image)
    }
    
    func setDataForCounter(heartCounter: Int, commentCounter: Int?, shareCounter: Int?, browsingCounter: Int?) {
        self.heartCounterLabel.text = String(heartCounter)
        self.isHiddenLabel(counterLabel: self.commentCounterLabel, counter: commentCounter)
        self.isHiddenLabel(counterLabel: self.shareCounterLabel, counter: shareCounter)
        self.isHiddenLabel(counterLabel: self.browsingCounterLabel, counter: browsingCounter)
    }
}

private extension NewsCell {
    func isHiddenLabel(counterLabel: UILabel, counter: Int?) {
        if let counter = counter {
            counterLabel.text = String(counter)
        } else {
            counterLabel.isHidden = true
        }
    }
    
    func checkImage(imageView: UIImageView, imageName: String?) {
        if let image = UIImage(named: imageName ?? DefaultValue.noPhoto) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: DefaultValue.noPhoto)
        }
    }
    
    func touchedButton() {
        self.heartButton.addTarget(self, action: #selector(self.touchedHeart), for: .touchUpInside)
        self.commentButton.addTarget(self, action: #selector(self.touchedComment), for: .touchUpInside)
        self.shareButton.addTarget(self, action: #selector(self.touchedShare), for: .touchUpInside)
    }
    
    @objc func touchedHeart() {
        self.heartButton.tintColor = .red
        self.heartCounterLabel.textColor = .red
        self.heartButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    @objc func touchedComment() {
        self.commentButton.setBackgroundImage(UIImage(systemName: "bubble.left.fill"), for: .highlighted)
    }
    
    @objc func touchedShare() {
        self.shareButton.setBackgroundImage(UIImage(systemName: "arrowshape.turn.up.right.fill"), for: .highlighted)
    }
    
    func addSubview() {
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.dateLabel)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.newImageView)
        self.contentView.addSubview(self.heartCounterLabel)
        self.contentView.addSubview(self.heartButton)
        self.contentView.addSubview(self.commentButton)
        self.contentView.addSubview(self.commentCounterLabel)
        self.contentView.addSubview(self.shareButton)
        self.contentView.addSubview(self.shareCounterLabel)
        self.contentView.addSubview(self.browsingButton)
        self.contentView.addSubview(self.browsingCounterLabel)
    }
    
    func customizeCell() {
        self.nameLabel.font = MainFont.thonburi(size: FontSize.regular).uiFont
        self.dateLabel.font = MainFont.thonburiStyle(size: FontSize.small, style: .light).uiFont
        self.dateLabel.textColor = .gray
        self.descriptionLabel.font = MainFont.thonburi(size: FontSize.regular).uiFont
       
        self.avatarImageView.contentMode = .scaleToFill
        self.avatarImageView.layer.cornerRadius = NewsConstraint.cellHeader / 2
        self.avatarImageView.layer.masksToBounds = true
        self.newImageView.contentMode = .scaleAspectFill

        self.heartCounterLabel.textColor = .gray
        self.commentCounterLabel.textColor = .gray
        self.shareCounterLabel.textColor = .gray
        self.browsingCounterLabel.textColor = .gray
        UIButton.appearance().tintColor = .gray
        self.heartButton.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        self.commentButton.setBackgroundImage(UIImage(systemName: "bubble.left"), for: .normal)
        self.shareButton.setBackgroundImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        self.browsingButton.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
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
        
        self.heartButton.translatesAutoresizingMaskIntoConstraints = false
        self.heartButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: NewsConstraint.cellMargin).isActive = true
        self.heartButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.heartButton.widthAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        self.heartButton.heightAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        
        self.heartCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        self.heartCounterLabel.leadingAnchor.constraint(equalTo: self.heartButton.trailingAnchor).isActive = true
        self.heartCounterLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.heartCounterLabel.widthAnchor.constraint(equalToConstant: NewsConstraint.counterWidth).isActive = true
        self.heartCounterLabel.heightAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        
        self.commentButton.translatesAutoresizingMaskIntoConstraints = false
        self.commentButton.leadingAnchor.constraint(equalTo: self.heartCounterLabel.trailingAnchor, constant: NewsConstraint.cellMargin).isActive = true
        self.commentButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.commentButton.widthAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        self.commentButton.heightAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        
        self.commentCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        self.commentCounterLabel.leadingAnchor.constraint(equalTo: self.commentButton.trailingAnchor).isActive = true
        self.commentCounterLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.commentCounterLabel.widthAnchor.constraint(equalToConstant: NewsConstraint.counterWidth).isActive = true
        self.commentCounterLabel.heightAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        
        self.shareButton.translatesAutoresizingMaskIntoConstraints = false
        self.shareButton.leadingAnchor.constraint(equalTo: self.commentCounterLabel.trailingAnchor, constant: NewsConstraint.cellMargin).isActive = true
        self.shareButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.shareButton.widthAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        self.shareButton.heightAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        
        self.shareCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        self.shareCounterLabel.leadingAnchor.constraint(equalTo: self.shareButton.trailingAnchor).isActive = true
        self.shareCounterLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.shareCounterLabel.widthAnchor.constraint(equalToConstant: NewsConstraint.counterWidth).isActive = true
        self.shareCounterLabel.heightAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        
        self.browsingButton.translatesAutoresizingMaskIntoConstraints = false
        self.browsingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -NewsConstraint.cellMargin).isActive = true
        self.browsingButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.browsingButton.widthAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        self.browsingButton.heightAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
        
        self.browsingCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        self.browsingCounterLabel.trailingAnchor.constraint(equalTo: self.browsingButton.leadingAnchor).isActive = true
        self.browsingCounterLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.browsingCounterLabel.widthAnchor.constraint(equalToConstant: NewsConstraint.counterWidth).isActive = true
        self.browsingCounterLabel.heightAnchor.constraint(equalToConstant: NewsConstraint.cellFooter).isActive = true
    }
}
