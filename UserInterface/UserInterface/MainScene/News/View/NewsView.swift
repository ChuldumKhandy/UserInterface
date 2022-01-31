import UIKit

protocol INewsView: UIView {
}

final class NewsView: UIView {
    private let newsCollection = NewsCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.customizeView()
    }
}

extension NewsView: INewsView {
}

private extension NewsView {
    func customizeView() {
        self.backgroundColor = MainPallete.alabaster
        self.addSubview(self.newsCollection)
        self.setConstraints()
    }

    func setConstraints() {
        self.newsCollection.translatesAutoresizingMaskIntoConstraints = false
        self.newsCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.newsCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.newsCollection.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.newsCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

