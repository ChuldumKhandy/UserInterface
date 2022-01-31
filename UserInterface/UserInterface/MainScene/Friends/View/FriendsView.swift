import UIKit

protocol IFriendsViewScene: UIView {
}

final class FriendsView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customizeView()
    }
}

extension FriendsView: IFriendsViewScene {
}

private extension FriendsView {
    func customizeView() {
        self.backgroundColor = .brown
        self.addSubviews()
        self.customizeButton()
        self.setConstraints()
    }
    
    func addSubviews() {
    }
    
    func customizeLabels() {
    }
      
    func customizeButton() {
    }
    
    func setConstraints() {
        //self..translatesAutoresizingMaskIntoConstraints = false
    }
}

