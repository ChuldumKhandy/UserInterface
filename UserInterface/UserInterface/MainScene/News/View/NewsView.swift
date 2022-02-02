import UIKit

protocol INewsView: UIView {
    var getNewsHandler: (([New]) -> Void?)? { get set }
}

final class NewsView: UIView {
    private let newsCollection = NewsCollectionView()
    var getNewsHandler: (([New]) -> Void?)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customizeView()
        self.getNewsHandler = { [weak self] news in
            self?.newsCollection.setNews(news: news)
        }
        
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

