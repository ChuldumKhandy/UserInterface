import UIKit

protocol IGroupsView: UIView {
}

final class GroupsView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customizeView()
    }
}

extension GroupsView: IGroupsView {
}

private extension GroupsView {
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

